# Postmortem Template

Complete a postmortem within 48 hours of resolving any P0 or P1 incident.

The goal is to learn and prevent recurrence — not to assign blame.

**Naming convention:** `postmortem-YYYY-MM-DD-short-title.md`

---

# Postmortem: [Short Incident Title]

**Date of incident:**
**Date of postmortem:**
**Severity:** P0 / P1
**Duration:** [Time from first alert to resolution]
**Authors:** [Technical Lead + Project Manager]
**Status:** Draft / Final

---

## Summary

Two to three sentences describing what happened, the impact, and how it was resolved. This section should be readable by a non-technical stakeholder.

---

## Impact

- **Users affected:** [Number or percentage]
- **Features affected:** [List]
- **Data affected:** [None / describe if data was lost or corrupted]
- **Revenue impact:** [None / estimate if known]
- **Duration:** [Start time → Resolution time]

---

## Timeline

All times in [timezone].

| Time | Event |
|---|---|
| HH:MM | Incident began (first user impact or alert) |
| HH:MM | Incident detected by [monitoring / user report / engineer] |
| HH:MM | Triage started |
| HH:MM | Root cause identified |
| HH:MM | Mitigation applied (e.g., rollback deployed) |
| HH:MM | User impact stopped |
| HH:MM | Permanent fix deployed |
| HH:MM | Incident closed |

---

## Root Cause

What was the underlying cause of the incident?

Be specific. "A bug in the code" is not a root cause. "A missing null check in the payment processing function caused an unhandled exception when users submitted without a postal code" is a root cause.

---

## Contributing Factors

What conditions made this incident possible or made it worse?

- [Factor 1 — e.g., no test covered this input combination]
- [Factor 2 — e.g., alert threshold was set too high to catch this early]
- [Factor 3 — e.g., the rollback procedure was not documented]

---

## What Went Well

- [What worked in the detection, response, or resolution]
- [What helped reduce the impact or speed up recovery]

---

## What Went Poorly

- [What slowed the response]
- [What made the impact worse than it needed to be]
- [What failed in our process or tooling]

---

## Action Items

Each action item must have an owner and a deadline.

| Action | Owner | Deadline | Status |
|---|---|---|---|
| [Specific fix or improvement] | [Agent or person] | [Date] | Open |
| Add test case for [scenario] | Engineer | [Date] | Open |
| Update runbook with [procedure] | DevOps Engineer | [Date] | Open |
| Set alert threshold to [value] | DevOps Engineer | [Date] | Open |

---

## Lessons Learned

One or two rules or principles that should inform how we build or operate going forward.

- [Lesson 1]
- [Lesson 2]
