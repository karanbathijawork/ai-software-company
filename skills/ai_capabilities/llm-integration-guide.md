# LLM Integration Guide

Use this guide when building AI-powered features into a product. It covers when to use an LLM, how to integrate Claude reliably, and how to handle the production concerns that are specific to AI features.

---

## When to use an LLM

Use an LLM when the task requires understanding or generating natural language in a way that cannot be handled by a deterministic algorithm.

**Good fits:**
- Reviewing, summarizing, or explaining user-provided documents
- Generating structured output from unstructured input (extract data from a resume, classify support tickets)
- Conversational interfaces where the input is unpredictable
- Drafting or rewriting text based on user intent
- Answering questions over a specific knowledge base (RAG)

**Poor fits:**
- Simple form validation or data transformation — use deterministic code
- Tasks where 100% accuracy is required and there is no human review — LLMs make mistakes
- High-frequency, low-value tasks where API cost would outweigh the value

---

## Default model choices

See `skills/ai_capabilities/ai-capabilities-reference.md` and `ai/model_configs/model-selection-guide.md` for full guidance.

Quick reference for AI product features:

| Use case | Model |
|---|---|
| Complex reasoning, multi-document synthesis | claude-opus-4-8 |
| Most product AI features (review, generate, classify) | claude-sonnet-4-6 |
| High-volume, low-complexity tasks (tagging, extraction) | claude-haiku-4-5-20251001 |

---

## Basic integration pattern (Claude API)

```typescript
import Anthropic from "@anthropic-ai/sdk";

const client = new Anthropic({
  apiKey: process.env.ANTHROPIC_API_KEY,
});

async function callClaude(userInput: string): Promise<string> {
  const message = await client.messages.create({
    model: "claude-sonnet-4-6",
    max_tokens: 1024,
    system: "You are a helpful assistant. [role-specific instructions here]",
    messages: [{ role: "user", content: userInput }],
  });

  const block = message.content[0];
  if (block.type !== "text") throw new Error("Unexpected response type");
  return block.text;
}
```

---

## Streaming responses

For user-facing features where the response takes more than 1–2 seconds, stream the output to avoid a blank loading state.

```typescript
async function streamClaude(userInput: string, onChunk: (text: string) => void) {
  const stream = await client.messages.stream({
    model: "claude-sonnet-4-6",
    max_tokens: 1024,
    system: "Your system prompt here.",
    messages: [{ role: "user", content: userInput }],
  });

  for await (const chunk of stream) {
    if (
      chunk.type === "content_block_delta" &&
      chunk.delta.type === "text_delta"
    ) {
      onChunk(chunk.delta.text);
    }
  }

  return await stream.finalMessage();
}
```

---

## Structured output

When you need the LLM to return data in a specific format (JSON, a list, a table), ask for it explicitly in the system prompt and parse the output.

**In the system prompt:**
```
Always respond with valid JSON matching this structure:
{
  "score": number between 1 and 10,
  "summary": string under 100 words,
  "suggestions": array of strings
}
Do not include any text outside the JSON.
```

**In code:**
```typescript
const raw = await callClaude(input);
try {
  const result = JSON.parse(raw);
  // validate shape with Zod
} catch {
  // log and return a graceful error to the user
}
```

Use Zod to validate the parsed output matches the expected shape before using it.

---

## Prompt design for production

**Be specific about the role.** The system prompt should tell Claude exactly who it is and what it is doing.

```
You are a resume reviewer for job seekers. Your job is to give specific, actionable feedback on a resume.
Focus on: clarity, relevance to the target role, quantified achievements, and formatting.
Do not give generic advice. Every piece of feedback must reference a specific section or sentence in the resume.
```

**Tell Claude what NOT to do.** This prevents common failure modes.

```
Do not mention things the resume does well unless the user asks.
Do not suggest completely rewriting the resume.
Do not comment on career choices or personal decisions.
```

**Ask Claude to state its reasoning.** For complex judgements, asking Claude to explain its reasoning produces more accurate and consistent output.

