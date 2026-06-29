# Master Orchestration Workflow

Use this template to drive a product build through the AI Orchestrator, invoking specialized agents in the correct sequence with proper handoffs and quality gates.

This document is **not** produced by the Orchestrator—it is a **meta-workflow** that you (the human or coordinating agent) use to invoke the Orchestrator and all downstream agents in sequence.

---

# How to Use This Template

## Before You Start

1. Have the **product idea/brief** ready in writing
2. Create a **project delivery directory**: `_delivery/<project-name>/` (see directory structure below)
3. Create a **master progress file**: `_delivery/<project-name>/master_progress.md` (template at bottom of this doc)
4. Understand the **Agent Roster** in `agents/core/ai_orchestrator.md` — which agents will be involved

## Workflow Overview

```
Phase 1: Intake & Orchestration Plan
  ↓ (approval gate)
Phase 2: Product Definition
  ↓ (approval gate)
Phase 3 & 4: Design & Architecture (parallel)
  ↓ (approval gate)
Phase 5: Technical Planning
  ↓ (approval gate)
Phase 6 & 7: Implementation (parallel, with PR reviews)
  ↓ (approval gate)
Phase 8: Automation & Infrastructure
  ↓ (approval gate)
Phase 9: QA & Testing
  ↓ (approval gate)
Phase 10: Documentation
  ↓ (approval gate)
Phase 11: Release & Handoff
```

---

# Phase 1: Intake & Orchestration Plan

## Step 1.1: Invoke AI Orchestrator

**Agent Call Template:**

```
Invoke Agent tool with:
- description: "AI Orchestrator — intake & orchestration plan"
- prompt: [ORCHESTRATOR_PROMPT below]
```

**ORCHESTRATOR_PROMPT:**

```
You are the AI Orchestrator. Your role, mission, responsibilities, and process are defined in agents/core/ai_orchestrator.md — read and internalize that file completely.

## Product Idea

[USER INPUT: Paste the product brief/idea here]

## Your Task — Phase 1: Intake & Orchestration Planning

1. **Intake Review**: Using the intake checklist at checklists/process/intake-checklist.md, review the product idea for ambiguity.
   - If clarification is needed, ask the human 2–4 specific questions ONLY.
   - If the idea is clear, proceed immediately.

2. **Project Intake**: Using the project intake protocol at workflows/project_lifecycle/project-intake-protocol.md, produce an Intake Summary with:
   - Restated problem statement
   - Success criteria
   - Known constraints
   - Stakeholders
   - Assumptions

3. **Orchestration Plan**: Produce a complete orchestration plan including:
   - **Which agents activate**, in what sequence, and why
   - **Dependencies** between agent outputs (use the Agent Roster in this file as reference)
   - **Quality gates** at each phase transition (reference the gates in agents/core/ai_orchestrator.md)
   - **Parallel activation opportunities** (agents whose work can run concurrently)
   - **Phase timeline** (estimated duration for each phase)

4. **Dependency Map**: Create a visual or text dependency graph showing:
   - Which agent outputs feed which downstream agents
   - Critical path (the longest sequence of dependent work)
   - Parallel work streams

Output the following sections in order:
- Intake Clarification (if needed) OR Intake Summary (if clear)
- Orchestration Plan (phases, agents, sequencing)
- Dependency Map
- Quality Gates Checklist
- Next Steps (who activates next and when)
```

**Save Output To:**
- `_delivery/<project-name>/00_orchestration/orchestration_plan.md`
- `_delivery/<project-name>/00_orchestration/intake_summary.md`
- `_delivery/<project-name>/00_orchestration/dependency_map.md`

**Quality Gate — Before Proceeding:**

- [ ] Orchestration plan identifies all required agents
- [ ] Dependency graph is acyclic (no circular dependencies)
- [ ] Quality gates are specific and measurable
- [ ] Parallel activation opportunities are identified
- [ ] Critical path is clearly marked

**Update `master_progress.md`:**
- Mark "00_orchestration: Complete ✓"
- Record blockers (if any)
- Note which agents activate next

---

## Step 1.2: Human Review & Approval

Print the Orchestration Plan to the human project sponsor. Require explicit approval before proceeding to Phase 2.

**Approval Gate Questions:**
- Does this plan address the product idea?
- Are there agents/phases missing?
- Are the quality gates acceptable?
- Is the timeline realistic?

If the human rejects the plan, iterate the Orchestrator.

---

# Phase 2: Product Definition

Once the Orchestration Plan is approved, invoke the Product Manager.

## Step 2.1: Invoke Product Manager

**Agent Call Template:**

```
Invoke Agent tool with:
- description: "Product Manager — requirements & PRD"
- prompt: [PRODUCT_MANAGER_PROMPT below]
```

