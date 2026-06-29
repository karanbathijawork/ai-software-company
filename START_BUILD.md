# Quick Start: @ai-orchestrator, Build [Product]

**Fastest way to go from product idea → shipped product with full orchestration.**

---

## How to Use

### Step 1: Open Claude Code

Open Claude Code (claude.ai/code) with this repository.

### Step 2: Run This Agent Call

Copy and paste this into Claude Code, replacing `[YOUR PRODUCT IDEA]` with your idea:

```
Agent(
  description: "AI Orchestrator - Automated Product Build",
  prompt: """
You are the AI Orchestrator defined in agents/core/ai_orchestrator.md. Read that file first.

YOUR TASK: Take this product idea and execute the complete multi-phase orchestration workflow.

PRODUCT IDEA:
[YOUR PRODUCT IDEA — 1–3 sentences describing the problem, solution, and target users]

EXECUTION:
1. Create the project delivery directory: _delivery/<PROJECT_NAME>/
   - Use a short name derived from the product idea (e.g., "habit-tracker", "analytics-dashboard")
   - Create all subdirectories per _delivery/README.md structure
   - Create master_progress.md from _delivery/TEMPLATE_PROJECT/master_progress.md

2. Execute the full orchestration workflow from templates/project_management/master-orchestration-workflow.md:
   - Phase 00: Intake & Orchestration Plan (you produce this)
   - Phase 01: Product Manager (invoke as separate Agent call)
   - Phase 02: UX Designer + Solution Architect + Security Engineer (invoke in parallel)
   - Phase 03: Technical Lead (invoke as separate Agent call)
   - Phase 04: Frontend Engineer + Backend Engineer + DevOps Engineer (invoke in parallel, with Code Reviewer for every PR)
   - Phase 05: QA Engineer (invoke as separate Agent call)
   - Phase 06: Documentation Engineer (invoke as separate Agent call)
   - Phase 07: Project Manager / Release (invoke as separate Agent call)
   - Phase 08: Cleanup Agent (invoke to remove template artifacts and clean up codebase)

CONSTRAINTS (Non-negotiable):
- You do NOT do the work of downstream agents; you INVOKE them via the Agent tool
- You save all outputs to _delivery/<PROJECT_NAME>/ in the correct subdirectories
- You update master_progress.md after each phase with status, blockers, and next steps
- You enforce quality gates before phase transitions (require human approval at: PRD, Architecture, Technical Plan, QA sign-off)
- You parallelize agents where the dependency graph allows (Phase 02 and Phase 04 are parallel work)
- You create an auditable trail of all decisions

REFERENCES:
- Full workflow: templates/project_management/master-orchestration-workflow.md
- Orchestrator role: agents/core/ai_orchestrator.md
- Delivery structure: _delivery/README.md
- Template master_progress: _delivery/TEMPLATE_PROJECT/master_progress.md

BEGIN ORCHESTRATION NOW.
""")
```

### Step 3: That's It!

The Orchestrator will:
1. ✓ Create `_delivery/<project-name>/` directory structure
2. ✓ Execute Phase 00 (orchestration plan)
3. ✓ Get human approval
4. ✓ Invoke Product Manager for Phase 01 (PRD)
5. ✓ Get human approval
6. ✓ Continue through all phases, invoking specialized agents
7. ✓ Update `master_progress.md` at each step
8. ✓ Enforce quality gates
9. ✓ Create complete audit trail in `_delivery/`

---

## Example

Input:
```
Agent(
  description: "AI Orchestrator - Automated Product Build",
  prompt: """
...
PRODUCT IDEA:
Build a simple habit tracker for busy professionals that syncs 
across devices and integrates with calendar apps to remind them 
of daily habits.
...
""")
```

Output:
```
_delivery/habit-tracker/
├── master_progress.md (tracks all phases and approvals)
├── 00_orchestration/
│   ├── orchestration_plan.md
│   ├── intake_summary.md
│   └── dependency_map.md
├── 01_product/
│   └── prd.md
├── 02_design/
│   ├── design_spec.md
│   └── wireframes/
├── 02_architecture/
│   ├── architecture.md
│   ├── adrs/
│   └── security_assessment.md
├── 03_technical/
│   ├── task_breakdown.md
│   ├── coding_standards.md
│   └── testing_strategy.md
├── 04_infrastructure/
│   ├── ci_cd_pipeline.md
│   └── infrastructure_as_code/
├── 05_qa/
│   ├── test_report.md
│   └── release_sign_off.md
├── 06_docs/
│   └── user_guide/
└── 07_release/
    └── release_notes.md
```

**From one product idea → complete product build with full orchestration.**

---

## What Happens in Each Phase

