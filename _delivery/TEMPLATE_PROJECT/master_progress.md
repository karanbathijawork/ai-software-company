# Project: [Your Product Name]

**Status:** In Progress
**Project Lead:** [Your Name]
**Orchestrator:** AI Orchestrator (agents/core/ai_orchestrator.md)
**Start Date:** [YYYY-MM-DD]
**Target Release:** [YYYY-MM-DD]

---

## Quick Status

- **Current Phase:** [e.g., "02 Design & Architecture"]
- **Phase Progress:** [X%]
- **On Track?** [Yes / No / At Risk]
- **Next Milestone:** [e.g., "Technical Lead task breakdown due [DATE]"]
- **Critical Blockers:** [None / describe]

---

## Phase Completion Status

| Phase | Agent Responsible | Status | % Complete | Blocker | Last Updated |
|-------|-------------------|--------|------------|---------|--------------|
| 00 Orchestration | AI Orchestrator | ⏸ Not Started | 0% | Awaiting product idea | [DATE] |
| 01 Product | Product Manager | ⏸ Not Started | 0% | Waiting for 00 | [DATE] |
| 02 Design | UX Designer | ⏸ Not Started | 0% | Waiting for 01 | [DATE] |
| 02 Architecture | Solution Architect | ⏸ Not Started | 0% | Waiting for 01 | [DATE] |
| 02 Security | Security Engineer | ⏸ Not Started | 0% | Waiting for 02 arch | [DATE] |
| 03 Technical Planning | Technical Lead | ⏸ Not Started | 0% | Waiting for 02 | [DATE] |
| 04 Frontend | Frontend Engineer | ⏸ Not Started | 0% | Waiting for 03 | [DATE] |
| 04 Backend | Backend Engineer | ⏸ Not Started | 0% | Waiting for 03 | [DATE] |
| 04 Infrastructure | DevOps Engineer, Automation Agent | ⏸ Not Started | 0% | Waiting for 02 arch | [DATE] |
| 05 QA | QA Engineer | ⏸ Not Started | 0% | Waiting for 80% implementation | [DATE] |
| 06 Documentation | Documentation Engineer | ⏸ Not Started | 0% | Waiting for impl + design | [DATE] |
| 07 Release | Project Manager | ⏸ Not Started | 0% | Waiting for QA sign-off | [DATE] |
| 08 Cleanup | Cleanup Agent | ⏸ Not Started | 0% | Waiting for product live | [DATE] |

---

## Deliverable Locations

| Phase | Deliverable | Location | Owner |
|-------|-------------|----------|-------|
| 00 | Orchestration Plan | `00_orchestration/orchestration_plan.md` | AI Orchestrator |
| 00 | Intake Summary | `00_orchestration/intake_summary.md` | AI Orchestrator |
| 00 | Dependency Map | `00_orchestration/dependency_map.md` | AI Orchestrator |
| 01 | PRD | `01_product/prd.md` | Product Manager |
| 02 | Design Spec | `02_design/design_spec.md` | UX Designer |
| 02 | Wireframes | `02_design/wireframes/` | UX Designer |
| 02 | Architecture Doc | `02_architecture/architecture.md` | Solution Architect |
| 02 | ADRs | `02_architecture/adrs/` | Solution Architect |
| 02 | Security Assessment | `02_architecture/security_assessment.md` | Security Engineer |
| 03 | Task Breakdown | `03_technical/task_breakdown.md` | Technical Lead |
| 03 | Coding Standards | `03_technical/coding_standards.md` | Technical Lead |
| 03 | Testing Strategy | `03_technical/testing_strategy.md` | Technical Lead |
| 03 | API Contracts | `03_technical/api_contracts.md` | Backend Engineer |
| 04 | Implementation (Frontend) | [code repo URL] | Frontend Engineer |
| 04 | Implementation (Backend) | [code repo URL] | Backend Engineer |
| 04 | CI/CD Pipeline | `04_infrastructure/ci_cd_pipeline.md` | Automation Agent |
| 04 | Infrastructure as Code | `04_infrastructure/infrastructure_as_code/` | DevOps Engineer |
| 04 | Observability Setup | `04_infrastructure/observability.md` | DevOps Engineer |
| 04 | Runbooks | `04_infrastructure/runbooks/` | DevOps Engineer |
| 05 | Test Report | `05_qa/test_report.md` | QA Engineer |
| 05 | Defects (if any) | `05_qa/defects.md` | QA Engineer |
| 05 | Release Sign-Off | `05_qa/release_sign_off.md` | QA Engineer |
| 06 | User Guide | `06_docs/user_guide/` | Documentation Engineer |
| 06 | API Docs | `06_docs/api_docs/` | Documentation Engineer |
| 07 | Release Notes | `07_release/release_notes.md` | Project Manager |
| 07 | Stakeholder Comms | `07_release/stakeholder_comms.md` | Project Manager |

---

## Quality Gate Sign-Offs

Before each phase can complete, verify the gate condition and have the owner sign off:

- [ ] **00 Orchestration Approved** — Orchestration Plan identifies all agents, dependencies, and phases correctly
  - Approved by: _________________ (human sponsor) Date: _________

- [ ] **01 Product Approved** — PRD has all required sections; MVP scope is bounded and clear
  - Approved by: _________________ (product owner) Date: _________

- [ ] **02 Design Approved** — Design spec covers all user stories and interactive states
  - Approved by: _________________ (UX Designer / sponsor) Date: _________

