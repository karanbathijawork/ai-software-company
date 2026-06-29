# Feature Development Workflow

Use this workflow when adding a new feature to an existing product.

## When to use this workflow

- A new user story or feature request has been approved
- The product already exists and is in active development
- The feature has been prioritized for the current sprint

---

## Phase 1 — Feature Definition

**Agent:** Product Manager

**Input:** Feature request, user feedback, or business requirement

**Output:**
- Feature brief (problem, user story, acceptance criteria, success metric)
- Scope decision: in MVP or deferred
- Non-goals

**Gate:** Feature brief is clear enough for a technical lead to break it down without asking questions.

---

## Phase 2 — Technical Design

**Agent:** Technical Lead

**Input:** Feature brief, existing architecture document

**Output:**
- Technical design note (approach, data model changes, API changes, dependencies)
- Task breakdown (each task scoped to 1–2 days)
- Risk flags (complexity, backwards compatibility, performance)

**Gate:** All tasks are scoped; risks are identified; no ambiguity blocks implementation.

---

## Phase 3 — Security and Architecture Review

**Activate when:** The feature touches auth, data storage, external APIs, or infrastructure.

**Agent:** Security Engineer, Solution Architect (as needed)

**Input:** Technical design note

**Output:**
- Security requirements for this feature
- Architectural approval or change requests

**Gate:** No blocking security or architecture concerns.

---

## Phase 4 — Implementation

**Agents:** Frontend Engineer, Backend Engineer, or Software Engineer (as needed)

**Input:** Technical design note, task breakdown, API contracts, design specs

**Rules:**
- Implement one task at a time
- Open a pull request for each logical unit of work
- Tag Code Reviewer on every PR before merge

**Gate per PR:** Code Reviewer signs off. CI is green.

---

## Phase 5 — Quality Assurance

**Agent:** QA Engineer

**Input:** Implemented feature, acceptance criteria, test environment

**Output:**
- Test results against all acceptance criteria
- Defect report (if any)
- Sign-off or re-open decision

**Gate:** All acceptance criteria pass. No critical or high defects open.

---

## Phase 6 — Documentation Update

**Agent:** Documentation Engineer

**Input:** Implemented feature, API changes, any UX changes

**Output:**
- Updated user docs (if user-facing)
- Updated API docs (if API changed)
- Updated runbook (if infrastructure changed)

**Gate:** Docs reflect the current state of the feature.

---

## Phase 7 — Release

**Agents:** DevOps Engineer (deployment), Project Manager (stakeholder update)

**Output:**
- Feature deployed to production
- Stakeholders notified
- Success metric baseline recorded

---

## Handoff Chain

Feature Request → PM → Technical Lead → Engineers → Code Reviewer → QA Engineer → Documentation Engineer → DevOps Engineer → Project Manager
