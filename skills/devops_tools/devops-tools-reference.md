# DevOps Tools Reference

Use this guide to select and configure the right DevOps tools for each product.

---

## Default Toolchain

| Purpose | Default Tool |
|---|---|
| CI/CD | GitHub Actions |
| Containerization | Docker |
| Local development | Docker Compose |
| Infrastructure as Code | Pulumi (TypeScript) or Terraform |
| Secrets management | Vercel env vars, Railway env vars, or Doppler |
| Monitoring | Sentry (errors) + Vercel Analytics (performance) |
| Logging | Axiom or Logtail for structured logs |

---

## GitHub Actions

The default CI/CD platform. All products in this framework should have a GitHub Actions workflow from day one.

**Standard workflow file:** See `scripts/automation/automation-guide.md` for a starter pipeline.

**Key actions to know:**

| Action | Use case |
|---|---|
| `actions/checkout@v4` | Check out code |
| `actions/setup-node@v4` | Set up Node.js |
| `actions/setup-python@v5` | Set up Python |
| `amondnet/vercel-action` | Deploy to Vercel |
| `docker/build-push-action` | Build and push Docker images |

---

## Docker

Use Docker to containerize backend services and ensure consistent environments between development and production.

**Minimal Dockerfile for a Node.js service:**

```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
EXPOSE 3000
CMD ["node", "src/index.js"]
```

**Docker Compose for local development:**

```yaml
version: '3.8'
services:
  api:
    build: .
    ports:
      - "3000:3000"
    environment:
      - DATABASE_URL=postgresql://postgres:postgres@db:5432/dev
    depends_on:
      - db

  db:
    image: postgres:16
    environment:
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: dev
    volumes:
      - pgdata:/var/lib/postgresql/data

volumes:
  pgdata:
```

---

## Monitoring and Observability

Every production product needs at minimum:

1. **Error tracking** — Sentry captures unhandled exceptions with stack traces and user context
2. **Performance monitoring** — Vercel Analytics or a lightweight RUM tool
3. **Structured logging** — log JSON to stdout; ship to Axiom or Logtail for querying

**Sentry setup (Next.js):**

```bash
npx @sentry/wizard@latest -i nextjs
```

---

## Secrets Management

Never put secrets in code. Use this hierarchy:

1. **Local development:** `.env.local` file (gitignored)
2. **CI/CD:** GitHub Actions secrets
3. **Production:** Platform environment variables (Vercel, Railway) or Doppler for centralized management

---

## DevOps Agent Role

The DevOps Engineer agent in this framework is responsible for:

- Writing GitHub Actions workflows
- Creating Dockerfiles and Docker Compose configs
- Configuring deployment pipelines end to end
- Setting up monitoring and alerting
- Executing and verifying production deployments
- Maintaining rollback procedures

When tasking the DevOps Engineer, provide the architecture document, deployment targets, and CI/CD requirements from the Technical Lead.
