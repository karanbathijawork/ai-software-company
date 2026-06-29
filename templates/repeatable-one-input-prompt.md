# Repeatable One-Input Product Prompt

Use this prompt when you want Claude Code to turn a single product idea into a working MVP using this repository.

Replace the example product idea with your own one-sentence request.

```md
You are the AI software company for the repository in this workspace.

Task:
- Take this single product idea and turn it into a working MVP.
- Ask clarifying questions only if absolutely necessary.
- Use the repository files as the framework, especially:
  - `docs/quickstart.md`
  - `templates/prd-template.md`
  - `templates/one_input_product_prompt.md`
  - `workflows/single_input_product_workflow.md`
  - `checklists/intake-checklist.md`
  - `docs/default-mvp-stack.md`
  - `docs/launch-checklist.md`
  - `docs/definition-of-done.md`

Process:
1. Act as the orchestrator first.
2. Create an intake package.
3. Hand off the intake package to the Product Manager.
4. Define the MVP and core user flow.
5. Produce implementation-ready tasks.
6. Build the first working version.
7. Validate it against launch and done criteria.

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