**PRODUCT_MANAGER_PROMPT:**

```
You are the Product Manager. Your role, mission, responsibilities, and process are defined in agents/core/product_manager.md — read and internalize that file completely.

## Intake Summary

[PASTE the Intake Summary from Phase 1]

## Orchestration Plan Context

[PASTE the relevant portion of the Orchestration Plan that affects product management]

## Your Task — Phase 2: Product Definition

Produce a complete Product Requirements Document (PRD) with:
1. Problem Statement
2. Target Users & Personas
3. MVP Scope (explicit list of what IS included and what IS NOT)
4. User Stories (in format: "As a [user], I want [capability] so that [outcome]")
5. Acceptance Criteria (per user story)
6. Success Metrics
7. Non-Functional Requirements
8. Constraints & Assumptions
9. Out of Scope (explicit list of what you are NOT building)
10. Release Plan

Follow the PRD template if one exists; otherwise structure it clearly with headers.

Do NOT make architecture or design decisions—those are for downstream agents. Focus purely on WHAT we build and WHY, not HOW.
```

**Save Output To:**
- `_delivery/<project-name>/01_product/prd.md`

**Quality Gate — Before Proceeding:**

- [ ] PRD has all 10 required sections
- [ ] MVP scope is explicit and bounded
- [ ] User stories are SMART (specific, measurable, achievable, relevant, time-bound)
- [ ] Acceptance criteria are testable
- [ ] No architecture or technical decisions in the PRD
- [ ] Constraints are documented

**Update `master_progress.md`:**
- Mark "01_product: Complete ✓"
- Record any blockers or ambiguities that arose
- List which agents activate in Phase 3

---

## Step 2.2: Human Review & Approval

Require the human to approve the PRD before proceeding. This is a hard gate.

---

# Phase 3 & 4: Design & Architecture (Parallel)

Once the PRD is approved, invoke UX Designer and Solution Architect in parallel.

## Step 3.1: Invoke UX Designer (Parallel)

**Agent Call Template:**

```
Invoke Agent tool with:
- description: "UX Designer — design specifications & wireframes"
- prompt: [UX_DESIGNER_PROMPT below]
```

**UX_DESIGNER_PROMPT:**

```
You are the UX Designer. Your role, mission, responsibilities, and process are defined in agents/operations/ux_designer.md — read and internalize that file completely.

## PRD

[PASTE the approved PRD from Phase 2]

## Your Task — Phase 3: Design Specification

Produce design specifications and wireframes covering:
1. User Flows (happy path + alternate paths)
2. Wireframes (low-fidelity sketches of all screens/states)
3. Interactive States (all button states, loading states, error states, etc.)
4. Design System (colors, typography, spacing, component library)
5. Accessibility Requirements (WCAG compliance, keyboard navigation, etc.)
6. Device Breakpoints (if responsive: mobile, tablet, desktop)
7. Motion & Animation (if applicable)

Do NOT write code. Focus on communicating what the user sees and experiences.
```

**Save Output To:**
- `_delivery/<project-name>/02_design/design_spec.md`
- `_delivery/<project-name>/02_design/wireframes/` (images or files)

---

## Step 3.2: Invoke Solution Architect (Parallel)

**Agent Call Template:**

```
Invoke Agent tool with:
- description: "Solution Architect — architecture & ADRs"
- prompt: [SOLUTION_ARCHITECT_PROMPT below]
```

**SOLUTION_ARCHITECT_PROMPT:**

```
You are the Solution Architect. Your role, mission, responsibilities, and process are defined in agents/core/solution_architect.md — read and internalize that file completely.

## PRD

[PASTE the approved PRD from Phase 2]

## Orchestration Plan

[PASTE the Orchestration Plan from Phase 1 to understand project scope]

## Your Task — Phase 4: Solution Architecture

Produce an architecture document and decision records covering:
1. System Context & Boundaries (what is inside/outside the system)
2. High-Level Architecture (major components and how they communicate)
3. Technology Stack Decisions (languages, frameworks, databases, services)
4. Data Model (entities, relationships, schema)
5. API Contracts (if applicable: endpoints, request/response formats)
6. Scalability & Performance Considerations
7. Security & Compliance (encryption, authentication, authorization)
8. Deployment & Infrastructure (environments, CI/CD, observability)
9. Architecture Decision Records (ADRs) for major choices
10. Known Risks & Mitigations

Use the ADR template at templates/technical_specs/adr-template.md for each major decision.
```

**Save Output To:**
- `_delivery/<project-name>/02_architecture/architecture.md`
- `_delivery/<project-name>/02_architecture/adrs/` (one file per ADR)

---

## Step 3.3: Invoke Security Engineer (After Architecture, Before Technical Lead)

