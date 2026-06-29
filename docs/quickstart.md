# Quick Start for Your First Product

This guide gives you the shortest path from idea to first working MVP using this repository.

## 1. Choose your product idea

Pick one sentence that describes the product you want to build.

Example:
- “Build a simple habit tracker for busy professionals.”

## 2. Create a project brief

Copy the template from templates/prd-template.md and fill in the core sections.

At minimum include:
- product name
- problem statement
- target user
- MVP scope
- success metric

## 3. Use the orchestrator workflow

Use the workflow in workflows/single_input_product_workflow.md as your operating guide.

The orchestrator should:
- interpret the idea
- ask only necessary clarifying questions
- create an intake package
- hand off to the Product Manager

## 4. Let Claude Code execute

Use the prompt in templates/one_input_product_prompt.md as the main instruction.

That prompt tells Claude Code to:
- act as the orchestrator
- create the intake package
- define the MVP
- build the first working version

## 5. Start with the smallest useful version

Do not try to build everything at once.

Focus on:
- one clear user problem
- one core workflow
- one measurable outcome

## 6. Review and iterate

Once the first version is running, review:
- whether the core user flow works
- whether the MVP is actually useful
- what should be cut or improved next

If you want the fastest possible path, start with a very small web app and focus on one core use case.
