# Project Delivery Directory

This directory contains auditable delivery artifacts for all products built using the AI Orchestrator multi-agent workflow.

Each project is organized as a subdirectory with a standardized structure, ensuring traceability and clear handoffs between agents.

---

## Directory Structure

```
_delivery/
├── README.md (this file)
├── DELIVERY_TEMPLATE.md (copy and customize for each new project)
├── <project-name>/
│   ├── master_progress.md (tracking all phases and status)
│   ├── 00_orchestration/
│   │   ├── orchestration_plan.md (phases, agents, dependencies)
│   │   ├── intake_summary.md (clarified product idea)
│   │   └── dependency_map.md (visual dependency graph)
│   ├── 00_planning/
│   │   └── sprint_plan.md (delivered by Project Manager, if applicable)
│   ├── 01_product/
│   │   ├── prd.md (Product Requirements Document)
│   │   └── qa_sign_off.md (PRD approval)
│   ├── 02_design/
│   │   ├── design_spec.md (UX Designer output)
│   │   └── wireframes/ (design mockups, images)
│   ├── 02_architecture/
│   │   ├── architecture.md (Solution Architect output)
│   │   ├── adrs/ (Architecture Decision Records)
│   │   │   ├── 001_tech_stack.md
│   │   │   ├── 002_auth_strategy.md
│   │   │   └── ... (one per major decision)
│   │   └── security_assessment.md (Security Engineer output)
│   ├── 03_technical/
│   │   ├── task_breakdown.md (all engineering tasks)
│   │   ├── coding_standards.md (conventions for this project)
│   │   ├── testing_strategy.md (unit, integration, E2E, security tests)
│   │   ├── dependency_graph.md (task dependencies)
│   │   └── api_contracts.md (OpenAPI spec or API handoff document)
│   ├── 04_infrastructure/
│   │   ├── ci_cd_pipeline.md (Automation Agent output)
│   │   ├── infrastructure_as_code/ (Terraform, CloudFormation, etc.)
│   │   ├── observability.md (logging, monitoring, alerting)
│   │   └── runbooks/ (operational procedures)
│   │       ├── deployment.md
│   │       ├── rollback.md
│   │       └── troubleshooting.md
│   ├── 05_qa/
│   │   ├── test_report.md (QA Engineer output)
│   │   ├── defects.md (logged bugs, if any)
│   │   └── release_sign_off.md (QA approval: "Ready for Production")
│   ├── 06_docs/
│   │   ├── user_guide/ (Documentation Engineer output)
│   │   │   ├── getting_started.md
│   │   │   ├── feature_guides.md
│   │   │   ├── troubleshooting.md
│   │   │   └── glossary.md
│   │   ├── api_docs/ (if applicable)
│   │   │   ├── endpoints.md
│   │   │   ├── authentication.md
│   │   │   ├── code_examples.md
│   │   │   └── error_codes.md
│   │   └── runbooks/ (copy from 04_infrastructure, if not already there)
│   └── 07_release/
│       ├── release_notes.md (Project Manager output)
│       ├── stakeholder_comms.md (communication plan)
│       └── post_release_plan.md (monitoring, feedback, follow-up)
```

---

## How to Create a New Project

1. **Copy the structure above:**
   ```bash
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
   mkdir -p _delivery/<project-name>/06_docs/runbooks
   mkdir -p _delivery/<project-name>/07_release
   ```

2. **Create `master_progress.md`** in `<project-name>/` using the template in `templates/project_management/master-orchestration-workflow.md`

3. **Follow the master orchestration workflow:**
   - Use `templates/project_management/master-orchestration-workflow.md` as your phase-by-phase guide
   - Invoke agents in the correct sequence
   - Save outputs to the corresponding subdirectories
   - Update `master_progress.md` after each phase

4. **Use agent handoff templates:**
   - When handing off from one agent to the next, use `templates/project_management/agent-handoff-template.md`
   - Include the handoff document in the relevant phase directory

---

## File Naming Conventions

- **Phase summaries:** `<phase_name>.md` (e.g., `orchestration_plan.md`, `design_spec.md`)
- **Quality gate documents:** `qa_sign_off.md` or `approval.md`
- **Decision records:** `<number>_<short_title>.md` (e.g., `001_microservices_vs_monolith.md`)
- **Operational runbooks:** `<operation>.md` (e.g., `deployment.md`, `rollback.md`)

---

## Quality Gates

Before moving from one phase to the next, verify the quality gate conditions listed in `master_progress.md`:

| Phase | Quality Gate | Approval By |
|---|---|---|
| 00 Orchestration | Orchestration Plan identifies all agents and dependencies | Human project sponsor |
| 01 Product | PRD is complete with all 20 sections; MVP scope is bounded | Human product owner |
| 02 Design & Architecture | Design covers all user stories and states; Architecture document is complete | Technical Lead & UX Designer |
| 03 Technical Planning | All tasks are <3 days; dependencies are mapped | Human CTO / tech sponsor |
| 04 Implementation | CI is green; all PRs reviewed and merged | Code Reviewer & Technical Lead |
| 05 QA | QA Engineer signs off: "Ready for Production" | QA Engineer |
| 06 Documentation | User docs, API docs, and runbooks are complete | Documentation Engineer & users |
| 07 Release | Deployment successful; metrics look good; no critical issues | DevOps Engineer & human sponsor |