**Agent Call Template:**

```
Invoke Agent tool with:
- description: "Security Engineer — threat model & security requirements"
- prompt: [SECURITY_ENGINEER_PROMPT below]
```

**SECURITY_ENGINEER_PROMPT:**

```
You are the Security Engineer. Your role, mission, responsibilities, and process are defined in agents/quality_assurance/security_engineer.md — read and internalize that file completely.

## PRD

[PASTE the approved PRD]

## Architecture Document

[PASTE the architecture document from the Solution Architect]

## Your Task — Phase 4b: Security Review

Produce a security assessment covering:
1. Threat Model (identify threats to confidentiality, integrity, availability)
2. OWASP Top 10 Assessment (check architecture against OWASP risks)
3. Security Requirements (encryption, authentication, authorization, audit logging)
4. Compliance Requirements (GDPR, SOC 2, HIPAA, etc. if applicable)
5. Security Testing Plan (what will be tested and how)
6. Known Vulnerabilities (in chosen tech stack)

Do NOT recommend architectural changes unless they are critical security fixes. Flag issues for resolution with the Solution Architect.
```

**Save Output To:**
- `_delivery/<project-name>/02_architecture/security_assessment.md`

---

## Step 3.4: Quality Gate — Design & Architecture Approved

Before proceeding to Phase 5, verify:

- [ ] Design covers all user stories from PRD
- [ ] Design covers all interactive states (loading, error, success, empty)
- [ ] Design covers mobile, tablet, desktop breakpoints
- [ ] Architecture document includes all 10 required sections
- [ ] ADRs are complete and justified
- [ ] Security assessment is complete
- [ ] No conflicts between design and architecture (if conflicts exist, resolve with UX Designer and Solution Architect)

**Update `master_progress.md`:**
- Mark "02_design: Complete ✓"
- Mark "02_architecture: Complete ✓"
- Mark "02_security: Complete ✓"
- Record any conflicts and how they were resolved

---

# Phase 5: Technical Planning

## Step 5.1: Invoke Technical Lead

**Agent Call Template:**

```
Invoke Agent tool with:
- description: "Technical Lead — task breakdown & coding standards"
- prompt: [TECHNICAL_LEAD_PROMPT below]
```

**TECHNICAL_LEAD_PROMPT:**

```
You are the Technical Lead. Your role, mission, responsibilities, and process are defined in agents/core/technical_lead.md — read and internalize that file completely.

## PRD

[PASTE the approved PRD]

## Architecture Document

[PASTE the architecture document]

## Design Specification

[PASTE the design specification]

## Security Requirements

[PASTE the security assessment]

## Your Task — Phase 5: Technical Planning

Produce:
1. Engineering Task Breakdown (list all tasks/stories with:
   - Task description
   - Estimated effort (1–3 days, no larger)
   - Assigned agent (Frontend Engineer, Backend Engineer, ML Engineer, Software Engineer)
   - Dependencies (which tasks must complete first)
   - Acceptance criteria (how to verify completion)

2. Coding Standards & Conventions (for this project:
   - Naming conventions (variables, functions, classes)
   - Code organization (file structure, module boundaries)
   - Testing requirements (unit test coverage %, integration test requirements)
   - Documentation standards (docstring format, README requirements)
   - Code review standards (what to look for in PR reviews)

3. Testing Strategy (for QA):
   - Unit test coverage targets
   - Integration test scenarios
   - End-to-end test scenarios
   - Performance test plan
   - Security test plan

4. Dependency Graph (visual or text):
   - Which tasks are critical path
   - Which tasks can run in parallel
   - Integration points between Frontend Engineer, Backend Engineer, ML Engineer work

5. Technical Design Documents (for complex components)
```

**Save Output To:**
- `_delivery/<project-name>/03_technical/task_breakdown.md`
- `_delivery/<project-name>/03_technical/coding_standards.md`
- `_delivery/<project-name>/03_technical/testing_strategy.md`
- `_delivery/<project-name>/03_technical/dependency_graph.md`

---

## Step 5.2: Quality Gate — Technical Plan Approved

Before proceeding to Phase 6 (Implementation), verify:

- [ ] All tasks are scoped to 1–3 days (no task is larger)
- [ ] All dependencies are mapped
- [ ] Critical path is identified
- [ ] Parallel work streams are identified
- [ ] Testing strategy is complete
- [ ] Coding standards are clear and enforceable
- [ ] No ambiguity in any task description

**Update `master_progress.md`:**
- Mark "03_technical: Complete ✓"
- Note the critical path and expected implementation duration
- List which engineers activate next

---

# Phase 6: Implementation (Parallel with Code Review)

## Step 6.1: Invoke Implementation Agents in Parallel

