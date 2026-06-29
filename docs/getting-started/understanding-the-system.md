# Orchestration Setup Guide

This guide explains the system I've created to ensure your **AI Orchestrator agent drives product builds** instead of Claude Code doing all the work itself.

---

## The Problem You Had

When you tried to build a product using your agent definitions, Claude Code would:
- Read the agent files as reference material
- Do all the work itself (writing PRD, designing, coding, etc.)
- Never invoke the specialized agents from your `agents/` directory

This defeated the purpose of having specialized agents with clearly defined roles.

---

## The Solution

I've created a **three-part system** that ensures proper orchestration:

### 1. Master Orchestration Workflow Template
**File:** `templates/project_management/master-orchestration-workflow.md`

This is the **meta-workflow** that you (the human) follow to build a product. It:
- Shows how to invoke the AI Orchestrator **first**
- Shows how to invoke each specialized agent **in sequence**
- Provides the exact **Agent call template** for each phase
- Includes **quality gates** to prevent bad outputs from flowing downstream
- Identifies **parallel work opportunities** (frontend + backend + infrastructure can run simultaneously)
- Documents the **auditable trail** of all decisions

**Key insight:** The template is NOT written by agents—it's a procedure that you follow to *invoke* agents correctly.

---

### 2. Delivery Directory Structure
**Directory:** `_delivery/<project-name>/`

This is where all project outputs are stored in a standardized structure:

```
_delivery/<project-name>/
├── master_progress.md (tracks which agents have run, status, blockers)
├── 00_orchestration/ (AI Orchestrator output)
├── 01_product/ (Product Manager output)
├── 02_design/ (UX Designer output)
├── 02_architecture/ (Solution Architect + Security Engineer outputs)
├── 03_technical/ (Technical Lead output)
├── 04_infrastructure/ (DevOps Engineer + Automation Agent outputs)
├── 05_qa/ (QA Engineer output)
├── 06_docs/ (Documentation Engineer output)
└── 07_release/ (Project Manager output)
```

Each subdirectory contains the **exact deliverables** that agent produces, making it easy to trace:
- Which agent produced what
- When it was completed
- What the quality gate approval was
- Which agent receives it next

---

### 3. Progress Tracking Template
**File:** `_delivery/TEMPLATE_PROJECT/master_progress.md`

This is the **single source of truth** for project status. It tracks:
- ✓ Which phases are complete
- ⏳ Which agents are working now
- ⏸ Which agents are waiting for upstream inputs
- Quality gate approvals (with signatures)
- Blockers and risks
- Dependencies between agents

**Update frequency:** After each agent completes work (typically daily)

---

## How to Use This System

### For Your First Project:

**1. Write your product brief** (1–3 paragraphs describing the problem, solution, users, and constraints)

**2. Create the project directory:**
```bash
mkdir -p _delivery/<your-project-name>
cp _delivery/TEMPLATE_PROJECT/master_progress.md _delivery/<your-project-name>/
# (then customize the template with your project info)
```

**3. Invoke the AI Orchestrator**

Using Claude Code's Agent tool, call the Orchestrator with:
- Your product brief
- The prompt template from `QUICK_START.md` (Step 4)

The Orchestrator will produce:
- Intake Summary (clarified product idea)
- Orchestration Plan (phases, agents, sequencing)
- Dependency Map (which agent outputs feed which)
- Quality Gates (what to verify before each phase)

**4. Get human approval**

Print the Orchestration Plan for your project sponsor to review and approve. This is a hard gate—don't proceed without sign-off.

**5. Follow the orchestration workflow**

Use `templates/project_management/master-orchestration-workflow.md` as your phase-by-phase guide:
- Phase 00: Orchestration (already done)
- Phase 01: Product Manager → PRD
- Phase 02: UX Designer + Solution Architect + Security Engineer (parallel)
- Phase 03: Technical Lead → Task breakdown
- Phase 04: Frontend Engineer + Backend Engineer + DevOps Engineer (parallel)
- Phase 05: QA Engineer → Test report + sign-off
- Phase 06: Documentation Engineer → User docs
- Phase 07: Project Manager → Release

For each phase:
- Copy the **Agent prompt template** from the workflow doc
- Invoke the **Agent tool** with that prompt
- Save the output to the **corresponding `_delivery/` subdirectory**
- Update **`master_progress.md`**
- Get **quality gate approval** before moving to the next phase

**6. Parallelize where safe**

