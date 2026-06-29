# Setup Guide

Follow these steps to start a new product build from this repository template.

---

## Step 1: Clone the template

```bash
git clone https://github.com/karanbathijawork/ai-software-company.git my-new-product
cd my-new-product
```

## Step 2: Re-initialize git for your new project

```bash
rm -rf .git
git init
git add .
git commit -m "Initial commit from ai-software-company template"
```

## Step 3: Connect your remote repository

```bash
git remote add origin https://github.com/your-username/my-new-product.git
git push -u origin main
```

## Step 4: Configure your MCP integrations (optional but recommended)

Set up the tools your agents will use. See the guides in `mcp/`:

- `mcp/code_hosting/github-mcp-setup.md` — for repo and PR access
- `mcp/communication/slack-mcp-setup.md` — for status updates
- `mcp/data_sources/database-mcp-setup.md` — for schema and data access
- `mcp/deployment/deployment-mcp-setup.md` — for automated deployments

Add your MCP server configs to `.claude/settings.json`.

## Step 5: Write your product idea

Open `templates/product_documents/repeatable-one-input-prompt.md` and replace the example product idea with yours.

One sentence is enough. For example:

```
Product idea: Build a simple job application tracker for recent graduates.
```

## Step 6: Run the AI Orchestrator

In Claude Code, run:

```
Use the AI Orchestrator agent. Read templates/product_documents/repeatable-one-input-prompt.md and execute the single-input product delivery workflow.
```

The orchestrator will produce an intake package and hand off to the Product Manager automatically.

## Step 7: Follow the output

The agents will work through the phases defined in `workflows/project_lifecycle/single_input_product_workflow.md`.

Each phase produces a deliverable. Review them as they are produced and confirm before the next phase begins.

---

## Checklist before starting a build

- [ ] Template cloned and git re-initialized
- [ ] Product idea written in `templates/product_documents/repeatable-one-input-prompt.md`
- [ ] MCP integrations configured (optional)
- [ ] Claude Code is open and pointing at this directory
- [ ] You have reviewed `docs/user_guides/quickstart.md`
