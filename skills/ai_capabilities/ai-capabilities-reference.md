# AI Capabilities Reference

Use this guide to understand what each Claude model and each agent type can reliably do, and where to use them.

---

## What Claude is reliable at

| Capability | Reliability | Notes |
|---|---|---|
| Writing and editing prose | Very high | Product briefs, docs, user stories |
| Structured output (JSON, YAML, Markdown) | Very high | Works best with explicit output format in the prompt |
| Code generation | High | Best for well-understood patterns; always review output |
| Code review and debugging | High | Catches logical and security issues well |
| Summarization | Very high | Works across long documents |
| Reasoning and trade-off analysis | High | Opus models perform better on complex multi-factor decisions |
| Following multi-step workflows | High | Works best when steps are explicit and sequential |
| Ambiguity resolution | Medium | Prefers to ask; configure agents to make assumptions when possible |
| Long-context synthesis | Medium-High | Degrades with very long contexts — keep inputs focused |

---

## What Claude is less reliable at

| Capability | Notes |
|---|---|
| Exact arithmetic | Always verify numerical outputs |
| Up-to-date facts | Knowledge cutoff applies — do not rely on Claude for current events or prices |
| Predicting runtime behavior | Test all generated code before shipping |
| Consistent formatting without explicit instructions | Always specify the output format |

---

## Capability by agent role

| Agent | Core AI Capabilities Used |
|---|---|
| AI Orchestrator | Reasoning, sequencing, conflict resolution, summarization |
| Product Manager | Problem reframing, user story generation, scope decision-making |
| Solution Architect | Architecture reasoning, trade-off analysis, documentation |
| Technical Lead | Task decomposition, technical writing, dependency analysis |
| Frontend / Backend Engineer | Code generation, debugging, API design |
| QA Engineer | Test case generation, defect analysis, structured reporting |
| Code Reviewer | Code reading, pattern recognition, structured feedback |
| Documentation Engineer | Prose writing, structured documentation, API doc generation |
| Security Engineer | Threat modeling, vulnerability pattern recognition |
| DevOps Engineer | Infrastructure config generation, CI/CD scripting |

---

## How to get better outputs from agents

- Provide the exact format you expect in the prompt or system prompt
- Give the agent a concrete example of a high-quality output from a previous run
- Ask the agent to state its assumptions explicitly
- Use the quality checklist at the end of each agent's system prompt — ask the agent to run it before finalizing its output
- Smaller, focused tasks produce better results than large open-ended ones

---

## Multi-agent coordination

Claude agents work well when:
- Each agent has a single clearly scoped deliverable
- Handoffs include the full required context (not just "continue from where we left off")
- The Orchestrator explicitly names the receiving agent and the task

Claude agents struggle when:
- The same agent is asked to do two fundamentally different things in one prompt
- Context from earlier in a long conversation drifts out of the effective window
- Instructions are implicit rather than explicit
