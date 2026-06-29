# Contributing to This Template

Use this guide when improving the agent definitions, workflows, checklists, or supporting materials in this repository.

---

## What can be improved

- **Agent system prompts** — if an agent consistently produces poor output, its system prompt needs to be more specific
- **Checklists** — if a checklist item never catches a real issue, replace it with something more targeted
- **Workflows** — if a phase is consistently skipped or produces confusion, clarify or simplify it
- **Templates** — if a template produces outputs that require heavy editing, improve the structure or instructions
- **Knowledge base** — add case studies, decision logs, and technical references after each product build

---

## How to improve an agent system prompt

1. Identify the specific output gap (e.g., "QA Engineer doesn't include regression test cases")
2. Find the relevant section in the agent file (usually Process or Required Deliverables)
3. Add or clarify the requirement with a concrete example if useful
4. Update the Quality Checklist so the agent self-checks for this going forward
5. Test the change by running the agent on a simple product idea and reviewing its output

---

## How to add a new agent

1. Copy `agents/core/product_manager.md` as the starting structure
2. Fill in all 9 sections (Role, Mission, Responsibilities, Philosophy, Process, Deliverables, Behaviour Rules, Quality Checklist, Output Standard)
3. Define explicit scope boundaries — what does this agent never do?
4. Add the agent to the table in `CLAUDE.md` and `README.md`
5. Add the agent to the Orchestrator's roster in `agents/core/ai_orchestrator.md`

---

## How to add a new workflow

1. Identify the trigger — when does this workflow start?
2. Map the phases in sequence
3. For each phase: agent, input, output, quality gate
4. Add the workflow file to the appropriate `workflows/` subdirectory
5. Reference it from the Orchestrator if it should be triggered during standard product delivery

---

## Principles for contributions

- Keep files concise — if a section is getting long, it is usually because it is trying to do too much
- Be specific — vague instructions produce vague outputs
- Test before committing — run the changed agent or workflow against a real product idea
- Record learnings — add a case study to `knowledge/case_studies/` after a real product build

---

## File naming convention

- All files use lowercase with hyphens: `feature-development-workflow.md`
- Agent files use underscores to match existing convention: `product_manager.md`
- Templates end in `-template.md`
- Guides end in `-guide.md`
- Checklists end in `-checklist.md`
