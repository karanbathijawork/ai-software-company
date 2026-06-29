# AI Software Company

**Build complete products from idea to shipped in 3–4 weeks using specialized AI agents.**

This repository is a reusable orchestration system for building software products with a team of AI specialists. You provide a product idea, and the AI Orchestrator coordinates your team of specialized agents to deliver a production-ready product.

---

## ⚡ Quick Start: Build a Product in 3 Steps

### 1. Describe Your Product Idea
```
"Build a habit tracker for busy professionals that syncs across devices"
```

### 2. Choose Your Path
- **Simplest:** Copy the Agent call from [`START_BUILD.md`](START_BUILD.md) → Paste → Done
- **Balanced:** Use [`repeatable-one-input-prompt.md`](templates/product_documents/repeatable-one-input-prompt.md) → Auto-orchestrate with pauses
- **Full Control:** Follow [`master-orchestration-workflow.md`](templates/project_management/master-orchestration-workflow.md) → Manual phase-by-phase

### 3. Get Your Product
Phases 00–08 run automatically:
```
Orchestration → Product Definition → Design & Architecture → Technical Planning
→ Implementation (parallel) → QA → Documentation → Release → Cleanup
↓
Complete product with auditable trail in _delivery/
```

**Learn more:** [`CHOOSE_YOUR_PATH.md`](CHOOSE_YOUR_PATH.md) | [`START_BUILD.md`](START_BUILD.md)

---

## What Happens Automatically

When you trigger a build, the AI Orchestrator:

| Phase | Agent | What | Output |
|-------|-------|------|--------|
| 00 | AI Orchestrator | Plan phases, dependencies | Orchestration plan |
| 01 | Product Manager | Requirements & MVP | PRD |
| 02 | UX + Architecture + Security | Design & architecture | Specs + diagrams |
| 03 | Technical Lead | Implementation plan | Task breakdown |
| 04 | Frontend + Backend + DevOps | Implementation (parallel) | Code + infrastructure |
| 05 | QA Engineer | Testing | Test report + sign-off |
| 06 | Documentation Engineer | User/API docs | Documentation |
| 07 | Project Manager | Release | Live product |
| 08 | Cleanup Agent | Remove template artifacts | Clean codebase |

**Result:** Production-ready product with zero template junk.

---

## What You Get

```
_delivery/<project-name>/
├── master_progress.md (complete status)
├── 00_orchestration/ (planning)
├── 01_product/ (PRD with MVP scope)
├── 02_design/ (design specs)
├── 02_architecture/ (architecture + security)
├── 03_technical/ (task breakdown)
├── 04_infrastructure/ (CI/CD, infrastructure)
├── 05_qa/ (test report + sign-off)
├── 06_docs/ (user docs, API docs)
├── 07_release/ (release notes)
└── cleanup/ (cleanup report)

+ Clean, production-ready source code
+ Full audit trail of every decision
+ No template artifacts
```

---

## This Repository Includes

### Orchestration System (New!)
- [`START_BUILD.md`](START_BUILD.md) — Simplest way to build a product (3 steps)
- [`CHOOSE_YOUR_PATH.md`](CHOOSE_YOUR_PATH.md) — Decision tree for which approach to use
- [`templates/project_management/master-orchestration-workflow.md`](templates/project_management/master-orchestration-workflow.md) — Full phase-by-phase workflow with Agent prompts
- [`_delivery/`](_delivery/) — Delivery directory structure + templates for tracking progress

### Cleanup System (New!)
- [`CLEANUP_MANIFEST.md`](CLEANUP_MANIFEST.md) — Specification of what gets removed from template
- [`agents/engineering/cleanup_agent.md`](agents/engineering/cleanup_agent.md) — Cleanup Agent definition
- [`CLEANUP_PHASE_SUMMARY.md`](CLEANUP_PHASE_SUMMARY.md) — Overview of Phase 08

### Specialized Agents (15+ agents)
- `agents/` — Product Manager, UX Designer, Solution Architect, Security Engineer, Frontend/Backend/ML Engineers, Technical Lead, QA Engineer, DevOps Engineer, and more
- Each agent is a complete role definition with mission, responsibilities, process, and quality checklist

### Workflows & Checklists
- `workflows/` — Multi-agent workflows for project lifecycle, feature development, incident response
- `checklists/` — Quality gates for code review, security, pre-launch, and intake

### Templates & Guides
- `templates/` — PRD, technical specs, sprint plans, API specs, agent handoffs
- `docs/` — Architecture, troubleshooting, contributing guides
- `skills/` — Language, AI capability, and DevOps reference guides
- `knowledge/` — Best practices, decision log templates, technical reference
- `examples/` — Sample agent conversations and outputs

