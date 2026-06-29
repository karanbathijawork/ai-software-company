# How to Use One-Input-Prompt to Force Orchestration

This guide explains how to use the updated `repeatable-one-input-prompt.md` to **force the Orchestrator to invoke specialized agents** instead of doing all the work itself.

---

## The Key Difference

### Old One-Input-Prompt
- Allowed the Orchestrator to interpret its role loosely
- Could lead to the Orchestrator (or Claude) doing all the work end-to-end
- No forced structure, no audit trail

### New One-Input-Prompt
- **Explicitly tells the Orchestrator HOW to work** (invoke agents via Agent tool, save to _delivery/, enforce gates)
- **Makes it impossible for Claude to rationalize doing downstream work**
- **Enforces the phase structure, parallel work, and quality gates**

---

## How to Use It

### Step 1: Prepare Your Product Idea

Write 1–3 sentences:
```
"Build a simple habit tracker for busy professionals that syncs 
across devices and integrates with calendar apps to remind them 
of daily habits."
```

### Step 2: Copy the One-Input-Prompt

Open [`templates/product_documents/repeatable-one-input-prompt.md`](templates/product_documents/repeatable-one-input-prompt.md)

Copy the entire prompt block (everything between the triple backticks).

### Step 3: Replace the Product Idea

In the prompt, find this line:
```
## Product Idea

"[YOUR PRODUCT IDEA HERE — 1–3 sentences describing problem, solution, and target users]"
```

Replace it with your actual product idea.

### Step 4: Invoke the Orchestrator via Agent Tool

In Claude Code, use the **Agent** tool:

```
Agent(
  description: "Orchestrator with structured one-input prompt",
  prompt: "[PASTE THE ENTIRE PROMPT FROM STEP 2 HERE]"
)
```

### Step 5: The Orchestrator Will Execute Phases 00–07

The Orchestrator **will not do the downstream work itself**. Instead, it will:

**Phase 00:** Produce orchestration plan, save to `_delivery/<project>/00_orchestration/`
↓ (human approval gate)

**Phase 01:** Invoke Product Manager via Agent tool → save PRD to `_delivery/<project>/01_product/`
↓ (human approval gate)

**Phase 02:** Invoke UX Designer, Architect, Security in parallel → save to `_delivery/<project>/02_design/`, `02_architecture/`
↓ (quality gate)

**Phase 03:** Invoke Technical Lead → save to `_delivery/<project>/03_technical/`
↓ (quality gate)

**Phase 04:** Invoke Frontend Engineer, Backend Engineer, DevOps in parallel → code to repo, infrastructure to `_delivery/<project>/04_infrastructure/`
↓ (CI green, PRs reviewed)

**Phase 05:** Invoke QA Engineer → save test report to `_delivery/<project>/05_qa/`
↓ (QA sign-off)

**Phase 06:** Invoke Documentation Engineer → save docs to `_delivery/<project>/06_docs/`
↓ (docs complete)

**Phase 07:** Invoke Project Manager for release coordination → save release notes to `_delivery/<project>/07_release/`

---

## Why This Forces Structured Orchestration

The updated prompt includes these **non-negotiable constraints**:

### 1. "You do NOT do the work of downstream agents"
```
Violates: Writing the PRD, design spec, or code yourself
Enforces: Invoking the appropriate agent via Agent tool
```

### 2. "You follow the exact phase sequence"
```
Violates: Skipping phases, parallelizing incorrectly, or starting Phase 04 before Phase 03
Enforces: Phase 00 → 01 → 02 → ... → 07, with clear dependencies
```

### 3. "You save everything to `_delivery/<project-name>/`"
```
Violates: Scattered outputs in different locations
Enforces: Standardized delivery directory with auditable trail
```

### 4. "You enforce quality gates"
```
Violates: Proceeding with bad outputs or skipping approvals
Enforces: Human approval at PRD, Architecture, Technical Plan, QA sign-off
```

### 5. "You parallelize where safe"
```
Violates: Running UX Designer, then Architect sequentially
Enforces: Design + Architecture run simultaneously (they don't depend on each other)
```

### 6. "You create an auditable trail"
```
Violates: No tracking of decisions, blockers, or handoffs
Enforces: master_progress.md updated after every phase
```

---

## Example: Using One-Input-Prompt

**Input (your product idea):**
```
"Build a simple habit tracker for busy professionals that syncs 
across devices and integrates with calendar apps."
```

**What happens (structured orchestration):**

