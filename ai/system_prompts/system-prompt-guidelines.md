# System Prompt Guidelines

Use these guidelines when writing or modifying agent system prompts in the `agents/` directory.

---

## What a system prompt does

A system prompt defines who the agent is, what it owns, how it thinks, what it produces, and what it never does. It is the only context the agent has about its role — everything else comes from the task input.

---

## Required sections

Every agent system prompt must include these nine sections in order:

1. **Role** — one paragraph describing who this agent is and what expertise they have
2. **Mission** — one sentence stating the agent's single guiding objective
3. **Responsibilities** — bulleted list of what the agent owns
4. **Philosophy / Principles** — how the agent prioritizes and makes decisions
5. **Process / Stages** — step-by-step workflow the agent follows to produce output
6. **Required Deliverables** — the exact output sections the agent must produce
7. **Behaviour Rules** — explicit constraints (what the agent never does)
8. **Quality Checklist** — self-verification steps the agent runs before output is complete
9. **Output Standard** — who reads this output and what format it must follow

---

## Writing principles

**Be specific about scope.**
Every agent must know exactly where its role ends and another agent's role begins. Overlap produces inconsistent outputs.

**Make the output concrete.**
Vague deliverables produce vague outputs. Name the exact sections, documents, or artifacts the agent must produce.

**Include explicit dont's.**
Agents without explicit constraints will drift into adjacent roles. The Behaviour Rules section must list the most important things the agent must never do.

**Use the quality checklist.**
The agent should run its own checklist before finishing. This catches gaps without requiring the Orchestrator to intervene.

**Write for a non-technical reader when possible.**
Agents are often used by people who are not deeply familiar with the codebase. Output standards should reflect the real audience for the deliverable.

---

## What to avoid

- Do not write vague responsibilities like "contribute to the product" — each responsibility must be ownable and measurable
- Do not list tools or technologies in the role description — the agent selects tools based on context
- Do not allow two agents to own the same output — one agent, one deliverable
- Do not write a quality checklist that is the same as the deliverable list — the checklist should verify *quality*, not just existence

---

## Length guidance

A fully-specified agent system prompt is typically 200–400 lines.

Short is not better. Sparse system prompts produce generic outputs. The more clearly the agent understands its role, scope, and quality bar, the better its output.

---

## Reference

Use `agents/core/product_manager.md` as the canonical reference for format, depth, and style.