Based on the Technical Lead's task breakdown, invoke the appropriate engineering agents in parallel:

- **Frontend Engineer** (for UI/frontend implementation)
- **Backend Engineer** (for APIs, services, data layer)
- **ML Engineer** (for AI/ML features, if applicable)
- **Software Engineer** (for general-purpose implementation tasks)
- **Data Engineer** (for data pipelines, if applicable)

**Example: Frontend Engineer Prompt**

```
Invoke Agent tool with:
- description: "Frontend Engineer — UI implementation"
- prompt: [FRONTEND_ENGINEER_PROMPT below]
```

**FRONTEND_ENGINEER_PROMPT:**

```
You are the Frontend Engineer. Your role, mission, responsibilities, and process are defined in agents/engineering/frontend_engineer.md — read and internalize that file completely.

## Design Specification

[PASTE the design specification]

## API Contracts (from Backend Engineer)

[PASTE API contracts/OpenAPI spec once available, OR note "API spec will be provided by Backend Engineer via [DATE]"]

## Task Breakdown (Your Tasks)

[PASTE only the tasks assigned to Frontend Engineer from the Technical Lead's breakdown]

## Coding Standards

[PASTE the coding standards document]

## Your Task — Phase 6a: Frontend Implementation

1. Implement all UI components specified in the design
2. Implement state management (for data from Backend APIs)
3. Implement data-fetching layer (integrate with Backend APIs once contracts are available)
4. Write unit tests (targeting the coverage % specified in testing strategy)
5. Ensure accessibility compliance (WCAG 2.1 AA minimum)
6. Create pull requests for each completed task
7. Respond to code review feedback from the Code Reviewer agent

Do NOT block on Backend API spec—implement mock data based on API contract assumptions; the Code Reviewer will catch integration mismatches later.

Output: Complete, tested, reviewed code in pull requests.
```

**Repeat for Backend Engineer, ML Engineer, etc., adapting the prompt for each.**

---

## Step 6.2: Invoke Code Reviewer (Continuous During Implementation)

For each pull request from an engineer:

**Code Review Prompt:**

```
Invoke Agent tool with:
- description: "Code Reviewer — PR review"
- prompt: [CODE_REVIEWER_PROMPT below]
```

**CODE_REVIEWER_PROMPT:**

```
You are the Code Reviewer. Your role, mission, responsibilities, and process are defined in agents/quality_assurance/code_reviewer.md — read and internalize that file completely.

## PR Details

- PR ID / Description: [from engineer]
- Code changes: [from engineer]
- Related task: [task from task breakdown]

## Coding Standards

[PASTE the coding standards document]

## Your Task — Code Review

1. Check for correctness bugs (logic errors, off-by-one, null pointer, race conditions)
2. Check for security vulnerabilities (injection, XSS, CSRF, etc.)
3. Check against coding standards (naming, style, structure)
4. Check test coverage (unit tests exist and cover happy path + error cases)
5. Check for reuse opportunities (don't repeat yourself)
6. Suggest performance optimizations if applicable

Output: Approval OR list of required changes with specific line references.

If changes are required, the engineer makes them and resubmits.
If approved, the engineer merges to main.
```

**Process:**
- Code Reviewer runs for every PR before merge
- Failed reviews → engineer revises and resubmits
- Approved reviews → merge to main

---

## Step 6.3: Backend API Handoff (Critical Dependency)

When Backend Engineer completes API contracts (before Frontend Engineer finalizes data integration):

**API Handoff Document:**

```
Handoff: Backend Engineer → Frontend Engineer

[USE the agent-handoff-template.md]

Include:
- OpenAPI specification (or contract document)
- Example request/response payloads
- Error codes and error message format
- Authentication/authorization requirements
- Rate limiting if applicable
```

Save to: `_delivery/<project-name>/03_technical/api_contracts.md`

**Frontend Engineer integrates** against the actual API contracts.

---

## Step 6.4: Quality Gate — Implementation Checkpoints

At regular intervals (daily or every 2 days):

- [ ] All PRs are reviewed before merge (no exceptions)
- [ ] CI/CD pipeline is green (all tests pass)
- [ ] Code coverage is above target %
- [ ] No unresolved code review comments
- [ ] No critical or high-severity bugs in bug tracker
- [ ] Integration between Frontend and Backend APIs is verified

**Update `master_progress.md`:**
- Update % complete for each engineer's work
- Record any blockers (e.g., "Frontend blocked waiting for API spec")
- List PRs merged this period

---

# Phase 7: Automation & Infrastructure

## Step 7.1: Invoke Automation Agent & DevOps Engineer

While implementation is in flight (in parallel), invoke:

**Automation Agent Prompt:**