| Phase | Who | What | Output | Approval? |
|-------|-----|------|--------|-----------|
| 00 | Orchestrator | Intake + plan | Orchestration plan, dependency map | ✓ Human approval |
| 01 | Product Manager | Requirements | PRD with MVP scope | ✓ Human approval |
| 02 | UX + Architect + Security | Design + architecture | Design specs, architecture doc, security assessment | Quality gate check |
| 03 | Technical Lead | Implementation planning | Task breakdown, coding standards, test strategy | Quality gate check |
| 04 | Frontend + Backend + DevOps | Implementation | Code (in repo), infrastructure (in _delivery/) | CI green, all PRs reviewed |
| 05 | QA Engineer | Testing | Test report, defect list, sign-off | ✓ QA sign-off |
| 06 | Documentation Engineer | Docs | User guide, API docs, runbooks | Quality gate check |
| 07 | Project Manager | Release | Release notes, deployment | ✓ Release approved |
| 08 | Cleanup Agent | Template removal | Clean codebase, no junk | Quality gate check |

---

## Timeline

Typical project timeline (depending on complexity):
- Phase 00–01: 1–2 days
- Phase 02: 3–5 days (parallel)
- Phase 03: 1–2 days
- Phase 04: 10–15 days (parallel frontend, backend, infrastructure)
- Phase 05: 3–5 days (QA + bug fixes if needed)
- Phase 06: 2–3 days
- Phase 07: 1 day
- Phase 08: 1–2 hours (cleanup template artifacts)

**Total: 3–4 weeks** for a medium-complexity product.

---

## Phase 08: Cleanup (What's New!)

Once the product is live (Phase 07), Phase 08 automatically removes all template scaffolding and unused artifacts to ensure a clean, production-ready codebase.

**What gets removed:**
- Template reference files and boilerplate
- Placeholder code and comments
- Example/demo files and fixtures
- Unused test data
- Template documentation
- Example configurations
- Build cache and artifacts
- Unused dependencies
- Old draft versions

**What stays:**
- All actual product code
- Real tests and test data
- Production configuration
- Product documentation
- Infrastructure code

**Result:** A pristine codebase with zero junk—looks like it was purpose-built, not generated from a template.

See `CLEANUP_MANIFEST.md` for details on what gets removed.

---

## What You Need to Provide

1. **Product idea** (1–3 sentences)
2. **Approvals at gates** (PRD, Architecture, Technical Plan, QA sign-off)
3. **That's it!** Everything else is handled by the orchestrator and specialized agents

---

## Customization

Want to customize something?

- **Skip a phase?** Edit the Agent prompt to comment out that phase
- **Adjust timeline?** Quality gates are hard; timelines are flexible
- **Change tech stack?** The Architecture phase handles that
- **Modify MVP scope?** The Product Manager can revise the PRD if you request changes

---

## Troubleshooting

**Q: The Orchestrator isn't invoking agents; it's doing all the work itself**
A: The prompt has explicit constraints to prevent this. If it's still happening, check that:
   - The full Agent prompt was copied (including all constraints)
   - The orchestrator is reading from `agents/core/ai_orchestrator.md`
   - The constraints section is intact

**Q: I want to pause and review before moving to the next phase**
A: The orchestrator will ask for human approval at quality gates. Respond with "Approved" or request changes.

**Q: Where are all my files?**
A: Everything is in `_delivery/<project-name>/` organized by phase. Check `master_progress.md` for the location of each deliverable.

**Q: Can I continue an in-progress build?**
A: Yes! Check `master_progress.md` to see which phase you're on, then ask the Orchestrator to continue from there.

---

## Files Referenced

- **Orchestrator role:** `agents/core/ai_orchestrator.md`
- **Full workflow:** `templates/project_management/master-orchestration-workflow.md`
- **Delivery structure:** `_delivery/README.md`
- **Template:** `_delivery/TEMPLATE_PROJECT/master_progress.md`

---

## Summary

Just copy the Agent call above, paste your product idea, and hit enter.

The Orchestrator handles the rest. 🚀

---

## Advanced: Custom Project Parameters

If you want to customize more, you can add these to the Agent prompt:

```
PROJECT PARAMETERS:
- Target release date: [DATE]
- Team size: [SMALL / MEDIUM / LARGE]
- Budget: [CONSTRAINT]
- Technology preferences: [TECH STACK]
- MVP scope: [EXPLICIT MVP BOUNDS, if desired]
- Quality bar: [HIGH / MEDIUM / FAST]
```

The Orchestrator will incorporate these into the orchestration plan.

---

## One More Thing

This system is designed so you **never have to think about sequencing again**. The Orchestrator handles:
- Which agent to invoke when
- Dependencies between agents
- Parallel work opportunities
- Quality gates
- Audit trail
- Status tracking

You just provide the idea and approve at gates. Everything else is automatic.

Enjoy! 🎉
