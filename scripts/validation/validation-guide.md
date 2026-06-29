# Validation Guide

Use these checks to validate agent outputs before passing them downstream.

Poor inputs produce poor outputs. Validating at each handoff prevents errors from compounding.

---

## Validating a Product Brief (from Product Manager)

Before handing to Technical Lead or UX Designer, confirm:

- [ ] Problem statement is one to two clear sentences
- [ ] Target user is specific (not just "users")
- [ ] MVP scope lists must-haves, should-haves, and won't-haves separately
- [ ] At least one measurable success metric is defined
- [ ] Acceptance criteria exist for each must-have feature
- [ ] Non-goals are explicitly listed

If any item is missing, send the brief back to the Product Manager with a specific request to add the missing section.

---

## Validating a Technical Design (from Technical Lead)

Before handing to engineers, confirm:

- [ ] Every must-have feature from the PRD has a corresponding technical task
- [ ] All tasks are scoped to 1–3 days maximum
- [ ] Dependencies between tasks are identified
- [ ] The data model covers the fields required by the user stories
- [ ] API endpoints are defined well enough for frontend and backend to work independently
- [ ] A testing plan is included

---

## Validating a Pull Request (before merging)

- [ ] Code review checklist in `checklists/code_review/code-review-checklist.md` is complete
- [ ] CI pipeline is green
- [ ] The PR description explains what was changed and why
- [ ] No secrets or credentials are present in the diff

---

## Validating QA Sign-off (before release)

Before triggering a production deployment, confirm:

- [ ] All acceptance criteria from the PRD are marked pass
- [ ] No open critical (P0) or high (P1) defects
- [ ] QA Engineer has explicitly signed off in writing
- [ ] Launch checklist at `checklists/pre_launch/launch-checklist.md` is complete
- [ ] Security checklist at `checklists/security/security-checklist.md` is complete

---

## Validating Documentation (before release)

- [ ] User-facing features have corresponding documentation
- [ ] API changes are reflected in the API spec
- [ ] Setup instructions are tested and produce a working result
- [ ] Known limitations are documented

---

## When validation fails

1. Identify the specific item that failed
2. Send it back to the producing agent with a precise request (not a general "please improve")
3. Re-validate the revised output before passing it downstream
4. If the same gap appears twice, update the agent's system prompt or quality checklist to prevent it in future builds
