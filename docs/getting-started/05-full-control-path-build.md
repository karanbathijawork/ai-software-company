# Path 3: Full Control Build (Manual Phase-by-Phase)

**Recommended if you want maximum customization and control.**

This path lets you manually orchestrate each phase, customize as you go, and have full visibility into everything.

---

## ⏱️ Time Investment

- **To start:** 30+ minutes per phase
- **System builds:** 4–6 weeks (you pace it)
- **Your effort:** 20–40 hours (you control each phase)
- **Result:** Highly customized product

---

## How It's Different

| Aspect | Path 1 | Path 2 | Path 3 |
|--------|--------|--------|--------|
| **Automation** | Full | Full | None (you invoke) |
| **Control** | Low | Medium | Maximum |
| **Customization** | Request changes | Pause + customize | Full control |
| **Time to start** | 5 min | 10 min | 30+ min |
| **Your effort** | ~5 hrs | ~10–15 hrs | ~20–40 hrs |
| **Pacing** | Fixed | Flexible | Fully flexible |
| **Best for** | First products | Important products | Complex products |

---

## How It Works

Instead of copying a prompt and letting the system run, you:

1. Follow a step-by-step guide (the orchestration workflow)
2. Manually invoke each agent
3. Customize the prompt for each agent
4. Review outputs in detail
5. Gate on quality before proceeding
6. Pace the work however you want

---

## The Complete Guide

The full step-by-step guide is here:

📖 **[`../../templates/project_management/master-orchestration-workflow.md`](../../templates/project_management/master-orchestration-workflow.md)**

This file contains:
- Phase 00 instructions (orchestration planning)
- Phase 01 instructions (product management)
- Phase 02 instructions (design + architecture)
- Phase 03 instructions (technical planning)
- Phase 04 instructions (implementation)
- Phase 05 instructions (QA)
- Phase 06 instructions (documentation)
- Phase 07 instructions (release)
- Phase 08 instructions (cleanup)

Each phase includes:
- **What agent to invoke**
- **Exact prompt to use** (copy-paste ready)
- **What to save** (where outputs go)
- **Quality gate checklist** (what to verify)

---

## Basic Process

For each phase:

### 1. Read the Phase Instructions
Open the workflow guide and read the phase section.

### 2. Invoke the Agent
```
Agent(
  description: "Agent Name — What they do",
  prompt: """
  [Copy the exact prompt from the workflow guide]
  """
)
```

### 3. Review the Output
Carefully review what the agent produced.

### 4. Gate on Quality
Check the quality gate checklist:
- Is the output complete?
- Does it match requirements?
- Are there any issues?

### 5. Proceed or Iterate
- **If good:** Save output and move to next phase
- **If issues:** Send it back to the agent for revision

### 6. Update Tracking
Update `_delivery/<project>/master_progress.md` with status.

---

## When to Use Path 3

Use this if you:

✓ Want to customize each phase heavily  
✓ Want to understand every detail  
✓ Have specialized requirements  
✓ Are building something complex  
✓ Have time for detailed involvement  
✓ Want to control timing completely  

---

## Timeline Example

```
Week 1
├─ Day 1: Phase 00 (orchestration planning) - Your review
├─ Day 2–3: Phase 01 (PRD) - Your detailed review + adjustments
├─ Day 4–5: Phase 02 (design) - Your review
└─ Day 6: Phase 03 (technical planning) - Your review

Week 2
├─ Days 7–10: Phase 04 (implementation) - You monitor, can adjust
├─ Days 11–12: Phase 05 (QA) - You review results
├─ Day 13: Phase 06 (documentation) - Your review
└─ Day 14: Phase 07 (release) - You approve

Week 3
└─ Day 15: Phase 08 (cleanup) - You verify

Total: ~3 weeks minimum, but you can stretch or compress
```

---

## Advantages

✓ **Maximum control** — You decide everything  
✓ **Deep understanding** — You see every phase in detail  
✓ **Full customization** — Modify prompts, skip sections, add steps  
✓ **Flexible timing** — Do 1 phase per day or 1 per week  
✓ **Special requirements** — Can incorporate unique needs  

---

## Disadvantages

✗ **More work** — You invoke each agent manually  
✗ **Slower** — Takes more time than Paths 1–2  
✗ **More decisions** — You make every decision  
✗ **Requires understanding** — You need to understand the system  

---

## Key Files

1. **Orchestration workflow:** [`../../templates/project_management/master-orchestration-workflow.md`](../../templates/project_management/master-orchestration-workflow.md)
   - Complete phase-by-phase guide
   - Agent prompts for each phase
   - Quality gates for each phase

2. **Project tracking:** `_delivery/<project>/master_progress.md`
   - Updates this after each phase
   - Tracks blockers and decisions

3. **Agent definitions:** `../../agents/`
   - Understand each agent's role
   - Read their definitions if customizing prompts

---

## Getting Started

1. **Clone the repo**
   ```bash
   git clone https://github.com/karanbathijawork/ai-software-company.git
   cd ai-software-company
   ```

2. **Create your project directory**
   ```bash
   mkdir -p _delivery/my-project/{00_orchestration,01_product,02_design,...}
   ```

3. **Copy the progress tracker**
   ```bash
   cp _delivery/TEMPLATE_PROJECT/master_progress.md _delivery/my-project/
   ```

4. **Open the workflow guide**
   - [`../../templates/project_management/master-orchestration-workflow.md`](../../templates/project_management/master-orchestration-workflow.md)

5. **Follow Phase 00 instructions**
   - Invoke AI Orchestrator
   - Review the orchestration plan
   - Approve before proceeding

6. **Continue through all phases**
   - Follow the guide
   - Customize as needed
   - Update progress tracker

---

## Tips for Success

1. **Read the full workflow guide** — Understand the complete process before starting
2. **Prepare your product idea** — Have it written out clearly
3. **Create project directory** — Set up `_delivery/` structure from the start
4. **Update progress tracker** — Keep `master_progress.md` current
5. **Save all outputs** — Keep everything organized in `_delivery/`
6. **Gate on quality** — Don't move to next phase if something isn't right
7. **Customize thoughtfully** — Don't skip important phases

---

## Full Details

Everything you need is in:
📖 **[`../../templates/project_management/master-orchestration-workflow.md`](../../templates/project_management/master-orchestration-workflow.md)**

That's your complete reference for all phases and agents.

---

## Ready to Start?

1. Read [`../../templates/project_management/master-orchestration-workflow.md`](../../templates/project_management/master-orchestration-workflow.md)
2. Create your `_delivery/` directory
3. Copy the progress tracker
4. Start with Phase 00
5. Follow the guide

**You have full control from here.** 🎯

---

**Questions?** Go back to the [Getting Started index](README.md)