**Test prompts with a range of inputs** before shipping. Include edge cases: empty input, very short input, very long input, input in a different language, adversarial input designed to redirect the prompt.

---

## Context window management

Every model has a context window limit. In production, user inputs can be very long.

**Strategies:**
- Truncate input that exceeds a safe limit and tell the user what was cut
- Chunk long documents and process sections separately, then combine
- Use summarization to compress earlier conversation history for multi-turn chats
- For RAG, retrieve only the most relevant chunks rather than the entire knowledge base

**Practical limits for user-facing features:**
- Warn users when their input exceeds ~8,000 words
- For document processing, process up to ~50 pages per call; paginate beyond that

---

## Error handling

The Claude API can return errors (rate limits, server errors, timeouts). Handle these gracefully.

```typescript
import Anthropic from "@anthropic-ai/sdk";

try {
  const result = await callClaude(input);
  return result;
} catch (error) {
  if (error instanceof Anthropic.RateLimitError) {
    // retry after delay or return a specific message to the user
    throw new Error("The AI service is busy. Please try again in a moment.");
  }
  if (error instanceof Anthropic.APIError) {
    // log the full error server-side; return a generic message to the user
    console.error("Claude API error:", error.status, error.message);
    throw new Error("Something went wrong. Please try again.");
  }
  throw error;
}
```

**Never expose raw API errors to users.** Log them server-side and return a friendly message.

---

## Cost management

LLM API calls have a per-token cost. For production products:

- Cache responses for identical or near-identical inputs (especially for expensive Opus calls)
- Set `max_tokens` to the minimum needed for your use case — do not leave it at the maximum
- Use Haiku for classification and extraction tasks; reserve Sonnet/Opus for generation and reasoning
- Log token usage per call to detect unexpectedly expensive requests early
- Set spending limits in the Anthropic console

---

## RAG (Retrieval Augmented Generation)

Use RAG when the LLM needs to answer questions based on a specific knowledge base (your docs, a user's uploaded files, a product catalogue).

**Basic RAG pattern:**
1. Chunk the source documents into ~500-word segments
2. Embed each chunk using an embedding model
3. Store embeddings in a vector database (Supabase pgvector, Pinecone, Qdrant)
4. At query time: embed the user's question, retrieve the top-K most similar chunks
5. Pass the retrieved chunks + the user's question to Claude in the prompt

**Default stack for RAG:**
- Embeddings: `text-embedding-3-small` (OpenAI) or Voyage AI embeddings
- Vector storage: Supabase with pgvector (already in the default stack)
- Retrieval: cosine similarity, top 5 chunks

---

## Testing AI features

AI outputs are non-deterministic, so testing requires a different approach than standard unit tests.

**What to test deterministically:**
- The prompt is sent to the API (mock the API in unit tests)
- The response is parsed correctly
- Errors are handled gracefully
- Input validation catches empty or malformed input before the API call

**What to test with evaluation:**
- Maintain a set of 10–20 golden examples: known inputs with known acceptable outputs
- Run these examples manually (or in a CI evaluation job) and check that outputs are in the acceptable range
- When you change a prompt, run the golden set and review the diff before shipping

**Adversarial testing:**
- Test with inputs designed to jailbreak or redirect the prompt
- Test with inputs in unexpected languages
- Test with inputs that are empty, very short, or very long
- Test with inputs that contain HTML, SQL, or code

---

## Safety and content moderation

For consumer-facing AI features:
- Use Claude's built-in safety training as the first layer
- Add an explicit instruction in the system prompt: "If the user's input is inappropriate, harmful, or off-topic, respond with: [specific message]"
- For high-risk domains (medical, legal, financial), add a disclaimer and do not allow Claude to give advice — only information
- Log a sample of AI inputs and outputs for ongoing quality review

---

## When NOT to use the LLM

Replace an LLM call with deterministic code when:
- The task is pure formatting, sorting, or filtering
- The input is structured and the output is predictable
- The task runs more than ~100 times per minute and cost or latency is a constraint
- 100% accuracy is required and the output cannot be reviewed by a human
