# Agent Selection Guide

Use this guide to decide which engineering agent to activate for a given implementation task.

The AI Orchestrator uses this guide when routing tasks during the implementation phase.

---

## Engineering Agent Overview

| Agent | Primary domain | Typical tasks |
|---|---|---|
| Frontend Engineer | UI, UX implementation, browser | React components, routing, state management, CSS, browser APIs |
| Backend Engineer | APIs, services, data | REST/GraphQL APIs, business logic, database queries, background jobs |
| Software Engineer | General implementation | Full-stack tasks, glue code, scripts, tasks that don't fit neatly into FE or BE |
| Automation Agent | Tooling, CI/CD, scripts | GitHub Actions, shell scripts, test automation, developer tooling |
| DevOps Engineer | Infrastructure, deployment, observability | Docker, cloud config, CI/CD pipelines, monitoring, secrets management |
| Data Engineer | Data pipelines, storage, analytics | ETL/ELT pipelines, data models, reporting, vector databases |
| ML Engineer | AI/LLM integration, model ops | Prompt engineering, RAG, embeddings, model evaluation, AI feature implementation |

---

## Decision Flow

### Is the task user-interface work?

**Yes** → Frontend Engineer

Examples: Building a React component, implementing a design spec, handling form state, adding animations, fixing a CSS layout issue, implementing client-side routing.

---

### Is the task server-side logic or data?

**Yes** → Backend Engineer

Examples: Building an API endpoint, writing a database query, implementing authentication, creating a background job, adding a webhook, writing a migration.

---

### Does the task span both frontend and backend?

**Yes** → Consider two options:

1. **Split the task** — Frontend Engineer takes the UI side, Backend Engineer takes the API side. This works well when the API contract is already defined.
2. **Software Engineer takes it whole** — Use this when the task is small enough that splitting would create more overhead than it saves, or when the API contract is not yet defined and someone needs to own the whole feature end to end.

---

### Is the task about CI/CD, scripts, or developer tooling?

**Yes** → Automation Agent

Examples: Writing a GitHub Actions workflow, creating a pre-commit hook, writing a setup script, automating test runs, creating a code generation script.

---

### Is the task about infrastructure, deployment, or observability?

**Yes** → DevOps Engineer

Examples: Provisioning a new environment, configuring a Docker container, setting up monitoring, managing secrets, executing a production deployment, writing a Terraform or Pulumi config.

---

### Is the task about data pipelines, analytics, or a vector database?

**Yes** → Data Engineer

Examples: Designing an ETL pipeline, setting up pgvector for RAG, building a reporting query, migrating data between schemas, building a data warehouse integration.

---

### Is the task about an AI/LLM feature?

**Yes** → ML Engineer

Examples: Designing a prompt, implementing a RAG pipeline, integrating the Claude API, evaluating AI output quality, building an embedding pipeline, setting up AI output caching.

---

## When to use Software Engineer vs a specialist

Use the **Software Engineer** when:
- The task is clearly scoped and small (under 1 day) but doesn't fit neatly into FE or BE
- The task requires touching multiple layers and splitting it would create more coordination overhead than it saves
- The specialist agents are at capacity and the task doesn't require deep expertise

Use a **specialist** when:
- The task requires deep domain knowledge (complex state management → FE, complex SQL → BE)
- The task is part of a larger parallel workstream where each stream needs to move independently
- Quality in that domain is critical to the product (performance-sensitive UI → FE, security-sensitive API → BE)

---

## Combining agents

Some features require multiple agents working in sequence:

| Feature type | Agent sequence |
|---|---|
| New full-stack feature | Backend Engineer (API) → Frontend Engineer (UI) |
| AI-powered feature | ML Engineer (LLM integration + prompt) → Backend Engineer (API wrapper) → Frontend Engineer (UI) |
| Infrastructure change | DevOps Engineer → all engineers (verify in new environment) |
| Data-driven feature | Data Engineer (pipeline + schema) → Backend Engineer (API) → Frontend Engineer (UI) |

Always define the API contract between agents before parallel work begins.
