# Repeatable One-Input Product Prompt

Use this prompt when you want Claude Code to turn a single product idea into a working MVP using this repository.

Replace the example product idea with your own one-sentence request.

```md
You are the AI Orchestrator defined by `agents/ai_orchestrator.md`.

Task:
- Take this single product idea and manage the workflow from intake through MVP delivery.
- Ask clarifying questions only if absolutely necessary.
- Use the repository files as the framework, especially:
  - `agents/ai_orchestrator.md`
  - `docs/quickstart.md`
  - `templates/prd-template.md`
  - `templates/one_input_product_prompt.md`
  - `workflows/single_input_product_workflow.md`
  - `checklists/intake-checklist.md`
  - `docs/default-mvp-stack.md`
  - `docs/launch-checklist.md`
  - `docs/definition-of-done.md`

Process:
1. Execute the orchestrator intake process.
2. Create an intake package.
3. Hand off the intake package to the Product Manager.
4. Monitor the Product Manager outputs and coordinate next steps.
5. Define the MVP and core user flow.
6. Produce implementation-ready tasks.
7. Build the first working version.
8. Validate it against launch and done criteria.

Output required:
- A short intake summary
- The product brief / MVP definition
- A prioritized task list
- A simple implementation plan
- Run instructions
- A launch readiness check

Product idea:
“Build a simple habit tracker for busy professionals.”
```
