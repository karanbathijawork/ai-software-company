# Quick Start: Orchestrator-Driven Product Build

Use this guide to kick off a new product build using the AI Orchestrator and specialized agent team.

---

## Prerequisites

Before you start, ensure you have:

1. **A clear product idea** (written, 1–3 paragraphs)
2. **The agent definitions** in `agents/` directory
3. **The orchestration templates** at `templates/project_management/`
4. **Access to the AI Orchestrator** (via Claude Code with Agent tool)

---

## Step 1: Prepare Your Product Brief

Write a brief description of the product:

```markdown
# Product Brief: [Product Name]

## Problem
[What problem does this solve?]

## Solution
[How does our product solve it?]

## Target Users
[Who will use this?]

## Success Criteria
[How do we know we've succeeded?]

## Key Constraints
[Budget, timeline, technical, regulatory, etc.]
```

Example:
```markdown
# Product Brief: User Analytics Dashboard

## Problem
Teams struggle to understand user behavior without jumping between tools.

## Solution
A unified dashboard showing user engagement, funnel analytics, and retention trends in real-time.

## Target Users
Product managers, analytics teams at SaaS companies with 100–1000 users.

## Success Criteria
Teams can answer "why did retention drop last month?" in under 2 minutes.

## Key Constraints
- Must integrate with existing data warehouse (Snowflake)
- Timeline: 4 weeks
- Budget: 1 engineer + 1 PM
```

---

## Step 2: Create Project Directory

```bash
# From the repository root:
mkdir -p _delivery/<project-name>/00_orchestration
mkdir -p _delivery/<project-name>/00_planning
mkdir -p _delivery/<project-name>/01_product
mkdir -p _delivery/<project-name>/02_design/wireframes
mkdir -p _delivery/<project-name>/02_architecture/adrs
mkdir -p _delivery/<project-name>/03_technical
mkdir -p _delivery/<project-name>/04_infrastructure/infrastructure_as_code
mkdir -p _delivery/<project-name>/04_infrastructure/runbooks
mkdir -p _delivery/<project-name>/05_qa
mkdir -p _delivery/<project-name>/06_docs/user_guide
mkdir -p _delivery/<project-name>/06_docs/api_docs
mkdir -p _delivery/<project-name>/07_release
```

---

## Step 3: Create Master Progress File

Copy the template:

```bash
cp _delivery/TEMPLATE_PROJECT/master_progress.md _delivery/<project-name>/master_progress.md
```

Then edit it:
- Replace `[Your Product Name]` with your project name
- Fill in Project Lead, Start Date, Target Release
- Update any team member info

---

## Step 4: Invoke AI Orchestrator

In Claude Code, use the Agent tool:

```
Invoke the "AI Orchestrator" agent using the prompt below:

Agent(
  description: "AI Orchestrator — intake & orchestration plan",
  prompt: """
You are the AI Orchestrator. Read agents/core/ai_orchestrator.md to understand your role completely.

## Product Brief

[PASTE YOUR PRODUCT BRIEF HERE]

## Your Task — Phase 1: Intake & Orchestration Planning

1. **Intake Review**: Using checklists/process/intake-checklist.md, review the product idea for ambiguity.
   - If clarification needed, ask 2–4 specific questions ONLY.
   - If clear, proceed immediately.

2. **Intake Summary**: Produce a clear intake summary with:
   - Restated problem statement
   - Success criteria
   - Known constraints
   - Stakeholders
   - Assumptions

3. **Orchestration Plan**: Using agents/core/ai_orchestrator.md and the Agent Roster, produce:
   - Which agents activate, in what sequence, and why
   - Dependencies between agent outputs
   - Quality gates at each phase transition
   - Parallel activation opportunities
   - Phase timeline (estimated duration)

4. **Dependency Map**: Visual or text dependency graph showing:
   - Which agent outputs feed which downstream agents
   - Critical path

Output the following sections in order:
- Intake Clarification (if needed) OR Intake Summary (if clear)
- Orchestration Plan
- Dependency Map
- Quality Gates Checklist
- Next Steps (who activates next)
  """
)
```

---

## Step 5: Review Orchestration Plan

The Orchestrator will produce:
- **Intake Summary** — clarified product idea
- **Orchestration Plan** — phases, agents, sequencing
- **Dependency Map** — which agent feeds which
- **Quality Gates** — what to verify before each phase

**Save these to `_delivery/<project-name>/00_orchestration/`**

Then:
1. **Print the Orchestration Plan** for your project sponsor to review
2. **Seek approval** before proceeding (this is a hard gate)
3. **Update `master_progress.md`**:
   - Mark "00_orchestration: Complete ✓"
   - Note which agents activate next
   - Update Target Release date if the timeline changed

---

## Step 6: Invoke Product Manager

Once Orchestration Plan is approved:

```
Agent(
  description: "Product Manager — PRD",
  prompt: """
You are the Product Manager. Read agents/core/product_manager.md to understand your role.

## Intake Summary

[PASTE the Intake Summary from Phase 00]

## Your Task — Product Definition

Produce a Product Requirements Document (PRD) with:
1. Problem Statement
2. Target Users & Personas
3. MVP Scope (explicit: what IS and IS NOT in scope)
4. User Stories (format: "As a [user], I want [capability] so that [outcome]")
5. Acceptance Criteria (per story)
6. Success Metrics
7. Non-Functional Requirements
8. Constraints & Assumptions
9. Out of Scope (explicit)
10. Release Plan

Do NOT make architecture or design decisions. Focus on WHAT and WHY, not HOW.
  """
)
```

**Save output to `_delivery/<project-name>/01_product/prd.md`**

**Update `master_progress.md`:**
- Mark "01_product: Complete ✓"
- Get human approval on PRD before proceeding

---

## Step 7: Invoke Design & Architecture (Parallel)

Once PRD is approved, invoke both in parallel:

### UX Designer

```
Agent(
  description: "UX Designer — design spec",
  prompt: """
You are the UX Designer. Read agents/operations/ux_designer.md.

## PRD

[PASTE the approved PRD]

## Your Task

Produce design specifications covering:
1. User Flows
2. Wireframes (all screens and states)
3. Interactive States (loading, error, success, empty)
4. Design System
5. Accessibility Requirements
6. Device Breakpoints
7. Motion & Animation (if applicable)

Do NOT write code.
  """
)
```

**Save to `_delivery/<project-name>/02_design/`**

### Solution Architect

```
Agent(
  description: "Solution Architect — architecture",
  prompt: """
You are the Solution Architect. Read agents/core/solution_architect.md.

## PRD

[PASTE the approved PRD]

## Your Task

Produce an architecture document with:
1. System Context & Boundaries
2. High-Level Architecture
3. Technology Stack Decisions
4. Data Model
5. API Contracts
6. Scalability & Performance
7. Security & Compliance
8. Deployment & Infrastructure
9. Architecture Decision Records (ADRs)
10. Known Risks & Mitigations

Use templates/technical_specs/adr-template.md for each major decision.
  """
)
```

**Save to `_delivery/<project-name>/02_architecture/`**

### Security Engineer (After Architecture)

```
Agent(
  description: "Security Engineer — threat model",
  prompt: """
You are the Security Engineer. Read agents/quality_assurance/security_engineer.md.

## Architecture Document

[PASTE the architecture document]

## Your Task

Produce a security assessment with:
1. Threat Model
2. OWASP Top 10 Assessment
3. Security Requirements
4. Compliance Requirements
5. Security Testing Plan
6. Known Vulnerabilities

Do NOT recommend architectural changes unless critical.
  """
)
```

**Save to `_delivery/<project-name>/02_architecture/security_assessment.md`**

**Update `master_progress.md`:**
- Mark all three phases complete (02_design, 02_architecture, 02_security)
- Get approvals before moving to Phase 03

---

## Step 8: Invoke Technical Lead

Once design + architecture are approved:

```
Agent(
  description: "Technical Lead — task breakdown",
  prompt: """
You are the Technical Lead. Read agents/core/technical_lead.md.

## PRD

[PASTE PRD]

## Architecture & Design

[PASTE architecture doc and design spec]

## Your Task

Produce:
1. Engineering Task Breakdown (each task: description, 1–3 days, assigned agent, dependencies, acceptance criteria)
2. Coding Standards & Conventions
3. Testing Strategy
4. Dependency Graph (critical path, parallel work)
5. Technical Design Documents (for complex components)
  """
)
```

**Save to `_delivery/<project-name>/03_technical/`**

**Update `master_progress.md`:**
- Mark "03_technical: Complete ✓"
- List tasks and identify which engineers activate next
- Note critical path and estimated implementation time

---

## Step 9: Invoke Implementation Agents (Parallel)

Based on the Technical Lead's task breakdown, invoke appropriate engineers in parallel:

**Frontend Engineer, Backend Engineer, ML Engineer, Data Engineer, etc.**

For each, customize the prompt with:
- Their assigned tasks from the breakdown
- Relevant design/architecture/tech spec sections
- Coding standards
- Note that they'll receive API contracts from Backend Engineer

Each PR must go through Code Review before merge (see next step).

---

## Step 10: Code Review (Continuous During Implementation)

For each pull request, invoke Code Reviewer:

```
Agent(
  description: "Code Reviewer — PR review",
  prompt: """
You are the Code Reviewer. Read agents/quality_assurance/code_reviewer.md.

## Coding Standards

[PASTE coding standards from Technical Lead]

## PR Details

- Description: [from engineer]
- Code changes: [paste diff or PR summary]

## Your Task

1. Check for correctness bugs
2. Check for security vulnerabilities
3. Check against coding standards
4. Check test coverage
5. Suggest optimizations

Output: Approval OR list of required changes.
  """
)
```

**Process:**
- Engineer submits PR
- Code Reviewer approves or requests changes
- If changes needed, engineer revises and resubmits
- If approved, engineer merges to main

**Update `master_progress.md`:**
- Update implementation % complete after each PR merge
- Record blockers (e.g., "Frontend blocked waiting on API spec")

---

## Step 11: QA Testing

Once implementation is ≥80% complete, invoke QA Engineer:

```
Agent(
  description: "QA Engineer — testing & sign-off",
  prompt: """
You are the QA Engineer. Read agents/quality_assurance/qa_engineer.md.

## PRD & Test Strategy

[PASTE PRD and testing strategy]

## Current Implementation Status

[PASTE: which features are done, which are in progress]

## Your Task

1. Execute test plan (unit, integration, E2E, performance, security)
2. Log defects (critical, high, medium, low)
3. Produce test report (coverage, defect summary, pass/fail per feature)
4. Sign off: "Ready for Production" OR "Hold — requires fixes"

Output: Test report, defect list (if any), release recommendation.
  """
)
```

**Save to `_delivery/<project-name>/05_qa/test_report.md`**

**If defects found:**
- Engineer fixes defect
- Submits PR for code review
- QA retests
- Loop until all critical/high defects resolved

---

## Step 12: Documentation

While QA is testing (or once implementation is done), invoke Documentation Engineer:

```
Agent(
  description: "Documentation Engineer — user & API docs",
  prompt: """
You are the Documentation Engineer. Read agents/engineering/documentation_engineer.md.

## PRD, Design, Architecture, API Spec

[PASTE relevant sections]

## Your Task

Produce:
1. User Guide (getting started, features, troubleshooting, glossary)
2. API Documentation (if applicable)
3. Operational Runbooks (deployment, rollback, troubleshooting)
4. Architecture & Design Decision Summary
  """
)
```

**Save to `_delivery/<project-name>/06_docs/`**

---

## Step 13: Release

Once QA signs off and documentation is complete:

```
Agent(
  description: "Project Manager — release coordination",
  prompt: """
You are the Project Manager. Read agents/core/project_manager.md.

## Project Summary

[PASTE project name, target release date, stakeholders]

## Deliverables Status

[PASTE master_progress.md showing all phases complete]

## Your Task

1. Prepare release notes (what's new, fixes, known issues)
2. Communicate with stakeholders (notify, provide docs, support info)
3. Coordinate deployment (DevOps ready, QA available for validation)
4. Post-release monitoring plan

Output: Release notes, stakeholder comms, post-release plan.
  """
)
```

**Save to `_delivery/<project-name>/07_release/`**

**Deploy to production:**
- DevOps Engineer triggers deployment
- QA Engineer validates in production
- Monitor metrics for 24–48 hours
- Address any critical issues

---

## Step 14: Update Master Progress

After each phase completes:

1. Update `master_progress.md`:
   - Mark phase as ✓ Complete
   - Record blockers (if any)
   - Note which agent/phase is next

2. Ensure quality gate approvals are documented

3. Keep stakeholders informed of progress

---

## File Structure Checklist

After completion, your project directory should have:

```
_delivery/<project-name>/
├── master_progress.md ✓
├── 00_orchestration/
│   ├── orchestration_plan.md ✓
│   ├── intake_summary.md ✓
│   └── dependency_map.md ✓
├── 01_product/
│   └── prd.md ✓
├── 02_design/
│   ├── design_spec.md ✓
│   └── wireframes/ ✓
├── 02_architecture/
│   ├── architecture.md ✓
│   ├── adrs/ ✓
│   └── security_assessment.md ✓
├── 03_technical/
│   ├── task_breakdown.md ✓
│   ├── coding_standards.md ✓
│   ├── testing_strategy.md ✓
│   └── api_contracts.md ✓
├── 04_infrastructure/
│   ├── ci_cd_pipeline.md ✓
│   ├── infrastructure_as_code/ ✓
│   ├── observability.md ✓
│   └── runbooks/ ✓
├── 05_qa/
│   ├── test_report.md ✓
│   ├── defects.md (if any) ✓
│   └── release_sign_off.md ✓
├── 06_docs/
│   ├── user_guide/ ✓
│   ├── api_docs/ ✓
│   └── runbooks/ ✓
└── 07_release/
    ├── release_notes.md ✓
    ├── stakeholder_comms.md ✓
    └── post_release_plan.md ✓
```

---

## Key Success Factors

1. **Follow the agent sequence** — don't skip phases or invoke agents out of order
2. **Gate on quality** — require approvals before moving to the next phase
3. **Update `master_progress.md` daily** — keep status current
4. **Document blockers immediately** — don't let them compound
5. **Use agent handoff templates** — prevents miscommunication between agents
6. **Parallelize where safe** — use the dependency graph from the Orchestrator

---

## Getting Help

- **Orchestration process:** See `templates/project_management/master-orchestration-workflow.md`
- **AI Orchestrator role:** See `agents/core/ai_orchestrator.md`
- **Agent definitions:** See individual agent files in `agents/`
- **Templates:** See `templates/` directory
- **Completed projects:** Review `_delivery/` for examples

---

## Next Steps

1. ✓ Write your product brief
2. ✓ Create project directory
3. ✓ Copy master progress template
4. **→ Invoke AI Orchestrator (Phase 00)**
5. Get sponsor approval on Orchestration Plan
6. Invoke Product Manager (Phase 01)
7. Continue through phases 02–07 following the orchestration workflow

Good luck! 🚀