The Orchestration Plan identifies which agents can work in parallel (e.g., UX Designer and Solution Architect don't depend on each other). Invoke them simultaneously in separate Agent calls.

---

## Key Files Created

| File | Purpose |
|---|---|
| `templates/project_management/master-orchestration-workflow.md` | Step-by-step procedure for invoking agents in sequence; includes prompt templates for each phase |
| `_delivery/README.md` | Documentation of the delivery directory structure and quality gates |
| `_delivery/TEMPLATE_PROJECT/master_progress.md` | Template for tracking project status; copy and customize for each new project |
| `_delivery/QUICK_START.md` | Quick reference guide for kicking off a new project (condensed version of the full workflow) |
| `ORCHESTRATION_SETUP_GUIDE.md` | This file—explains the complete system |

---

## Why This Works

### 1. **Agent Invocation is Explicit**

Instead of Claude Code reading agent files and doing the work, you explicitly invoke each agent via the Agent tool. The Orchestrator goes first and dictates the sequence.

### 2. **Specialized Agents Stay in Their Lane**

- Product Manager writes the PRD (no code, no architecture)
- Solution Architect designs the system (no code, no product decisions)
- Frontend Engineer implements UI (no backend, no product decisions)

Each agent has clear boundaries, and the Orchestrator ensures no agent steps on another's toes.

### 3. **Parallel Work is Coordinated**

The Orchestration Plan identifies safe parallel work:
- UX Designer and Solution Architect don't depend on each other (both depend on PRD)
- Frontend Engineer and Backend Engineer can work in parallel (with a handoff on API contracts)
- Documentation Engineer and QA Engineer can run in parallel with implementation

### 4. **Auditable Trail**

Every phase has:
- Clear inputs (what the agent receives)
- Clear outputs (what the agent produces)
- Clear quality gate (how to verify the output is good)
- Clear location in `_delivery/` (easy to find and review)

A human stakeholder can review `_delivery/<project>/master_progress.md` and know exactly:
- What's been done
- Who did it
- What quality gates were passed
- What's pending
- What's blocked

### 5. **Dependencies are Managed**

The Dependency Map shows:
- Which agent outputs feed which downstream agents
- Critical path (the longest sequence of dependent work)
- Parallel work streams (safe to run simultaneously)

If Frontend Engineer needs API contracts from Backend Engineer, this is explicit in the dependency graph. The Orchestrator doesn't let Frontend Engineer start until those contracts are available.

---

## Example: Two-Week Product Build

Here's what a typical 2-week build looks like using this system:

```
Week 1
├─ Day 1-2:  Phase 00 (Orchestration) + Phase 01 (PRD)
├─ Day 3-4:  Phase 02 (Design + Architecture, parallel) + Security review
└─ Day 5-6:  Phase 03 (Technical planning)

Week 2
├─ Day 7-10: Phase 04 (Implementation, parallel)
│   ├─ Frontend Engineer
│   ├─ Backend Engineer
│   ├─ DevOps Engineer (infrastructure + CI/CD)
│   └─ Code Reviewer (continuous)
├─ Day 11:   Phase 05 (QA + bug fixes)
├─ Day 12:   Phase 06 (Documentation)
└─ Day 13:   Phase 07 (Release)
```

**Critical Path:** Phases 01 → 02 → 03 → 04 → 05 → 07 (≈13 days)
**Parallel Streams:** Design, Architecture, Security (Phase 02) + Frontend, Backend, DevOps (Phase 04)

---

## Integration with Your Existing Repo

The system works **with** your existing structure:

- ✓ **Agent definitions** stay in `agents/` — they're the reference
- ✓ **Templates** are in `templates/` — they provide standard formats
- ✓ **Deliverables** go in `_delivery/` — they're the outputs
- ✓ **Code** goes in your code repository (separate from `_delivery/`)
- ✓ **Documentation** goes in `docs/` and `_delivery/<project>/06_docs/`

---

## Avoiding the Original Mistake

The key to avoiding your original problem:

### ❌ Don't do this:
```
Claude Code reads agents/ directory
Claude Code thinks "I should do all the work"
Claude Code builds entire product itself
Result: Orchestrator never runs, agents never invoked
```

### ✓ Do this instead:
```
Human creates _delivery/<project>/ directory
Human invokes AI Orchestrator agent explicitly (via Agent tool)
Orchestrator produces orchestration plan with agent sequence
Human invokes each agent in sequence using templates
Each agent produces output to _delivery/<project>/
Result: Orchestrator runs, all agents run, auditable trail
```

**The key difference:** You control which agent runs by invoking it explicitly with the Agent tool, not by letting Claude Code decide.

---

## Customizing for Your Needs

This system is **flexible**:

- **Skip phases if not needed:** If you don't need QA (small project), skip Phase 05
- **Adjust agent roster:** If you don't have a dedicated UX Designer, maybe the Frontend Engineer handles design
- **Adjust timeline:** Quality gates are hard; phases are flexible
- **Add new agents:** If you add agents to your `agents/` directory, add them to the Orchestrator's Agent Roster

But the **core process** always stays the same:
1. Orchestrator first (orchestration plan)
2. Sequence defined by dependencies
3. Each agent invoked explicitly
4. Outputs tracked in `_delivery/`
5. Quality gates enforced before phase transitions

---

## Next Steps

1. **Read the full workflow:**
   - `templates/project_management/master-orchestration-workflow.md` (complete phase-by-phase guide)
   - `_delivery/QUICK_START.md` (condensed quick reference)

2. **Prepare your first product:**
   - Write a product brief
   - Create `_delivery/<project-name>/` directory
   - Copy `master_progress.md` template

3. **Invoke the Orchestrator:**
   - Use `_delivery/QUICK_START.md` Step 4 as your prompt template
   - Supply your product brief
   - Get the orchestration plan approved

4. **Follow the orchestration workflow:**
   - Each phase has a prompt template in the workflow document
   - Invoke agents in order
   - Update `master_progress.md` after each phase
   - Gate on quality before advancing

---

## Questions?

- **How does orchestration work?** → See `agents/core/ai_orchestrator.md`
- **What are the phases?** → See `templates/project_management/master-orchestration-workflow.md` (sections Phase 1–10)
- **How do I track progress?** → See `_delivery/TEMPLATE_PROJECT/master_progress.md`
- **How do I get started quickly?** → See `_delivery/QUICK_START.md`
- **What's the directory structure?** → See `_delivery/README.md`

---

**You now have everything you need to build products with proper orchestration, specialized agents, and auditable trails.**

Let's build something great! 🚀
