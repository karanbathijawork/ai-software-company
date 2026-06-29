# Bug Fix Workflow

Use this workflow for P2 and P3 bugs — issues that are confirmed, reproducible, and need to be fixed but do not require the full incident response protocol.

For P0 and P1 incidents, use `workflows/incident_management/incident-response-workflow.md` instead.

---

## Severity Reminder

| Level | Description | Use this workflow? |
|---|---|---|
| P0 | Full outage, data loss | No — use incident response |
| P1 | Major feature broken, many users affected | No — use incident response |
| P2 | Feature broken, workaround exists | Yes |
| P3 | Minor issue, low impact | Yes |

---

## Phase 1 — Triage

**Who:** QA Engineer or engineer who receives the bug report

**Steps:**
1. Reproduce the bug using the exact steps reported
2. Confirm the severity: does a workaround exist? how many users are affected?
3. Assign a severity (P2 or P3) and add it to the backlog
4. If the bug cannot be reproduced, return to the reporter for more information

**Output:** A GitHub Issue (or equivalent) with:
- Severity
- Steps to reproduce
- Expected vs actual behaviour
- Browser, OS, or environment details if applicable
- Screenshot or recording

---

## Phase 2 — Prioritize

**Who:** Project Manager + Technical Lead

**P2 bugs:** Fix in the current sprint or the next sprint, depending on impact and capacity.

**P3 bugs:** Add to the backlog and prioritize in sprint planning. Do not interrupt ongoing work.

**Gate:** The bug is assigned to an engineer with a target sprint.

---

## Phase 3 — Diagnose

**Who:** Assigned engineer

**Steps:**
1. Reproduce the bug locally
2. Identify the root cause in the code
3. Estimate the fix effort (hours, not days — if it takes days, the severity may need to be raised)
4. Flag if the fix requires a breaking change or database migration

**Gate:** Root cause identified. Estimate confirmed.

---

## Phase 4 — Fix

**Who:** Assigned engineer

**Steps:**
1. Implement the fix
2. Write a test that would have caught this bug before it was reported — this prevents regression
3. Run the full test suite locally
4. Open a pull request referencing the issue

**PR description must include:**
- What the bug was
- What caused it
- What the fix does
- The test added to prevent regression

**Gate:** Code Reviewer approves. CI is green.

---

## Phase 5 — Verify

**Who:** QA Engineer

**Steps:**
1. Reproduce the original bug on staging — confirm it no longer occurs
2. Run regression tests for the affected area
3. Confirm the fix does not introduce a new issue in adjacent behaviour

**Gate:** Bug is confirmed fixed on staging. No regressions found.

---

## Phase 6 — Deploy and Close

**Who:** DevOps Engineer (deploy), engineer (close issue)

**Steps:**
1. Deploy to production (follows standard release process)
2. Verify the fix on production using the original reproduction steps
3. Close the GitHub Issue with a comment: "Fixed in [commit / PR link], deployed [date]"
4. Notify the original reporter if the bug came from user feedback

---

## Rules

- Always write a test for the fixed behaviour. If you cannot write a test, document why.
- Never merge a bug fix without code review, even a small one.
- If fixing the bug requires touching more than 3 files or reveals a systemic problem, escalate to Technical Lead — it may be a design issue, not a bug.
- If a P3 bug is not fixed within 3 sprints, re-evaluate its severity — it may be causing more impact than initially assessed.