```
Phase 00: Orchestrator analyzes idea, produces:
  ✓ Intake Summary
  ✓ Orchestration Plan (phases, agents, sequence)
  ✓ Dependency Map
  → Saves to _delivery/habit-tracker/00_orchestration/
  → Waits for human approval ⏸

Phase 01: Orchestrator INVOKES Product Manager
  → Product Manager produces PRD
  → Saves to _delivery/habit-tracker/01_product/prd.md
  → Waits for human approval ⏸

Phase 02a: Orchestrator INVOKES UX Designer (parallel)
  → Creates wireframes, design specs
  → Saves to _delivery/habit-tracker/02_design/

Phase 02b: Orchestrator INVOKES Solution Architect (parallel)
  → Creates architecture document, ADRs
  → Saves to _delivery/habit-tracker/02_architecture/

Phase 02c: Orchestrator INVOKES Security Engineer
  → Reviews threat model, security requirements
  → Saves to _delivery/habit-tracker/02_architecture/security_assessment.md

Phase 03: Orchestrator INVOKES Technical Lead
  → Creates task breakdown, coding standards, test plan
  → Saves to _delivery/habit-tracker/03_technical/

Phase 04a: Orchestrator INVOKES Frontend Engineer (parallel)
  → Implements UI, component library
  → Submits PRs to code repo
  → Each PR goes through Code Reviewer before merge

Phase 04b: Orchestrator INVOKES Backend Engineer (parallel)
  → Implements APIs, database layer
  → Submits PRs to code repo
  → Each PR goes through Code Reviewer before merge

Phase 04c: Orchestrator INVOKES DevOps Engineer (parallel)
  → Sets up CI/CD, infrastructure, observability
  → Saves to _delivery/habit-tracker/04_infrastructure/

Phase 05: Orchestrator INVOKES QA Engineer
  → Executes test plan
  → Reports defects (if any)
  → Signs off: "Ready for Production"
  → Saves to _delivery/habit-tracker/05_qa/

Phase 06: Orchestrator INVOKES Documentation Engineer
  → Creates user guide, API docs, runbooks
  → Saves to _delivery/habit-tracker/06_docs/

Phase 07: Orchestrator INVOKES Project Manager
  → Coordinates release
  → Creates release notes, stakeholder comms
  → Saves to _delivery/habit-tracker/07_release/

RESULT:
✓ Orchestrator managed the entire workflow
✓ Specialized agents did their own work (not Claude doing everything)
✓ Complete audit trail in _delivery/habit-tracker/master_progress.md
✓ Clear handoffs between agents
✓ Parallel work where possible
✓ Quality gates enforced
```

---

## What You'll Get

After using the one-input-prompt, you'll have:

```
_delivery/habit-tracker/
├── master_progress.md (complete status & approvals)
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
│   ├── testing_strategy.md
│   └── dependency_graph.md
├── 04_infrastructure/
│   ├── ci_cd_pipeline.md
│   └── infrastructure_as_code/
├── 05_qa/
│   ├── test_report.md
│   └── release_sign_off.md
├── 06_docs/
│   ├── user_guide/
│   ├── api_docs/
│   └── runbooks/
└── 07_release/
    ├── release_notes.md
    └── post_release_plan.md
```

**All from a single one-line product idea!** But with full orchestration, specialized agents, and auditable trail.

---

## When to Use One-Input-Prompt

Use this when you want:
- ✓ Fast project kickoff
- ✓ End-to-end orchestration (Phases 00–07)
- ✓ Auditable trail in `_delivery/`
- ✓ Parallel work where possible
- ✓ Specialized agents doing their own work

**Do NOT use this if:**
- ✗ You only need a quick experiment (use the simpler old approach or manual Agent calls)
- ✗ You want to cherry-pick phases (use the full workflow guide instead)
- ✗ You need to customize heavily between phases (use the full workflow guide)

---

## Troubleshooting: "Claude is Still Doing All the Work"

If you find Claude/the Orchestrator is doing all the work instead of invoking agents:

1. **Check the prompt was pasted correctly:** The constraint section is what forces the orchestration
2. **Look for "I will invoke the Product Manager agent"** — if you see that, it's working
3. **Check `_delivery/` structure:** If files are appearing in the right places, agents are being invoked
4. **If still not working:** The Orchestrator may need clarification. Try rephrasing the constraint that's being violated

Example: If the Orchestrator is writing design specs instead of invoking UX Designer, add this feedback:
```
"Stop. You are writing the design spec yourself. 
INSTEAD: Invoke the UX Designer agent using the Agent tool 
with the prompt template from the workflow guide Phase 02."
```

---

## Key Files

- **The prompt itself:** [`templates/product_documents/repeatable-one-input-prompt.md`](templates/product_documents/repeatable-one-input-prompt.md)
- **Full orchestration workflow** (if you need to customize phases): [`templates/project_management/master-orchestration-workflow.md`](templates/project_management/master-orchestration-workflow.md)
- **Delivery directory structure:** [`_delivery/README.md`](_delivery/README.md)
- **Orchestrator agent definition:** [`agents/core/ai_orchestrator.md`](agents/core/ai_orchestrator.md)

---

## Summary

The updated **one-input-prompt** is a **self-contained orchestration system**:

1. You provide a product idea
2. The Orchestrator executes Phases 00–07
3. Each phase invokes the right agent (via Agent tool)
4. Everything saves to `_delivery/`
5. Quality gates are enforced
6. You get a complete, auditable product build

It's the **fastest way to go from idea → shipped product** while maintaining full orchestration and specialized agent roles.

Try it! 🚀
