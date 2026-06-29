# Cloud Platforms Reference

Use this guide to select the right platform for hosting, deployment, and infrastructure.

---

## Default Platform Stack

For most products built with this framework:

| Layer | Default Platform | Reason |
|---|---|---|
| Frontend / Full-stack | Vercel | Zero-config Next.js deployment, great DX, fast CDN |
| Backend services | Railway | Simple container deployment, managed Postgres, easy env vars |
| Database | Supabase | Managed Postgres with auth, storage, and a good free tier |
| Auth | Supabase Auth or Clerk | Both are production-ready and integrate easily with Next.js |
| File storage | Supabase Storage or Cloudflare R2 | Cheap, S3-compatible |
| Email | Resend | Simple API, good deliverability, generous free tier |

---

## Platform Comparison

### Vercel

**Best for:** Next.js apps, React frontends, serverless API routes

**Strengths:** Zero-config deploys from GitHub, preview deployments per PR, excellent performance

**Limitations:** Serverless cold starts for long-running tasks; not ideal for persistent background workers

**Free tier:** Generous for hobby and early-stage products

---

### Railway

**Best for:** Node.js services, Python APIs, background workers, managed Postgres

**Strengths:** Simple container deploys, environment variable management, built-in Postgres and Redis

**Limitations:** Less brand recognition than AWS; smaller community

**Free tier:** Limited — budget ~$5/month for production use

---

### Supabase

**Best for:** Projects that need Postgres + auth + storage with minimal backend code

**Strengths:** Auto-generated REST and GraphQL APIs, realtime subscriptions, Row Level Security, great dashboard

**Limitations:** Vendor lock-in on custom Postgres extensions; some advanced queries require raw SQL

**Free tier:** Generous — 500MB database, 1GB file storage, 50k MAU

---

### AWS / GCP / Azure

**Use when:**
- Enterprise customer requirements mandate a specific cloud provider
- You need services not available on simpler platforms (SageMaker, BigQuery, Azure OpenAI)
- Scale requirements exceed what managed platforms support cost-effectively

**Avoid for MVPs** — the setup overhead delays time-to-first-user significantly.

---

## Decision rules

1. Start on the simplest platform that can deliver the experience
2. Migrate to AWS/GCP only when a specific capability or customer requirement demands it
3. Never choose a platform because it is what large companies use — choose it because it fits the current stage
4. Document the platform choice in `knowledge/decision_logs/` with a revisit trigger
