# Choose Your Path: Orchestration Methods

You now have **three ways** to orchestrate a product build, depending on how much control you want.

---

## Path 1: "Just Tell Me to Build" (Simplest)

**File:** [`START_BUILD.md`](START_BUILD.md)

**Best for:** You have a product idea and want everything automated

**What you do:**
1. Copy the Agent call from `START_BUILD.md`
2. Replace `[YOUR PRODUCT IDEA]` with your idea
3. Paste into Claude Code
4. Approve at gates when asked

**What happens automatically:**
- Creates `_delivery/<project-name>/` directory
- Invokes AI Orchestrator (Phase 00)
- Invokes Product Manager (Phase 01)
- Invokes UX + Architecture + Security in parallel (Phase 02)
- Invokes Technical Lead (Phase 03)
- Invokes engineers in parallel (Phase 04)
- Invokes QA (Phase 05)
- Invokes Documentation (Phase 06)
- Invokes Project Manager for release (Phase 07)
- Updates `master_progress.md` at each step

**Timeline:** Phases 00–07 run back-to-back (3–4 weeks depending on complexity)

**Control level:** 🟢 Minimal (just approve at gates)

---

## Path 2: "Manual Phase-by-Phase" (Most Control)

**File:** [`templates/project_management/master-orchestration-workflow.md`](templates/project_management/master-orchestration-workflow.md)

**Best for:** You want to control timing, review between phases, or customize

**What you do:**
1. Follow the step-by-step guide in the workflow doc
2. Manually invoke each Agent with the provided prompt templates
3. Review outputs before moving to the next phase
4. Gate on quality at each transition

**Timeline:** You control pacing (can do 1 phase per day, or spread over weeks)

**Control level:** 🟠 High (you decide when each phase runs)

---

## Path 3: "One-Input Prompt" (Balanced)

**File:** [`templates/product_documents/repeatable-one-input-prompt.md`](templates/product_documents/repeatable-one-input-prompt.md)

**Best for:** Automated orchestration with ability to pause between phases

**What you do:**
1. Copy the prompt from the file
2. Replace `[YOUR PRODUCT IDEA]` with your idea
3. Paste into Claude Code
4. Approve at quality gates when asked

**What happens:**
- Similar to Path 1, but you can pause and review between phases
- Provides more structure than Path 1 (shows you the orchestration plan first)

**Timeline:** Phases run sequentially with human approval gates (3–4 weeks)

**Control level:** 🟡 Medium (approve at gates, can pause to customize)

---

## Comparison

| Aspect | Path 1: Just Build | Path 2: Manual | Path 3: One-Input |
|--------|-------------------|---|---|
| **Fastest?** | ✓ Fully automated | ✗ You control pacing | ✓ Mostly automated |
| **Most control?** | ✗ Minimal | ✓ Full control | ~ Moderate |
| **Customization easy?** | ~ If blocked, you ask | ✓ You modify prompts | ~ You can ask orchestrator |
| **Best for first project?** | ✓ Yes | ✗ Too manual | ✓ Yes |
| **Best for complex projects?** | ~ Maybe | ✓ Yes | ✓ Yes |
| **Audit trail?** | ✓ Full (in `_delivery/`) | ✓ Full (in `_delivery/`) | ✓ Full (in `_delivery/`) |
| **Setup time** | 5 minutes | 30 minutes | 10 minutes |

---

## Which Path Should I Choose?

### Use **Path 1 (Just Build)** if:
- ✓ You want to go from idea → shipped product with minimal effort
- ✓ You trust the Orchestrator to make good decisions
- ✓ You just want to review and approve at quality gates
- ✓ You're building a straightforward product

### Use **Path 2 (Manual)** if:
- ✓ You want fine-grained control over timing
- ✓ You want to review every deliverable in detail before next phase
- ✓ You're building something complex and want to customize heavily
- ✓ Your team has explicit requirements for phase timing

### Use **Path 3 (One-Input)** if:
- ✓ You want automation but with visibility into the orchestration plan first
- ✓ You want to pause between phases and review/customize
- ✓ You're somewhere between "fully automated" and "fully manual"

---

## The Recommended Path for You

**Start with Path 1 (Just Build) for your first project.**

