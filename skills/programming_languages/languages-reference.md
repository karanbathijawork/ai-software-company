# Programming Languages Reference

Use this guide to select the right language for each part of the product.

Prefer the default recommendation unless there is a specific technical reason to deviate.

---

## Default Choices

| Layer | Default Language | Reason |
|---|---|---|
| Frontend | TypeScript (React) | Strong ecosystem, type safety, most agent proficiency |
| Backend | TypeScript (Node.js) | Shared language with frontend reduces context switching |
| Scripting / Automation | TypeScript or Python | TypeScript for Node tooling; Python for data and ML tasks |
| Database queries | SQL (via ORM) | Prisma for TypeScript, SQLAlchemy for Python |
| Infrastructure / IaC | YAML (GitHub Actions, Docker Compose) | Standard for CI/CD and container config |

---

## When to use Python

- Machine learning, data processing, or AI model integration
- Data pipelines and ETL jobs
- Scientific computing or numerical analysis
- When the team has existing Python expertise and the project is primarily backend

**Default Python stack:**
- FastAPI for APIs
- SQLAlchemy for database access
- Pydantic for data validation
- Pytest for testing

---

## When to use TypeScript everywhere

- Full-stack web apps where speed and shared types matter
- Projects where the same team owns frontend and backend
- Products that need to ship quickly with minimal context switching

**Default TypeScript stack:**
- Next.js (App Router) for full-stack
- Prisma for database access
- Zod for validation
- Vitest for unit tests, Playwright for E2E

---

## Language selection rules

1. Choose the language your agents have the most demonstrated proficiency in for the task
2. Never introduce a new language just because it is technically superior — prefer the boring, well-supported option
3. Minimize the number of languages in a single product — each additional language adds maintenance overhead
4. Check `knowledge/technical_reference/default-mvp-stack.md` before diverging from the defaults

---

## What to avoid

- Do not use a new or experimental language for a production MVP
- Do not mix Python and TypeScript in the same service — pick one per service
- Do not choose a language based on personal preference when the rest of the stack points another direction
