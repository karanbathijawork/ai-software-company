# Quick Start for Your First Product

This guide gives you the simplest path from idea to a working MVP using this repository.

## Step 1: Clone the repository

1. Go to your GitHub repo page.
2. Click `Code` and copy the HTTPS URL.
3. On your computer, open a terminal or use GitHub Desktop.
4. Run this command or use the clone option:

```bash
git clone https://github.com/karanbathijawork/ai-software-company.git
```

This repository is your template. Clone it again for every new product or project idea.

## Step 2: Open the repo folder

1. Open the `ai-software-company` folder in a file browser or editor.
2. Confirm these files exist:
   - `README.md`
   - `docs/quickstart.md`
   - `templates/repeatable-one-input-prompt.md`
   - `workflows/single_input_product_workflow.md`
   - `checklists/intake-checklist.md`

## Step 3: Choose your product idea

Write one sentence that describes the product you want to build.

Example:
- “Build a simple habit tracker for busy professionals.”
- “Create a meal planner for people who want to eat healthier.”

## Step 4: Update the prompt file

1. Open `templates/repeatable-one-input-prompt.md`.
2. Find the line that starts with `Product idea:`.
3. Replace the example sentence with your own product idea.

## Step 5: Use the AI Orchestrator

Now the goal is to have the `ai_orchestrator` agent read the prompt file and execute the workflow.

If your tool supports agents, tell it:

- “Run the AI Orchestrator and have it read `templates/repeatable-one-input-prompt.md`.”

If you are using a chat interface, copy the full contents of `templates/repeatable-one-input-prompt.md` and paste it into the chat.

The orchestrator should then:
- review your product idea
- ask only necessary clarifying questions
- create an intake package
- hand off to the Product Manager
- define the MVP and core user flow
- produce implementation tasks
- build the first working version

## Step 6: Review the outputs

Look for these results from the AI:
- an intake summary
- a product brief
- a prioritized task list
- an implementation plan
- run instructions
- a launch readiness check

## Step 7: Validate the first version

Open and use:
- `docs/launch-checklist.md`
- `docs/definition-of-done.md`

Check that the product:
- has a working core workflow
- is documented clearly
- can be run or deployed
- meets the basic launch criteria

## Step 8: Repeat for the next idea

For each new product, start with a fresh clone of this repository or a copied template folder.

That keeps each product clean and makes the process easy to repeat.

---

### If you need help

If anything is confusing, start by reading `README.md` and `docs/quickstart.md` again.

The repo is designed so non-technical users can use the prompt file and the AI Orchestrator to build the first product with minimal setup.
