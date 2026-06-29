# Cross-Functional Workflow

Use this workflow when a deliverable requires coordination across product, design, engineering, and QA simultaneously.

This applies to milestone releases, major redesigns, platform migrations, and any work where multiple agents must produce outputs that depend on each other.

---

## When to use this workflow

- A feature spans the full stack (PM → UX → Backend → Frontend → QA)
- A deadline requires parallel workstreams
- Two or more agents have overlapping outputs that must stay in sync

---

## Coordination Roles

| Role | Responsibility in Cross-Functional Work |
|---|---|
| AI Orchestrator | Overall coordination, dependency tracking, conflict resolution |
| Product Manager | Source of truth for requirements; resolves scope conflicts |
| Solution Architect | Source of truth for architecture; resolves technical design conflicts |
| Project Manager | Tracks progress, surfaces blockers, communicates status |

---

## Phase 1 — Alignment

**Before any workstream starts:**

1. AI Orchestrator produces a dependency map showing which outputs feed which agents
2. Product Manager confirms the PRD is final and not changing during execution
3. Solution Architect confirms architecture decisions are locked
4. Project Manager creates a milestone plan with deadlines per workstream

**Gate:** All agents have confirmed their inputs are available before their workstream starts.

---

## Phase 2 — Parallel Workstreams

Run these in parallel once inputs are confirmed:

**Workstream A — Design**
- UX Designer produces design specifications
- Output feeds: Frontend Engineer

**Workstream B — Backend**
- Backend Engineer implements API contracts and data model
- Output feeds: Frontend Engineer, QA Engineer

**Workstream C — Infrastructure**
- DevOps Engineer provisions environments and CI/CD pipeline
- Output feeds: All engineers, QA Engineer

**Workstream D — Security**
- Security Engineer produces threat model and security requirements
- Output feeds: All engineering agents

---

## Phase 3 — Integration

**Activate when:** Workstreams A and B are both complete.

**Agent:** Frontend Engineer

**Input:** Design specs (from A) + API contracts (from B)

**Gate:** Frontend implementation matches design specs and API contracts without gaps.

---

## Phase 4 — Unified QA

**Agent:** QA Engineer

**Input:** Fully integrated product, acceptance criteria from PRD

**Steps:**
1. Test against every user story in the PRD
2. Test cross-browser and cross-device if applicable
3. Verify API contracts are honoured end to end
4. Produce a consolidated defect report

**Gate:** All acceptance criteria pass. No critical or high defects open.

---

## Conflict Resolution

When two workstreams produce conflicting outputs:

1. AI Orchestrator identifies the conflict and the two agents involved
2. The upstream agent's output takes precedence (closer to requirements)
3. Downstream agent revises their output to match
4. If the conflict cannot be resolved by precedence, escalate to Product Manager (scope conflict) or Solution Architect (technical conflict)

---

## Sync Points

Schedule a sync at each of these points:

| Sync | Purpose |
|---|---|
| Start of Phase 2 | Confirm all inputs are ready; identify blockers |
| Mid Phase 2 | Surface early conflicts before they compound |
| End of Phase 3 | Confirm integration is complete before QA begins |
| End of Phase 4 | Release decision |

---

## Rules

- No workstream starts without confirmed inputs.
- No integration begins until both upstream workstreams are complete.
- The Product Manager's requirements do not change once parallel workstreams begin.
- All conflicts are resolved before QA starts — never let QA discover a design vs. implementation mismatch.