---

## How It Works

### Three Paths to Build

#### Path 1: Simplest ⚡ (Recommended for first product)
```
Copy Agent call from START_BUILD.md
Replace [YOUR PRODUCT IDEA] with your idea
Paste into Claude Code
Approve at quality gates
→ 3–4 weeks later: Shipped product
```

**Time to start:** 5 minutes | **Effort:** Minimal | **Control:** Low

#### Path 2: Balanced 🎯
```
Copy one-input-prompt
Replace [YOUR PRODUCT IDEA]
Paste into Claude Code
Auto-orchestrate with pauses between phases
→ 3–4 weeks later: Shipped product
```

**Time to start:** 10 minutes | **Effort:** Low | **Control:** Medium

#### Path 3: Full Control 🔧
```
Follow master-orchestration-workflow.md step-by-step
Manually invoke each agent
Customize at each phase
→ 4–6 weeks: Shipped product (you pace it)
```

**Time to start:** 30+ minutes | **Effort:** High | **Control:** Maximum

---

## Key Features

✓ **Orchestrated:** Agents run in correct sequence with explicit dependencies  
✓ **Parallel:** Frontend + Backend + DevOps run simultaneously (saves 2–3 weeks)  
✓ **Specialized:** Each agent stays in their lane (no generalists)  
✓ **Quality-Gated:** Bad outputs don't flow downstream (approval gates)  
✓ **Auditable:** Complete trail of every decision in `_delivery/`  
✓ **Clean:** Phase 08 removes all template artifacts  
✓ **Automated:** Runs with minimal human effort  
✓ **Recoverable:** Everything in git history; rollback anytime  

---

## Getting Started

### For Builders (You Want to Build a Product)

1. **Quick start:** Read [`START_BUILD.md`](START_BUILD.md) (5 minutes)
2. **Choose your path:** Read [`CHOOSE_YOUR_PATH.md`](CHOOSE_YOUR_PATH.md)
3. **Describe your idea** and let the system build it

### For Customizers (You Want to Adapt the System)

1. **Understand the system:** Read [`ORCHESTRATION_SETUP_GUIDE.md`](ORCHESTRATION_SETUP_GUIDE.md)
2. **Review agents:** Check `agents/` for specialized agent definitions
3. **Read the workflow:** See [`templates/project_management/master-orchestration-workflow.md`](templates/project_management/master-orchestration-workflow.md)
4. **Customize:** Modify agent prompts, add new agents, adjust phases

### For Developers (You Want to Understand Architecture)

1. **Architecture:** See `docs/architecture/`
2. **Agents:** See `agents/` (each agent is a markdown file with role definition)
3. **Workflows:** See `workflows/` (multi-agent processes)
4. **Reference:** See `docs/architecture/agent-selection-guide.md` for which agent to use when

---

## Example: Building a Habit Tracker

**Your input:**
```
"Build a habit tracker for busy professionals that syncs 
across devices and integrates with calendar apps."
```

**What happens automatically:**
```
Phase 00: Orchestrator plans the build
Phase 01: Product Manager writes PRD
Phase 02: UX Designer + Architect + Security review (parallel)
Phase 03: Technical Lead breaks down tasks
Phase 04: Frontend Engineer + Backend Engineer + DevOps build (parallel)
Phase 05: QA Engineer tests and signs off
Phase 06: Documentation Engineer writes user guides
Phase 07: Product Manager releases to production
Phase 08: Cleanup Agent removes template artifacts
```

**Time:** 3–4 weeks | **Effort:** ~5 hours (approvals at gates) | **Result:** Shipped, clean product

---

## File Structure

