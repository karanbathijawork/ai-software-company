# Response Patterns Guide

Use these patterns to structure agent outputs consistently across the framework.

---

## Pattern 1: Intake Summary

Use when the Orchestrator completes its intake phase.

```
## Intake Summary

Product idea: [one sentence]
Target user: [who this is for]
Main problem: [what pain point it solves]
Expected outcome: [what success looks like]
MVP direction: [the simplest valuable version]

## Assumptions Made
- [Assumption 1]
- [Assumption 2]

## Handoff Instruction
[What the next agent should do with this]
```

---

## Pattern 2: Product Brief

Use when the Product Manager produces a feature brief or product definition.

```
## Product Brief: [Name]

Problem: [one sentence]
User: [who experiences this problem]
Desired outcome: [what the user achieves]

## MVP Scope
Must have:
- [feature]

Should have:
- [feature]

Won't have in MVP:
- [feature]

## Success Metric
[One measurable outcome that defines success]

## Acceptance Criteria
- [Criterion 1]
- [Criterion 2]
```

---

## Pattern 3: Task Breakdown

Use when the Technical Lead breaks a feature into implementation tasks.

```
## Task Breakdown: [Feature Name]

Total estimated effort: X days

### Task 1: [Name]
- What: [what to build]
- Approach: [how to build it]
- Estimate: X days
- Agent: [who does this]
- Depends on: [task number or "none"]

### Task 2: [Name]
...
```

---

## Pattern 4: Code Review Feedback

Use when the Code Reviewer responds to a pull request.

```
## Code Review: [PR Title]

**Verdict:** Approved / Approved with comments / Changes requested

### Must Fix (blocking)
- [File:line] — [issue description and suggested fix]

### Should Fix (non-blocking)
- [File:line] — [issue description]

### Questions
- [Question if something is unclear]

### Summary
[One or two sentences summarizing the overall quality and what needs to happen before merge]
```

---

## Pattern 5: QA Sign-off

Use when the QA Engineer completes testing.

```
## QA Sign-off: [Feature or Release Name]

**Verdict:** Pass / Fail / Pass with known issues

### Test Results
| Acceptance Criterion | Result | Notes |
|---|---|---|
| [criterion] | Pass / Fail | |

### Defects Found
| ID | Severity | Description | Status |
|---|---|---|---|
| | P0/P1/P2/P3 | | Open / Fixed |

### Sign-off Statement
[QA Engineer confirms the product is ready / not ready for release, with rationale]
```

---

## Pattern 6: Status Report

Use when the Project Manager produces a status update.

```
## Status Report: [Project Name]

**Date:**
**Phase:** [current phase]
**Overall status:** On track / At risk / Blocked

### Completed This Period
- [Item]

### In Progress
- [Item] — [expected completion]

### Blocked
- [Blocker] — [owner] — [escalation needed: yes/no]

### Next Period
- [Item]

### Risks
- [Risk] — [mitigation]
```