- [ ] **02 Architecture Approved** — Architecture document is complete; ADRs are justified; security assessment is done
  - Approved by: _________________ (Technical Lead) Date: _________

- [ ] **03 Technical Plan Approved** — All tasks are scoped to 1–3 days; dependencies are mapped correctly
  - Approved by: _________________ (Technical Lead / CTO) Date: _________

- [ ] **04 Implementation Ready for QA** — All PRs are reviewed and merged; CI is green; API contracts are finalized
  - Approved by: _________________ (Code Reviewer / Technical Lead) Date: _________

- [ ] **05 QA Sign-Off** — QA Engineer signs off: "Ready for Production" (or "Hold" with required fixes)
  - Approved by: _________________ (QA Engineer) Date: _________

- [ ] **06 Documentation Complete** — User docs, API docs, and runbooks are published and reviewed
  - Approved by: _________________ (Documentation Engineer) Date: _________

- [ ] **07 Release Ready** — Deployment successful; monitoring is active; no critical issues
  - Approved by: _________________ (DevOps Engineer / sponsor) Date: _________

---

## Critical Path Analysis

Based on the Orchestration Plan, the critical path (longest sequence of dependent work) is:

```
Phase 01 (Product) → Phase 02 (Architecture) → Phase 03 (Technical) → Phase 04 (Backend) → Phase 05 (QA) → Phase 07 (Release)
```

**Estimated duration per phase:**
- Phase 01 (Product): 1–2 days
- Phase 02 (Design + Architecture): 3–5 days (parallel)
- Phase 03 (Technical Planning): 1–2 days
- Phase 04 (Implementation): 10–15 days (parallel frontend, backend, infrastructure)
- Phase 05 (QA): 3–5 days
- Phase 07 (Release): 1 day

**Total estimated duration:** 19–30 days (depending on parallelization and iterations)

---

## Dependency Notes

- **Frontend depends on:** API contracts from Backend Engineer
- **Backend depends on:** Data model and API design from Technical Lead
- **Infrastructure depends on:** Architecture document from Solution Architect
- **QA depends on:** ≥80% implementation completion
- **Documentation depends on:** Implementation + Design + Architecture

---

## Active Blockers & Risks

| Blocker/Risk | Impact | Owner | ETA to Resolve | Status |
|---|---|---|---|---|
| [Blocker 1 description] | [Impact: blocks which agents] | [Who owns fixing this] | [Target resolution date] | [Open / In Progress / Resolved] |
| (Example: API design not finalized) | (Blocks Frontend integration) | (Backend Engineer) | (2026-06-30) | (In Progress) |

---

## Communication Log

Document key decisions and discussions here:

| Date | Decision / Discussion | Owner | Impact | Status |
|---|---|---|---|---|
| 2026-06-28 | Product scope: MVP includes 8 features, Phase 2 includes 5 more | Product Manager | Defines sprint length and deadline | ✓ Approved |
| | | | | |

---

## Notes & Escalations

### Escalated Decisions

If any decision requires human judgment, document it here:

```
## Escalation: [Date] — [Title]

**Issue:** [What decision is needed]
**Options:**
1. [Option A with tradeoff]
2. [Option B with tradeoff]
3. [Option C with tradeoff]

**Recommendation:** [Which option and why]

**Decision:** [What the human decided]
**Date:** [When decided]
```

### Project Context

- **Product idea:** [Concise description of what we're building]
- **Business goal:** [Why we're building it]
- **Target users:** [Who will use it]
- **Key constraints:** [Budget, timeline, technical, regulatory, etc.]

### Team

| Role | Name | Availability |
|---|---|---|
| Project Lead | [Name] | [Status] |
| Product Owner | [Name] | [Status] |
| Technical Lead | [Name] | [Status] |
| Frontend Engineer | [Name] | [Status] |
| Backend Engineer | [Name] | [Status] |
| DevOps Engineer | [Name] | [Status] |
| QA Engineer | [Name] | [Status] |

---

## How to Update This File

After each agent completes a phase:

1. Update the **Phase Completion Status** table:
   - Change Status from ⏸ to ⏳ (in progress) or ✓ (complete)
   - Update % Complete
   - Clear blocker or add new one
   - Update Last Updated date

2. Update **Quality Gate Sign-Offs**:
   - Check the box when the gate is approved
   - Add approver name and date

3. Update **Active Blockers & Risks**:
   - Add new blockers immediately
   - Mark resolved blockers with completion date

4. Update **Communication Log**:
   - Record any important decisions or milestones

5. Update **Next Milestone**:
   - At the top of the file, state what's due next and when

**Update frequency:** After each agent completes work (typically daily or every 2 days)

---

## References

- **Orchestration Process:** `templates/project_management/master-orchestration-workflow.md`
- **AI Orchestrator Role:** `agents/core/ai_orchestrator.md`
- **Intake Checklist:** `checklists/process/intake-checklist.md`
- **Project Intake Protocol:** `workflows/project_lifecycle/project-intake-protocol.md`
- **Agent Handoff Template:** `templates/project_management/agent-handoff-template.md`

---

## Approval Sign-Off (Final Release)

By signing below, you confirm that this project has met all quality gates and is approved for release to production.

| Role | Name | Date | Signature |
|---|---|---|---|
| Project Lead | | | |
| Technical Lead | | | |
| QA Engineer | | | |
| Product Owner | | | |
| Project Sponsor | | | |