```
Invoke Agent tool with:
- description: "Automation Agent — CI/CD pipelines & scripts"
- prompt: [AUTOMATION_AGENT_PROMPT below]
```

**AUTOMATION_AGENT_PROMPT:**

```
You are the Automation Agent. Your role, mission, responsibilities, and process are defined in agents/engineering/automation_agent.md — read and internalize that file completely.

## Architecture Document

[PASTE the architecture document]

## Your Task — Phase 7a: Automation

1. Design and implement CI/CD pipelines that:
   - Run tests on every commit
   - Build artifacts (Docker images, packages, etc.)
   - Deploy to staging on main branch
   - Deploy to production on release tag

2. Create operational scripts for:
   - Database migrations
   - Seed data population
   - Cleanup scripts
   - Monitoring setup

3. Integrate with deployment targets (as specified by DevOps Engineer)

Output: Complete CI/CD pipeline, operational scripts, deployment automation.
```

**DevOps Engineer Prompt:**

```
Invoke Agent tool with:
- description: "DevOps Engineer — infrastructure & observability"
- prompt: [DEVOPS_ENGINEER_PROMPT below]
```

**DEVOPS_ENGINEER_PROMPT:**

```
You are the DevOps Engineer. Your role, mission, responsibilities, and process are defined in agents/engineering/devops_engineer.md — read and internalize that file completely.

## Architecture Document

[PASTE the architecture document]

## Automation Plan

[PASTE the Automation Agent's plan once available]

## Your Task — Phase 7b: Infrastructure & Observability

1. Provision infrastructure:
   - Compute (servers, containers, serverless)
   - Storage (databases, object storage)
   - Networking (load balancers, CDNs, VPCs)
   - Secrets management

2. Set up observability:
   - Logging (centralized log collection)
   - Monitoring (metrics, alerts)
   - Tracing (request tracing, performance analysis)
   - Dashboards (for oncall, product teams)

3. Implement security infrastructure:
   - SSL/TLS certificates
   - WAF rules
   - DDoS protection
   - Encryption at rest

4. Document runbooks for common operations (restarts, rollbacks, etc.)

Output: Provisioned infrastructure, observability stack, security controls, runbooks.
```

**Save Outputs To:**
- `_delivery/<project-name>/04_infrastructure/ci_cd_pipeline.md`
- `_delivery/<project-name>/04_infrastructure/infrastructure_as_code/` (Terraform, CloudFormation, etc.)
- `_delivery/<project-name>/04_infrastructure/observability.md`
- `_delivery/<project-name>/04_infrastructure/runbooks/` (operational procedures)

---

## Step 7.2: Quality Gate — Infrastructure Approved

Before proceeding to QA:

- [ ] CI/CD pipeline is functional (tests run, artifacts build)
- [ ] Staging environment is accessible and mirrors production
- [ ] Observability stack is collecting metrics and logs
- [ ] Runbooks are documented and tested
- [ ] Security controls are in place and verified

**Update `master_progress.md`:**
- Mark "04_infrastructure: Complete ✓"
- Note any infrastructure blockers

---

# Phase 8: Quality Assurance & Testing

## Step 8.1: Invoke QA Engineer

Once implementation is substantially complete (≥80%), invoke QA:

**QA Engineer Prompt:**

```
Invoke Agent tool with:
- description: "QA Engineer — testing & release sign-off"
- prompt: [QA_ENGINEER_PROMPT below]
```

**QA_ENGINEER_PROMPT:**

```
You are the QA Engineer. Your role, mission, responsibilities, and process are defined in agents/quality_assurance/qa_engineer.md — read and internalize that file completely.

## PRD

[PASTE the PRD]

## Testing Strategy

[PASTE the testing strategy from the Technical Lead]

## Implementation Status

[PASTE current status: which features are implemented, which are in progress]

## Your Task — Phase 8: Quality Assurance

1. Execute test plan:
   - Unit tests (verify they pass and meet coverage targets)
   - Integration tests (verify features work end-to-end)
   - User acceptance tests (verify PRD acceptance criteria)
   - Performance tests (load testing, stress testing)
   - Security tests (penetration testing, OWASP checks)

2. Log defects:
   - Critical: Blocks release (must fix before release)
   - High: Significantly impacts user experience (should fix before release)
   - Medium: Minor bugs, nice to fix
   - Low: Cosmetic issues, consider for future release

3. Produce test report including:
   - Test case coverage (which acceptance criteria were tested)
   - Defect summary (count by severity)
   - Pass/fail status per feature
   - Recommendation: Release/Hold/Conditional

4. Sign off: "Ready for production" OR "Hold — requires fixes"

Output: Test report, defect list, release recommendation.
```

