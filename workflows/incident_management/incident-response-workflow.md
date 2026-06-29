# Incident Response Workflow

Use this workflow when a production issue is detected that affects users.

---

## Severity Levels

| Level | Description | Response Time |
|---|---|---|
| P0 | Full outage or data loss | Immediate |
| P1 | Major feature broken, many users affected | Within 1 hour |
| P2 | Degraded experience, workaround exists | Within 4 hours |
| P3 | Minor issue, low impact | Next sprint |

---

## Phase 1 — Detect and Triage

**Who:** First responder (any agent or human on call)

**Steps:**
1. Confirm the issue is real and reproducible
2. Determine severity level using the table above
3. Identify the affected surface: frontend, backend, database, infrastructure, or third-party
4. Open an incident log entry (see `knowledge/decision_logs/`)

**Gate:** Severity is assigned. Affected surface is identified.

---

## Phase 2 — Assign and Mobilize

**Agent:** Project Manager or AI Orchestrator

**Steps:**
1. Assign the incident to the appropriate engineering agent based on affected surface
2. Notify stakeholders of P0 or P1 incidents immediately
3. Set a target resolution time based on severity

**Agent routing:**
- Frontend issue → Frontend Engineer
- Backend or API issue → Backend Engineer
- Infrastructure or deployment issue → DevOps Engineer
- Security issue → Security Engineer (treat as P0)

---

## Phase 3 — Diagnose

**Agent:** Assigned engineer

**Steps:**
1. Reproduce the issue in a non-production environment if possible
2. Identify the root cause (recent deployment, config change, data issue, dependency failure)
3. Determine scope: how many users are affected and what data is at risk
4. Report diagnosis to Project Manager

**Gate:** Root cause is identified or a credible hypothesis exists.

---

## Phase 4 — Mitigate

**Agent:** Assigned engineer + DevOps Engineer

**Steps:**
1. Apply the fastest safe mitigation first (rollback, feature flag off, rate limit, redirect)
2. Confirm mitigation reduces or stops user impact
3. Document the mitigation applied

**Gate:** User impact is reduced or stopped.

---

## Phase 5 — Fix and Deploy

**Agent:** Assigned engineer

**Steps:**
1. Implement a proper fix (not just a workaround)
2. Code Reviewer reviews the fix — do not skip this step even under pressure
3. QA Engineer validates the fix does not introduce regressions
4. DevOps Engineer deploys to production

**Gate:** Fix is deployed. CI is green. No new issues introduced.

---

## Phase 6 — Verify and Close

**Agent:** QA Engineer + Project Manager

**Steps:**
1. Confirm the original issue is resolved in production
2. Notify stakeholders that the incident is resolved
3. Record resolution time in the incident log

**Gate:** Issue confirmed resolved. Stakeholders notified.

---

## Phase 7 — Postmortem

**Agent:** Technical Lead + Project Manager

Complete within 48 hours of resolution for P0 and P1 incidents.

**Postmortem must include:**
- What happened and when
- Root cause
- Timeline of detection, triage, mitigation, and fix
- What worked well in the response
- What failed or slowed the response
- Corrective actions with owners and deadlines

Record in `knowledge/decision_logs/`.

---

## Rules

- Never deploy a fix without code review, even during a P0.
- Always mitigate before fixing — reduce user impact first.
- Always write a postmortem for P0 and P1 incidents.
- Never close an incident without stakeholder notification.