```
.
├── README.md (this file)
├── START_BUILD.md ⭐ (simplest way to build)
├── CHOOSE_YOUR_PATH.md ⭐ (pick your approach)
├── ORCHESTRATION_SETUP_GUIDE.md (system overview)
├── CLEANUP_MANIFEST.md (Phase 08 specification)
├── CLEANUP_PHASE_SUMMARY.md (cleanup explanation)
├── WHAT_YOU_CAN_DO_NOW.md (complete feature summary)
├── HOW_TO_USE_ONE_INPUT_PROMPT.md (for Path 2)
│
├── agents/ (15+ specialized agent definitions)
│   ├── core/ (Orchestrator, PM, Architect, Technical Lead, Project Manager)
│   ├── engineering/ (Frontend, Backend, ML, Data, Software, DevOps, Automation, Cleanup)
│   ├── quality_assurance/ (Code Reviewer, QA Engineer, Security Engineer)
│   └── operations/ (UX Designer, Forward Deployed Engineer)
│
├── templates/ (reusable templates for every phase)
│   ├── project_management/ (orchestration workflow, agent handoff, sprint plan)
│   ├── product_documents/ (PRD, one-input-prompt, repeatable prompt)
│   ├── technical_specs/ (architecture, ADRs, APIs, test plans, runbooks)
│   └── code_artifacts/ (API spec)
│
├── _delivery/ (delivery directory structure + templates)
│   ├── README.md (delivery directory guide)
│   ├── TEMPLATE_PROJECT/ (template project to copy)
│   └── QUICK_START.md (quick reference for delivery tracking)
│
├── workflows/ (multi-agent processes)
│   ├── project_lifecycle/
│   ├── feature_development/
│   ├── incident_response/
│   └── cross_functional/
│
├── checklists/ (quality gates)
│   ├── process/ (intake, delivery, kickoff)
│   ├── quality_assurance/ (code review, security, pre-launch, definition of done)
│
├── docs/ (documentation)
│   ├── user_guides/ (quickstart)
│   ├── architecture/ (system design, agent selection)
│   ├── api_reference/
│   ├── troubleshooting/
│   └── contributing/
│
├── skills/ (reference guides)
│   ├── languages/ (Python, JavaScript, Go, Rust, Java)
│   ├── ai_capabilities/ (Claude models, tool use, MCP)
│   └── platforms/ (AWS, GCP, Azure, deployment)
│
├── memory/ (evolving project state & decisions)
│   ├── README.md (guide to memory directory)
│   ├── AGENT_GUIDE.md (how agents use memory)
│   ├── context.md (project overview)
│   ├── architecture.md (current system design)
│   ├── decisions.md (ADRs and design decisions)
│   ├── product.md (vision & requirements)
│   ├── roadmap.md (timeline & milestones)
│   ├── current_state.md (implementation progress)
│   ├── known_issues.md (bugs & technical debt)
│   └── sessions/ (session summaries)
│
├── knowledge/ (domain knowledge)
│   ├── best_practices/ (code, architecture, testing, security)
│   ├── case_studies/ (decision logs, lessons learned)
│   └── technical_reference/
│
├── ai/ (AI model guidelines)
│   ├── model_selection.md
│   ├── system_prompt_guidelines.md
│   ├── safety.md
│   └── response_patterns.md
│
├── mcp/ (AI tool integrations)
│   ├── github_mcp.md
│   ├── slack_mcp.md
│   ├── database_mcp.md
│   └── deployment_mcp.md
│
└── scripts/ (operational guides)
    ├── setup.sh
    ├── validate.sh
    └── maintenance/
```

---

## Recommended Usage

### For New Products
1. Clone or fork this repository
2. Choose your path: [`START_BUILD.md`](START_BUILD.md), [`repeatable-one-input-prompt.md`](templates/product_documents/repeatable-one-input-prompt.md), or [`master-orchestration-workflow.md`](templates/project_management/master-orchestration-workflow.md)
3. Provide your product idea
4. Let the system build it (Phases 00–08 run automatically)
5. Review outputs in `_delivery/<project>/`

### For Customization
1. Review `agents/` to understand available roles
2. Read [`ORCHESTRATION_SETUP_GUIDE.md`](ORCHESTRATION_SETUP_GUIDE.md) to understand the system
3. Modify agent definitions, add new agents, or adjust phases as needed
4. Document your changes in `CLAUDE.md` (project instructions)

### For Teams
1. Use the `_delivery/` directory structure to organize deliverables
2. Update `master_progress.md` after each phase to track status
3. Use `workflows/` for cross-functional processes
4. Reference `checklists/` for quality gates at each phase

---

## Support

- **Quick questions:** See the relevant guide (e.g., `START_BUILD.md` for "how do I build a product?")
- **Architecture questions:** See `docs/architecture/`
- **Agent questions:** See individual agent files in `agents/`
- **Workflow questions:** See `workflows/`
- **Custom issues:** See `CLAUDE.md` for project-specific instructions

---

## Next Steps

👉 **To build your first product:** Start with [`START_BUILD.md`](START_BUILD.md) (5 minutes)

👉 **To understand your options:** Read [`CHOOSE_YOUR_PATH.md`](CHOOSE_YOUR_PATH.md)

👉 **To understand the full system:** Read [`ORCHESTRATION_SETUP_GUIDE.md`](ORCHESTRATION_SETUP_GUIDE.md)

👉 **To customize the system:** Read [`CLAUDE.md`](CLAUDE.md) and check `agents/` directory

---

**Ready to build? Start with [`START_BUILD.md`](START_BUILD.md) →**
