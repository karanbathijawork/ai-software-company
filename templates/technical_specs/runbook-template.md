# Runbook Template

A runbook documents how to operate, maintain, and recover a specific service or system.

The Documentation Engineer and DevOps Engineer co-produce runbooks. On-call engineers use them during incidents.

**Naming convention:** `[service-name]-runbook.md`

---

# Runbook: [Service or Product Name]

**Last updated:**
**Owner:** [DevOps Engineer / team]
**On-call contact:** [Slack channel or person]

---

## Service Overview

What does this service do? Who depends on it?

- **Purpose:** [One sentence]
- **Consumers:** [Other services, users, or agents that depend on this]
- **SLA:** [Uptime target, e.g., 99.5% monthly]
- **Data sensitivity:** [None / PII / Financial / Health]

---

## Architecture

```
[Simple text diagram of the service's components and data flow]

User → [Load Balancer] → [App Server] → [Database]
                                    ↓
                              [External API]
```

---

## Environments

| Environment | URL | Purpose |
|---|---|---|
| Production | `https://[product].com` | Live users |
| Staging | `https://staging.[product].com` | Pre-release testing |
| Development | `localhost:3000` | Local development |

---

## Access

| Resource | How to access |
|---|---|
| Production logs | [Axiom / Logtail / Vercel logs URL] |
| Error tracking | [Sentry project URL] |
| Database (read-only) | [Connection method] |
| Deployment dashboard | [Vercel / Railway URL] |
| Secrets | [Vercel env vars / Doppler project] |

---

## Health Checks

**Is the service healthy?** Check these in order:

1. Open [monitoring URL] and verify status is green
2. Run `curl https://[product].com/api/health` — expect `{"status": "ok"}`
3. Check error rate in Sentry — should be below [X%]
4. Check p95 response time in [monitoring tool] — should be below [Xms]

---

## Common Operations

### Deploy a new version

1. Merge the PR to `main`
2. CI/CD pipeline triggers automatically via GitHub Actions
3. Monitor the deployment in [Vercel / Railway dashboard]
4. Verify health checks pass (see above)
5. Monitor Sentry for new errors for 10 minutes post-deploy

### Roll back a deployment

**Vercel:**
1. Go to Vercel dashboard → Deployments
2. Find the previous successful deployment
3. Click "..." → "Promote to Production"
4. Verify health checks pass

**Railway:**
1. Go to Railway → Service → Deployments
2. Find the previous deployment and click "Rollback"

### Restart the service

**Vercel:** Redeploy the current deployment from the Vercel dashboard.

**Railway:** Go to Railway → Service → Settings → Restart.

### View recent logs

```bash
# Vercel (via CLI)
vercel logs [project-name] --prod

# Or view in the Vercel dashboard → Functions → Logs
```

### Run a database migration

```bash
# Ensure you are targeting the correct environment
export DATABASE_URL="[connection string]"

# Run pending migrations
npx prisma migrate deploy

# Verify migration status
npx prisma migrate status
```

---

## Alerting

| Alert | Threshold | Action |
|---|---|---|
| Error rate spike | >5% errors in 5 minutes | Check Sentry, consider rollback |
| Response time degradation | p95 > 3s | Check database query performance |
| Database connection failures | Any | Check Supabase / Railway status page |
| Deployment failure | CI red on main | Check GitHub Actions logs, do not redeploy until fixed |

---

## Incident Response

For P0 and P1 incidents, follow `workflows/incident_management/incident-response-workflow.md`.

Quick reference:
1. Confirm the issue and assess severity
2. Mitigate first (rollback if a recent deploy caused it)
3. Fix the root cause
4. Verify resolution
5. Write a postmortem (P0 and P1 only) — use `knowledge/decision_logs/postmortem-template.md`

---

## Known Issues and Workarounds

| Issue | Workaround | Permanent fix |
|---|---|---|
| [Description] | [Workaround steps] | [Ticket or PR link] |

---

## Runbook Maintenance

Update this runbook when:
- A new environment is added
- Access credentials or URLs change
- A new common operation is identified
- An incident reveals a gap in the documented procedures