Why?
- ✓ Fastest to get results
- ✓ Forces structured orchestration (hard gates, quality checks)
- ✓ Creates full audit trail automatically
- ✓ Lets you see if the system works before getting fancier

**If you like it:** Keep using Path 1 for future projects

**If you want more control:** Switch to Path 2 for a future project

---

## All Three Paths Produce the Same Result

No matter which path you choose, you end up with:

```
_delivery/<project-name>/
├── 00_orchestration/ (orchestration plan)
├── 01_product/ (PRD)
├── 02_design/ (design spec)
├── 02_architecture/ (architecture + security)
├── 03_technical/ (task breakdown)
├── 04_infrastructure/ (CI/CD, infrastructure)
├── 05_qa/ (test report + sign-off)
├── 06_docs/ (user guide, API docs)
├── 07_release/ (release notes)
└── master_progress.md (complete status)
```

The difference is **how long it takes** and **how much control you have**.

---

## Example: Building a Habit Tracker

### Path 1 (Just Build)
```
You: "Copy START_BUILD.md, replace product idea with 'habit tracker'"
Orchestrator: "Phase 00 complete. Approve? → Yes → Phase 01..."
[3–4 weeks later]
You: "Product is built and live"
```
**Time to first message:** 5 minutes
**Total time:** 3–4 weeks (all automated)

### Path 2 (Manual)
```
You: "Follow workflow doc Phase 1: Invoke Orchestrator"
You: "Review orchestration plan: looks good"
You: "Follow workflow doc Phase 2: Invoke Product Manager"
You: "Review PRD: modify scope slightly"
You: "Follow workflow doc Phase 3: Invoke UX Designer..."
[manually invoke each phase]
```
**Time to first message:** 30 minutes per phase
**Total time:** 4–6 weeks (you pace it)

### Path 3 (One-Input)
```
You: "Copy repeatable-one-input-prompt.md, replace product idea"
Orchestrator: "Here's the orchestration plan. Approve?"
You: "Approve → Phase 01 starting..."
Orchestrator: "Phase 01 complete. Approve to proceed?"
You: "Approve → Phase 02..."
```
**Time to first message:** 10 minutes
**Total time:** 3–4 weeks (automated, with pauses)

---

## Quick Decision Tree

```
Do you want fully automated orchestration?
├─ YES → Use Path 1 (START_BUILD.md)
│        Copy prompt → Paste → Watch it work
└─ NO   → Do you want to control pacing?
          ├─ YES → Use Path 2 (master-orchestration-workflow.md)
          │        Manually invoke each phase
          └─ NO   → Use Path 3 (repeatable-one-input-prompt.md)
                    Auto-orchestrate with pauses between phases
```

---

## Next Steps

1. **Pick your path** using the decision tree above
2. **Open the corresponding file:**
   - Path 1: `START_BUILD.md`
   - Path 2: `templates/project_management/master-orchestration-workflow.md`
   - Path 3: `templates/product_documents/repeatable-one-input-prompt.md`
3. **Follow the instructions** in that file
4. **Build your product!**

---

## FAQ

**Q: Can I switch paths mid-project?**
A: Yes! If you start with Path 1 but want more control, you can switch to Path 2. Just check `master_progress.md` to see which phase you're on, then continue manually from there.

**Q: Do all paths use the same agents?**
A: Yes! All three paths invoke the same specialized agents (Product Manager, UX Designer, etc.). The difference is just how you orchestrate them.

**Q: Which path do you recommend?**
A: Start with **Path 1** for your first product. It's the fastest and forces best practices (quality gates, audit trail, structured phases). Once you're comfortable, you can use Path 2 or 3 if you want more control.

**Q: What if I get stuck?**
A: All paths will tell you what's blocking progress. Check `_delivery/<project>/master_progress.md` for the current blocker and next step. The Orchestrator can help unblock you.

---

## Summary

| Path | Entry Point | Best For | Time to Start | Control |
|------|-------------|----------|---|---|
| 1 | `START_BUILD.md` | Fully automated | 5 min | 🟢 Low |
| 2 | `master-orchestration-workflow.md` | Fine-grained control | 30 min | 🔴 High |
| 3 | `repeatable-one-input-prompt.md` | Balanced | 10 min | 🟡 Medium |

**Recommendation:** Start with Path 1. 🚀