**Save Output To:**
- `_delivery/<project-name>/05_qa/test_report.md`
- `_delivery/<project-name>/05_qa/defects.md` (if any)
- `_delivery/<project-name>/05_qa/release_sign_off.md`

---

## Step 8.2: Defect Resolution

If QA finds critical/high defects:

1. QA Engineer documents the defect clearly
2. Technical Lead (or assigned engineer) fixes the defect
3. Engineer submits PR, which goes through Code Review again
4. QA Engineer retests the fix
5. Loop until all critical/high defects are resolved

---

## Step 8.3: Quality Gate — Release Sign-Off

Before proceeding to documentation/release:

- [ ] Test plan executed completely
- [ ] All critical defects are resolved
- [ ] All high defects are resolved or documented as known issues
- [ ] QA Engineer has signed off: "Ready for Production"
- [ ] Release notes are drafted (what's new, known issues, rollback procedure)

**Update `master_progress.md`:**
- Mark "05_qa: Complete ✓"
- Record defect count by severity
- Note release recommendation

---

# Phase 9: Documentation

## Step 9.1: Invoke Documentation Engineer

While QA is testing (in parallel), or once implementation is complete:

**Documentation Engineer Prompt:**

```
Invoke Agent tool with:
- description: "Documentation Engineer — user & API docs"
- prompt: [DOCUMENTATION_ENGINEER_PROMPT below]
```

**DOCUMENTATION_ENGINEER_PROMPT:**

```
You are the Documentation Engineer. Your role, mission, responsibilities, and process are defined in agents/engineering/documentation_engineer.md — read and internalize that file completely.

## PRD

[PASTE the PRD]

## Design Specification

[PASTE the design specification]

## Architecture Document

[PASTE the architecture document]

## API Contracts

[PASTE the API specification if applicable]

## Your Task — Phase 9: Documentation

Produce:
1. User Documentation
   - Getting started guide (setup, first use)
   - Feature guides (how to use each feature)
   - Troubleshooting guide (common issues and solutions)
   - Glossary of terms

2. API Documentation (if applicable)
   - Endpoint reference (all endpoints, methods, parameters)
   - Authentication guide (how to authenticate)
   - Code examples (in common languages)
   - Error codes and messages

3. Operational Runbooks
   - Deployment procedure
   - Rollback procedure
   - Common troubleshooting
   - Escalation procedures

4. Architecture & Design Decisions
   - High-level overview
   - Key design decisions (why we built it this way)
   - Known limitations

Output: Complete, reviewed, published documentation.
```

**Save Output To:**
- `_delivery/<project-name>/06_docs/user_guide/`
- `_delivery/<project-name>/06_docs/api_docs/`
- `_delivery/<project-name>/06_docs/runbooks/`

---

## Step 9.2: Quality Gate — Documentation Complete

Before release:

- [ ] User documentation covers all features from PRD
- [ ] API documentation is complete and matches implementation
- [ ] Runbooks include deployment, rollback, and troubleshooting
- [ ] All documentation has been reviewed for accuracy and clarity
- [ ] Documentation is published to user-facing location

**Update `master_progress.md`:**
- Mark "06_docs: Complete ✓"

---

# Phase 10: Release & Handoff

## Step 10.1: Invoke Project Manager for Release Coordination

**Project Manager Prompt:**

```
Invoke Agent tool with:
- description: "Project Manager — release coordination & stakeholder comms"
- prompt: [PROJECT_MANAGER_PROMPT below]
```

**PROJECT_MANAGER_PROMPT:**

```
You are the Project Manager. Your role, mission, responsibilities, and process are defined in agents/core/project_manager.md — read and internalize that file completely.

## Project Summary

- Product: [name]
- Release date: [target date]
- Stakeholders: [list]

## Deliverables Status

[PASTE the final master_progress.md showing all phases complete]

## Your Task — Phase 10: Release Coordination

1. Prepare release notes:
   - What's new (features, improvements)
   - Bug fixes
   - Known issues (if any)
   - Breaking changes (if any)

2. Communicate with stakeholders:
   - Notify about release date/time
   - Provide release notes
   - Provide user documentation links
   - Provide support contact info

3. Coordinate deployment:
   - Ensure DevOps Engineer is ready
   - Ensure QA Engineer is available for validation
   - Ensure rollback procedure is tested and ready

4. Post-release:
   - Monitor for issues
   - Triage any new bugs
   - Gather user feedback

Output: Release notes, stakeholder communications, post-release monitoring plan.
```

**Save Output To:**
- `_delivery/<project-name>/07_release/release_notes.md`
- `_delivery/<project-name>/07_release/stakeholder_comms.md`
- `_delivery/<project-name>/07_release/post_release_plan.md`

---

## Step 10.2: Execute Deployment

**DevOps Engineer triggers:**
- Build final release artifact
- Deploy to production
- Verify health checks pass
- Monitor metrics for anomalies

QA Engineer validates in production environment.

---

## Step 10.3: Post-Release

Once live:
- Monitor metrics, logs, errors for 24–48 hours
- Address any critical issues
- Gather user feedback
- Plan follow-up improvements

---

# Phase 11: Cleanup & Polish

## Step 11.1: Invoke Cleanup Agent

Once the product is stable in production, remove all template scaffolding and generate artifacts to ensure a clean, production-ready codebase.

**Cleanup Agent Prompt:**

```
Invoke Agent tool with:
- description: "Cleanup Agent — remove template artifacts"
- prompt: [CLEANUP_AGENT_PROMPT below]
```

**CLEANUP_AGENT_PROMPT:**

```
You are the Cleanup Agent defined at agents/engineering/cleanup_agent.md. Read that file completely.

## Project Details

- Project: [project name]
- Completion: Product is live in production (Phase 07 complete)

## Your Task — Phase 08: Cleanup Template Artifacts

Your goal is to remove all template scaffolding, unused boilerplate, and generated artifacts from the codebase, leaving only pristine, production-quality code.

1. **Parse the cleanup manifest** at CLEANUP_MANIFEST.md
   - Understand all removal categories
   - Identify files matching each category
   - Understand exceptions (files to keep even if they match a removal pattern)

2. **Scan the codebase** for template artifacts:
   - Template reference files (TEMPLATE_*, EXAMPLE_*, etc.)
   - Template markers and comments ("TODO: Remove this", "[SCAFFOLD]", etc.)
   - Unused test fixtures and mock data
   - Example/demo code
   - Documentation artifacts
   - Example configurations
   - Build artifacts and cache
   - Unused dependencies
   - Old draft versions
   - IDE-specific artifacts

3. **Group by category** and ask for approval:
   - For each category, present files to remove
   - Ask: "Remove [Category]? [Yes/No/Review Each]"
   - Get explicit confirmation before deleting

4. **Update documentation**:
   - README.md: Remove template language, add actual product description
   - SETUP.md: Update to product-specific setup
   - package.json / requirements.txt: Remove template project names
   - Remove all "[TEMPLATE]", "[SCAFFOLD]" markers from code

5. **Execute cleanup**:
   - Remove approved files: git rm [file]
   - Remove approved directories: git rm -r [directory]
   - Apply documentation updates

6. **Verify integrity**:
   - Run verification checklist from CLEANUP_MANIFEST.md
   - Confirm essential files still exist (source code, tests, config, docs)
   - Verify git status is clean

7. **Archive and commit**:
   - Create cleanup report: _delivery/<project>/cleanup/cleanup_report.md
   - Archive removed files list: _delivery/<project>/cleanup/removed_files.txt
   - Create git patch: _delivery/<project>/cleanup/git_diff_cleanup.patch
   - Commit: git commit -m "Phase 08: Cleanup template artifacts"

Output: Clean, production-ready codebase with zero template cruft.
```

**Save Output To:**
- `_delivery/<project-name>/cleanup/cleanup_report.md`
- `_delivery/<project-name>/cleanup/removed_files.txt`
- `_delivery/<project-name>/cleanup/verification_report.md`

---

## Step 11.2: Quality Gate — Cleanup Complete

Before marking the project complete:

- [ ] All template scaffolding removed
- [ ] Documentation updated to remove template language
- [ ] Codebase verified to be intact
- [ ] Essential files still exist and are correct
- [ ] Git commit successful
- [ ] Cleanup report complete

**Update `master_progress.md`:**
- Mark "08_cleanup: Complete ✓"
- Update final project status to "Complete & Clean"
- Record total files removed, size reduction

---

# Final Status: Complete Product Ready for Operations

After Phase 08 (Cleanup), you have:

✓ **Intake & Orchestration Plan** (Phase 00) — Clear understanding of the product and build sequence
✓ **Requirements** (Phase 01) — Detailed PRD with MVP scope
✓ **Design & Architecture** (Phase 02) — Design specs, architecture document, security assessment
✓ **Technical Planning** (Phase 03) — Task breakdown, coding standards, testing strategy
✓ **Implementation** (Phase 04) — Complete, tested, reviewed code
✓ **Quality Assurance** (Phase 05) — Full testing, sign-off on quality
✓ **Documentation** (Phase 06) — User docs, API docs, operational runbooks
✓ **Release** (Phase 07) — Product shipped, live in production
✓ **Cleanup** (Phase 08) — Template artifacts removed, clean codebase

**Deliverable:** Production-ready product with auditable trail in `_delivery/`

---

# Master Progress Tracking Template

Use this template to track progress through all phases. Update it after each agent completes its work.

**File: `_delivery/<project-name>/master_progress.md`**

```markdown
# Project: [Product Name]

**Project Lead:** [Your Name]
**Start Date:** [Date]
**Target Release:** [Date]
**Status:** [In Progress / On Track / At Risk / Complete]

---

## Phase Completion Status

| Phase | Agent | Status | Completion % | Blocker | Last Updated |
|---|---|---|---|---|---|
| 00 Orchestration | AI Orchestrator | ✓ Complete | 100% | None | [Date] |
| 01 Product | Product Manager | ✓ Complete | 100% | None | [Date] |
| 02 Design | UX Designer | ✓ Complete | 100% | None | [Date] |
| 02 Architecture | Solution Architect | ⏳ In Progress | 75% | Awaiting security review | [Date] |
| 02 Security | Security Engineer | ⏳ In Progress | 50% | Reviewing threat model | [Date] |
| 03 Technical Planning | Technical Lead | ⏳ In Progress | 60% | None | [Date] |
| 04 Frontend | Frontend Engineer | ⏳ In Progress | 40% | Blocked on API spec | [Date] |
| 04 Backend | Backend Engineer | ⏳ In Progress | 50% | None | [Date] |
| 05 QA | QA Engineer | ⏸ Not Started | 0% | Waiting for 80% implementation | [Date] |
| 06 Infrastructure | DevOps Engineer | ⏸ Not Started | 0% | Waiting for architecture finalization | [Date] |
| 07 Documentation | Documentation Engineer | ⏸ Not Started | 0% | Waiting for implementation completion | [Date] |
| 08 Release | Project Manager | ⏸ Not Started | 0% | Waiting for QA sign-off | [Date] |

---

## Critical Path

Expected timeline (based on Orchestration Plan):
- Intake → PRD: 1–2 days
- Design + Architecture: 3–5 days (parallel)
- Technical Planning: 1–2 days
- Implementation: 10–15 days (parallel frontend, backend, infrastructure)
- QA: 3–5 days
- Documentation: 2–3 days
- Release: 1 day

**Critical Path:** Technical Planning → Implementation → QA → Release (estimated 17–27 days total)

---

## Blockers & Risks

| Blocker | Impact | Owner | ETA to Resolve |
|---|---|---|---|
| [Blocker 1] | [Impact] | [Owner] | [Date] |
| [Blocker 2] | [Impact] | [Owner] | [Date] |

---

## Quality Gate Sign-Offs

- [ ] Orchestration Plan approved (human sponsor)
- [ ] PRD approved (human product owner)
- [ ] Design approved (human sponsor)
- [ ] Architecture approved (Technical Lead)
- [ ] Technical Plan approved (human CTO/tech sponsor)
- [ ] Implementation & Code Review complete (all PRs merged)
- [ ] QA sign-off: "Ready for Production"
- [ ] Documentation complete
- [ ] Release approved (human sponsor)

---

## Deliverable Locations

- **Orchestration Plan:** `_delivery/[project]/00_orchestration/`
- **PRD:** `_delivery/[project]/01_product/prd.md`
- **Design:** `_delivery/[project]/02_design/`
- **Architecture:** `_delivery/[project]/02_architecture/`
- **Security:** `_delivery/[project]/02_architecture/security_assessment.md`
- **Technical Plan:** `_delivery/[project]/03_technical/`
- **Code (Frontend):** [code repo URL]
- **Code (Backend):** [code repo URL]
- **Infrastructure:** `_delivery/[project]/04_infrastructure/`
- **Test Report:** `_delivery/[project]/05_qa/test_report.md`
- **Documentation:** `_delivery/[project]/06_docs/`
- **Release Notes:** `_delivery/[project]/07_release/release_notes.md`

---

## Notes

[Any additional context, decisions, risks, or milestones]
```

---

# Summary

To use this template:

1. **Create a new project directory:** `_delivery/<project-name>/`
2. **Create `master_progress.md`** from the template above
3. **Follow the phases in order**, invoking agents with the provided prompts
4. **Save each agent's output** to the corresponding subdirectory
5. **Update `master_progress.md`** after each phase completes
6. **Gate on quality** before moving to the next phase
7. **Parallelize where the dependency graph allows** (e.g., design + architecture in Phase 3)

The human project sponsor approves the output at each quality gate before proceeding.

This ensures:
- ✓ The AI Orchestrator drives sequencing (not Claude Code doing everything)
- ✓ Specialized agents take on their roles (Product Manager writes PRD, UX Designer creates designs, etc.)
- ✓ Dependencies are explicit and managed
- ✓ Auditable trail of all decisions and outputs
- ✓ Parallel work where safe
- ✓ Quality gates prevent bad outputs from flowing downstream
