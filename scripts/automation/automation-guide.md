# Automation Guide

Use this guide to automate repetitive tasks in the product delivery workflow.

---

## CI/CD Pipeline Basics

Every product built with this framework should have a CI/CD pipeline from day one. Use GitHub Actions as the default.

### Recommended pipeline structure

```yaml
# .github/workflows/ci.yml

name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
      - run: npm ci
      - run: npm run lint
      - run: npm test

  deploy:
    needs: test
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    steps:
      - uses: actions/checkout@v4
      - uses: amondnet/vercel-action@v25
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.VERCEL_ORG_ID }}
          vercel-project-id: ${{ secrets.VERCEL_PROJECT_ID }}
          vercel-args: '--prod'
```

---

## Automating Agent Handoffs

When using Claude Code with MCP integrations, you can automate handoffs by chaining agent instructions:

```
Run the following agent sequence:
1. AI Orchestrator: read the intake summary in templates/product_documents/repeatable-one-input-prompt.md and produce a handoff brief
2. Product Manager: receive the handoff brief and produce a product brief and user stories
3. Technical Lead: receive the product brief and produce a task breakdown
```

---

## Common Automation Tasks

### Dependency audit

Run on every PR to catch vulnerable packages:

```bash
npm audit --audit-level=high
```

Add to CI as a pre-merge gate.

### Lint and format check

```bash
npm run lint
npx prettier --check .
```

### Type check (TypeScript projects)

```bash
npx tsc --noEmit
```

### Test with coverage

```bash
npm test -- --coverage
```

Set a coverage threshold in your test config to fail CI if coverage drops below an acceptable level.

---

## Automation Agent Role

The Automation Agent in this framework is responsible for:

- Writing CI/CD workflow files
- Creating shell scripts for repetitive developer tasks
- Setting up pre-commit hooks
- Automating database migrations as part of deployment

When tasking the Automation Agent, provide:
- What the automation should do
- When it should trigger (on push, on PR, on schedule, manually)
- What a successful run looks like
- What a failing run should do (fail CI, send alert, rollback)
