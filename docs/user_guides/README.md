# User Guides

**Purpose:** Practical how-to documentation for using this orchestration system to build products.

**Where to Start:**
1. **Brand new user?** → [`quickstart.md`](quickstart.md) (5 minute walkthrough)
2. **Want to compare approaches?** → [`../../CHOOSE_YOUR_PATH.md`](../../CHOOSE_YOUR_PATH.md) (decision tree)
3. **Ready to build?** → [`../../START_BUILD.md`](../../START_BUILD.md) (simplest method)

---

## Files in This Category

### Getting Started
- **[quickstart.md](quickstart.md)** — 5-minute guide to building your first product
  - Clone the repo
  - Describe your idea
  - Choose your approach
  - Let the system build it
  
### Understanding Your Options
- **[../../CHOOSE_YOUR_PATH.md](../../CHOOSE_YOUR_PATH.md)** — Decision tree for which approach to use
  - Path 1: Simplest (fully automated)
  - Path 2: Balanced (auto with pauses)
  - Path 3: Full control (manual phase-by-phase)

### Building Your Product
- **[../../START_BUILD.md](../../START_BUILD.md)** — Simplest way to build (recommended for first product)
  - Copy Agent call
  - Replace product idea
  - Paste and done
  - Phases 00–08 run automatically

- **[../../templates/product_documents/repeatable-one-input-prompt.md](../../templates/product_documents/repeatable-one-input-prompt.md)** — Balanced approach with pauses between phases
  - Auto-orchestration
  - Review between phases
  - Can customize before proceeding

- **[../../templates/project_management/master-orchestration-workflow.md](../../templates/project_management/master-orchestration-workflow.md)** — Full manual control, phase-by-phase
  - Follow step-by-step
  - Invoke each agent
  - Maximum customization

### Understanding the System
- **[../../ORCHESTRATION_SETUP_GUIDE.md](../../ORCHESTRATION_SETUP_GUIDE.md)** — Complete overview of the orchestration system
  - How the system works
  - Why it's designed this way
  - Integration with your existing repo

- **[../../WHAT_YOU_CAN_DO_NOW.md](../../WHAT_YOU_CAN_DO_NOW.md)** — Complete feature summary
  - What's new in Phase 08
  - All three paths to build
  - Files you need to know about

### Special Topics
- **[../../CLEANUP_PHASE_SUMMARY.md](../../CLEANUP_PHASE_SUMMARY.md)** — Understanding Phase 08 (cleanup)
  - What gets removed (template artifacts)
  - What stays (actual product code)
  - Before/after examples

- **[../../HOW_TO_USE_ONE_INPUT_PROMPT.md](../../HOW_TO_USE_ONE_INPUT_PROMPT.md)** — Detailed guide for Path 2
  - Step-by-step instructions
  - What happens in each phase
  - Troubleshooting

- **[../../CLEANUP_MANIFEST.md](../../CLEANUP_MANIFEST.md)** — Specification of what Phase 08 removes
  - Removal categories
  - Exceptions and special cases
  - Verification checklist

---

## What Does NOT Belong Here

- **Architecture documentation** → see `../architecture/`
- **API reference** → see `../api_reference/`
- **Troubleshooting** → see `../troubleshooting/`
- **Agent definitions** → see `../../agents/`
- **Workflows** → see `../../workflows/`
- **Checklists** → see `../../checklists/`
- **Templates** → see `../../templates/`

---

## Quick Decision Tree

```
Do you want to build a product?
├─ YES → Start with [quickstart.md](quickstart.md) (5 min read)
│        Then go to [../../START_BUILD.md](../../START_BUILD.md) (fastest way to build)
│
└─ NO   Do you want to understand the system first?
        ├─ YES → Read [../../ORCHESTRATION_SETUP_GUIDE.md](../../ORCHESTRATION_SETUP_GUIDE.md)
        │
        └─ NO   Do you have a specific question?
                ├─ "How do I build a product?" → [quickstart.md](quickstart.md)
                ├─ "Which approach should I use?" → [../../CHOOSE_YOUR_PATH.md](../../CHOOSE_YOUR_PATH.md)
                ├─ "How does Phase 08 work?" → [../../CLEANUP_PHASE_SUMMARY.md](../../CLEANUP_PHASE_SUMMARY.md)
                ├─ "How do I customize the workflow?" → [../../templates/project_management/master-orchestration-workflow.md](../../templates/project_management/master-orchestration-workflow.md)
                └─ Something else? → See [../../README.md](../../README.md) for full guide
```

---

## For Different Users

### Product Builders
1. Read [`quickstart.md`](quickstart.md) (5 min)
2. Go to [`../../START_BUILD.md`](../../START_BUILD.md) (copy → paste → done)
3. Follow approvals at quality gates
4. Get your product in 3–4 weeks

**Time investment:** ~5 minutes to start | ~5 hours of approvals

### Technical Leads / Architects
1. Read [`../../ORCHESTRATION_SETUP_GUIDE.md`](../../ORCHESTRATION_SETUP_GUIDE.md) (system overview)
2. Check [`../../templates/project_management/master-orchestration-workflow.md`](../../templates/project_management/master-orchestration-workflow.md) (full workflow)
3. Review `../../agents/` (available agents)
4. Customize as needed

**Time investment:** 1–2 hours to understand system

### Product Managers
1. Read [`../../WHAT_YOU_CAN_DO_NOW.md`](../../WHAT_YOU_CAN_DO_NOW.md) (feature summary)
2. Review [`../../agents/core/product_manager.md`](../../agents/core/product_manager.md) (your role)
3. Check PRD template at [`../../templates/product_documents/prd-template.md`](../../templates/product_documents/prd-template.md)

**Time investment:** 30 minutes

### Engineers
1. Read [`quickstart.md`](quickstart.md) (understand the build process)
2. Check your agent role in `../../agents/engineering/`
3. Review [`../../templates/project_management/master-orchestration-workflow.md`](../../templates/project_management/master-orchestration-workflow.md) Phase 04
4. Check quality gates at `../../checklists/`

**Time investment:** 1 hour to understand process

---

## Expected Structure

User guides are practical, step-by-step `.md` files with:
- Clear examples
- Decision trees for choosing approaches
- Links to relevant templates and resources
- Troubleshooting sections
- Time estimates for each step

---

## Related Documentation

- **Architecture & Design** → `../architecture/`
- **Agents & Roles** → `../../agents/`
- **Workflows & Processes** → `../../workflows/`
- **Quality & Checklists** → `../../checklists/`
- **Templates** → `../../templates/`
- **Troubleshooting** → `../troubleshooting/`

---

**Ready to build?** Start with [`quickstart.md`](quickstart.md) →