---

## Status Indicators

Use these in `master_progress.md`:

- ✓ **Complete** — phase is done, quality gate passed
- ⏳ **In Progress** — agent is actively working on this phase
- ⏸ **On Hold** — waiting for upstream input or blocker to be resolved
- ⏹ **Not Started** — upstream phase not complete, waiting in queue

---

## Updating Master Progress

After each agent completes work:

1. Move their phase status from ⏳ to ✓
2. Update % completion
3. Record any blockers
4. Note the completion date
5. List which agent activates next

Example:

```markdown
| 01 Product | Product Manager | ✓ Complete | 100% | None | 2026-06-29 |
| 02 Design | UX Designer | ⏳ In Progress | 60% | Awaiting Design System review | 2026-06-29 |
```

---

## Conflict Resolution Log

If two agents produce conflicting outputs, document the conflict:

**File: `<project-name>/conflict_log.md`**

```markdown
# Conflict Log: [Project Name]

## Conflict 1: Design vs. Architecture

**Date:** [Date]
**Agents Involved:** UX Designer, Solution Architect
**Issue:** Design spec assumes real-time database updates; Architecture uses batch processing

**Resolution:**
1. UX Designer reviewed Architecture's batch processing design
2. Revised wireframes to use polling instead of real-time updates
3. Updated design spec: [link to revised doc]

**Outcome:** ✓ Resolved. Design now compatible with architecture.
```

---

## Escalation Log

If a decision requires human judgment, document it:

**File: `<project-name>/escalation_log.md`**

```markdown
# Escalation Log: [Project Name]

## Escalation 1: MVP Scope

**Date:** [Date]
**Agent:** Product Manager
**Issue:** PRD includes 15 user stories; cannot fit in 2-week sprint

**Decision Required:** Which user stories are in MVP vs. Phase 2?

**Options:**
1. Remove 7 stories from MVP (faster release, less feature-complete)
2. Extend sprint to 3 weeks (slower release, more complete)
3. Reduce polish on 5 stories (same timeline, lower quality)

**Recommendation:** Option 1 (release fast, iterate based on user feedback)

**Decision Received:** Option 1 (2026-06-28)

**Outcome:** MVP scope revised to 8 stories; 7 moved to Phase 2 backlog.
```

---

## Lessons Learned

At the end of each project, create a brief lessons-learned doc:

**File: `<project-name>/lessons_learned.md`**

```markdown
# Lessons Learned: [Project Name]

## What Went Well

- [Positive outcome from orchestration process]
- [Effective handoff or agent collaboration]

## What Could Improve

- [Bottleneck or inefficiency]
- [Agent output that needed revision]

## Next Project

- [Process change to implement]
- [New checklist item to add]
```

---

## Integration with Code Repositories

For projects with code:

1. **Code lives in the main codebase** (e.g., `/src`, `/backend`, `/frontend`)
2. **Reference the code repository** in the delivery docs:
   ```markdown
   ## Code Repositories
   - Frontend: [link to code repo / branch]
   - Backend: [link to code repo / branch]
   - ML: [link to code repo / branch]
   ```

3. **PRs and code reviews** happen in the code repository; the delivery directory references them:
   ```markdown
   ## Code Review Status
   - PR #123: Frontend home page — Reviewed ✓
   - PR #124: Backend API — Reviewed ✓
   ```

4. **Keep deployment artifacts** (CI/CD configs, infrastructure code) in BOTH:
   - Code repository (for version control and deployment)
   - Delivery directory (for reference in release docs)

---

## Who Can Access This Directory

- **Project team** — read/write access to their project directories
- **Stakeholders** — read-only access to master_progress.md and public deliverables
- **Future teams** — read-only access for reference and learning

Sensitive information (API keys, credentials) should **never** be stored here; use secrets management instead.

---

## Tips for Success

1. **Update `master_progress.md` daily** — keep status current so stakeholders always know where things stand
2. **Create handoff documents** — even if not formally required, they prevent miscommunication
3. **Log blockers immediately** — don't wait until the end of a phase
4. **Save drafts** — if an agent produces intermediate work, save it so it's not lost if they revise
5. **Link between documents** — make it easy to navigate: PRD links to user stories, task breakdown links to design specs, etc.
6. **Version docs** — if you revise a major document (e.g., PRD), save the old version too (e.g., `prd_v1.md`, `prd_v2.md`)
7. **Use the templates** — don't invent new structures; use the provided templates and adapt them

---

## Contact & Support

For questions about the delivery process or orchestration workflow:
- See `templates/project_management/master-orchestration-workflow.md`
- See `agents/core/ai_orchestrator.md` for orchestration principles
- Review completed projects in this directory for examples
