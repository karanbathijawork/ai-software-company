# Quick Start: Build Your First Product

Build a complete product from idea to shipped in 3–4 weeks using this AI orchestration system.

---

## 🚀 The Fastest Path (5 minutes to start)

### Step 1: Clone the Repository

```bash
git clone https://github.com/karanbathijawork/ai-software-company.git
cd ai-software-company
```

This repository is your product-building template. Use it for every new product idea.

### Step 2: Describe Your Product Idea

Write 1–3 sentences describing what you want to build:

```
“Build a habit tracker for busy professionals that syncs 
across devices and integrates with calendar apps to remind 
them of daily habits.”
```

### Step 3: Choose Your Approach

**Option A: Simplest (Recommended) ⚡**
- File: [`START_BUILD.md`](../../START_BUILD.md)
- Copy the Agent call → Paste into Claude Code → Done
- System runs Phases 00–08 automatically

**Option B: Balanced 🎯**
- File: [`repeatable-one-input-prompt.md`](../../templates/product_documents/repeatable-one-input-prompt.md)
- Auto-orchestration with pauses between phases
- You can review and customize between phases

**Option C: Full Control 🔧**
- File: [`master-orchestration-workflow.md`](../../templates/project_management/master-orchestration-workflow.md)
- Manual phase-by-phase execution
- Maximum customization and control

**Help choosing:** See [`CHOOSE_YOUR_PATH.md`](../../CHOOSE_YOUR_PATH.md)

### Step 4: Start the Build

Follow your chosen path's instructions. The system will:
- Create a delivery directory: `_delivery/<project-name>/`
- Run Phases 00–08 automatically (or per your pace)
- Track progress in `master_progress.md`
- Approve at quality gates when asked

### Step 5: Get Your Shipped Product

After 3–4 weeks:
- ✓ Complete product built and tested
- ✓ Full audit trail in `_delivery/`
- ✓ Clean codebase (template artifacts removed)
- ✓ Ready for production

---

## What Happens in Each Phase

| Phase | What | Owner | Output |
|-------|------|-------|--------|
| 00 | Planning & orchestration | AI Orchestrator | Orchestration plan |
| 01 | Product requirements | Product Manager | PRD with MVP scope |
| 02 | Design & architecture | UX + Architect + Security | Specs + architecture |
| 03 | Technical planning | Technical Lead | Task breakdown |
| 04 | Implementation | Frontend + Backend + DevOps | Code + infrastructure |
| 05 | Quality assurance | QA Engineer | Test report + sign-off |
| 06 | Documentation | Documentation Engineer | User & API docs |
| 07 | Release | Project Manager | Live product |
| 08 | Cleanup | Cleanup Agent | Clean codebase |

---

## File Structure Overview

```
ai-software-company/
├── README.md ⭐ (overview of the system)
├── START_BUILD.md ⭐ (simplest way to build)
├── CHOOSE_YOUR_PATH.md ⭐ (pick your approach)
│
├── templates/
│   ├── product_documents/
│   │   ├── repeatable-one-input-prompt.md (balanced approach)
│   │   └── prd-template.md
│   └── project_management/
│       └── master-orchestration-workflow.md (full control)
│
├── agents/ (15+ specialized agent roles)
│   ├── core/ (Orchestrator, Product Manager, Architect, etc.)
│   └── engineering/ (Frontend, Backend, QA, Security, etc.)
│
├── _delivery/ (your project outputs)
│   ├── README.md (delivery directory guide)
│   └── TEMPLATE_PROJECT/ (copy this for your project)
│
├── docs/ (guides and architecture)
├── workflows/ (multi-agent processes)
├── checklists/ (quality gates)
├── knowledge/ (best practices and reference)
└── skills/ (language and platform guides)
```

---

## Example: Building a Habit Tracker

### You Provide
```
Product idea: “Build a habit tracker for busy professionals 
that syncs across devices and integrates with calendar apps”
```

### System Builds (3–4 weeks)
```
Phase 00: Orchestration plan created
Phase 01: Product Manager writes PRD
Phase 02: Design specs + Architecture (parallel)
Phase 03: Task breakdown and technical plan
Phase 04: Frontend + Backend + Infrastructure (parallel)
Phase 05: QA testing and sign-off
Phase 06: User guide and API documentation
Phase 07: Product released to production
Phase 08: Template artifacts cleaned up
```

### You Get
```
_delivery/habit-tracker/
├── Complete audit trail of all decisions
├── Product code (clean, no template junk)
├── Infrastructure and CI/CD setup
├── All documentation
└── Ready for operations
```

---

## Key Features

✓ **Orchestrated:** Agents run in correct sequence with explicit dependencies  
✓ **Parallel:** Frontend, Backend, DevOps run simultaneously (saves weeks)  
✓ **Specialized:** Product Manager doesn't code, Engineers don't do product decisions  
✓ **Quality-Gated:** Bad outputs don't flow downstream  
✓ **Auditable:** Complete trail of every decision in `_delivery/`  
✓ **Clean:** Phase 08 removes all template artifacts  
✓ **Automated:** Minimal effort; system handles the orchestration  

---

## What You Approve At

The system asks for human approval at quality gates:

1. **Orchestration Plan** — “Does this plan address the product?”
2. **PRD** — “Is the MVP scope correct?”
3. **Architecture** — “Do we like this design?”
4. **Technical Plan** — “Are tasks well-scoped?”
5. **QA Sign-Off** — “Is quality good enough to ship?”

That's it! Everything else is automated.

---

## Getting Outputs

All outputs are saved in `_delivery/<project-name>/`:

```
_delivery/habit-tracker/
├── master_progress.md (status of all phases)
├── 00_orchestration/ (orchestration plan)
├── 01_product/ (PRD)
├── 02_design/ (design specs)
├── 02_architecture/ (architecture document)
├── 03_technical/ (task breakdown, coding standards)
├── 04_infrastructure/ (CI/CD, infrastructure code)
├── 05_qa/ (test report)
├── 06_docs/ (user guide, API docs)
├── 07_release/ (release notes)
└── cleanup/ (what was cleaned up)
```

---

## Common Questions

### How long does it take?
**3–4 weeks** for a typical product. Phases run in parallel where possible.

### How much effort from me?
**~5 hours total** — mostly approvals at quality gates. The system handles orchestration.

### Can I customize?
**Yes!** Use Path 3 (manual workflow) to have full control over each phase.

### What if I want to pause?
**You can!** Use Path 2 (balanced) to pause between phases and customize.

### What if something breaks?
**Everything is recoverable.** All outputs in `_delivery/` and code in git history.

### Can I reuse this for other products?
**Yes!** Clone the repo again for each new product. Keeps each one clean.

---

## Next Steps

1. **Read your chosen path:**
   - Simplest: [`START_BUILD.md`](../../START_BUILD.md) (5 min)
   - Balanced: [`repeatable-one-input-prompt.md`](../../templates/product_documents/repeatable-one-input-prompt.md) (10 min)
   - Full Control: [`master-orchestration-workflow.md`](../../templates/project_management/master-orchestration-workflow.md) (reference doc)

2. **Provide your product idea** and the system takes it from there

3. **Approve at gates** (PRD, Architecture, Technical Plan, QA, Release)

4. **Get your shipped product** with full audit trail

---

## Help & Resources

- **Choosing an approach?** See [`CHOOSE_YOUR_PATH.md`](../../CHOOSE_YOUR_PATH.md)
- **Understanding the full system?** See [`ORCHESTRATION_SETUP_GUIDE.md`](../../ORCHESTRATION_SETUP_GUIDE.md)
- **Learning about cleanup?** See [`CLEANUP_PHASE_SUMMARY.md`](../../CLEANUP_PHASE_SUMMARY.md)
- **Project-specific guidance?** See [`CLAUDE.md`](../../CLAUDE.md)

---

## Ready to Build?

👉 **Start here:** [`START_BUILD.md`](../../START_BUILD.md)

Or if you want to compare approaches first: [`CHOOSE_YOUR_PATH.md`](../../CHOOSE_YOUR_PATH.md)

**Let's build something great!** 🚀
