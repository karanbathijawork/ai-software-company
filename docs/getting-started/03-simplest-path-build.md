# Path 1: Simplest Build (Fully Automated)

**Recommended for your first product.**

This is the fastest, easiest way to build. You provide a product idea, and the system handles everything else.

---

## ⏱️ Time Investment

- **To start:** 5 minutes
- **System builds:** 3–4 weeks (automatic)
- **Your effort:** ~5 hours (approvals at gates)
- **Result:** Shipped, clean product

---

## 🚀 The Three Steps

### Step 1: Copy the Agent Call

The full agent call is in [`../../START_BUILD.md`](../../START_BUILD.md).

Open that file and copy the entire `Agent(` block (everything inside the triple backticks).

### Step 2: Replace Your Product Idea

In the Agent call you copied, find this line:

```
PRODUCT IDEA:
[YOUR PRODUCT IDEA — 1–3 sentences describing the problem, solution, and target users]
```

Replace `[YOUR PRODUCT IDEA...]` with your actual product idea.

**Example:**
```
PRODUCT IDEA:
Build a habit tracker for busy professionals that syncs 
across devices and integrates with calendar apps to remind 
them of daily habits.
```

### Step 3: Paste and Start

Paste the full Agent call into Claude Code.

That's it! The system will:
1. Create `_delivery/<project-name>/` directory
2. Run Phase 00 (orchestration plan)
3. Ask for your approval
4. Continue through Phases 01–08

---

## What Happens Next

### Phase 00: Orchestration (Your First Approval)
- System analyzes your product idea
- Creates orchestration plan
- Asks: "Ready to proceed?"
- You: "Approve" or request changes

### Phases 01–02: Planning & Design
- Product Manager writes PRD
- UX Designer + Architect + Security work in parallel
- System asks approvals as needed

### Phase 03: Technical Planning
- Technical Lead breaks down implementation
- Creates task breakdown and coding standards

### Phases 04–06: Implementation
- Frontend Engineer + Backend Engineer build code
- DevOps Engineer sets up infrastructure
- QA Engineer tests
- Documentation Engineer writes docs
- All in parallel where possible

### Phase 07: Release
- Product Manager coordinates deployment
- Your product goes live

### Phase 08: Cleanup
- Cleanup Agent removes all template artifacts
- Leaves pristine, clean codebase

---

## Your Approval Gates

You'll be asked to approve at these points:

1. **Orchestration Plan** (5 min)
   - Question: "Does this plan address your product?"
   - Your answer: "Yes" or "request changes"

2. **PRD** (5 min)
   - Question: "Is the MVP scope correct?"
   - Your answer: "Approve" or "adjust scope"

3. **Architecture** (5 min)
   - Question: "Do we like this design?"
   - Your answer: "Good" or "request changes"

4. **Technical Plan** (5 min)
   - Question: "Are tasks well-scoped?"
   - Your answer: "Approve" or "adjust"

5. **QA Sign-Off** (5 min)
   - Question: "Is quality good to ship?"
   - Your answer: "Release" or "fix defects first"

**Total approval time:** ~25 minutes spread over 3–4 weeks

---

## Where Your Files Go

Everything is organized in `_delivery/<project-name>/`:

```
_delivery/habit-tracker/
├── master_progress.md (status of all phases)
├── 00_orchestration/ (planning)
├── 01_product/ (PRD with MVP scope)
├── 02_design/ (design specs + wireframes)
├── 02_architecture/ (architecture + security)
├── 03_technical/ (task breakdown + coding standards)
├── 04_infrastructure/ (CI/CD + infrastructure)
├── 05_qa/ (test report + defects if any)
├── 06_docs/ (user guide + API docs)
├── 07_release/ (release notes)
└── cleanup/ (what was cleaned up)
```

---

## Your Product Code

The actual product code will be in your repository at its normal location (e.g., `src/`, `app/`, etc.).

**It will be clean** — Phase 08 removes all template artifacts, so it looks like it was purpose-built, not generated from a template.

---

## What's Automatic

You don't have to do these things — the system does them:

✓ Create directory structure  
✓ Invoke Product Manager for PRD  
✓ Invoke UX Designer for design  
✓ Invoke Solution Architect for architecture  
✓ Invoke Security Engineer for threat model  
✓ Invoke Technical Lead for task breakdown  
✓ Invoke Frontend Engineer for implementation  
✓ Invoke Backend Engineer for APIs  
✓ Invoke DevOps Engineer for infrastructure  
✓ Invoke QA Engineer for testing  
✓ Invoke Documentation Engineer for docs  
✓ Invoke Project Manager for release  
✓ Invoke Cleanup Agent to remove junk  
✓ Update `master_progress.md` after each phase  
✓ Track blockers and decisions  

---

## Common Questions

**Q: What if I want to change something mid-build?**  
A: Tell the Orchestrator during an approval gate. "Before proceeding, adjust X". The system will update the plan.

**Q: What if something doesn't look right?**  
A: Request changes at any approval gate. The system will iterate.

**Q: How do I know what's happening?**  
A: Check `_delivery/<project>/master_progress.md` — it's updated after each phase.

**Q: Can I stop and resume later?**  
A: Yes. Check `master_progress.md` to see which phase you're on, then tell the Orchestrator to continue from there.

**Q: Do I need to be technical?**  
A: Nope! Just approve at gates. The system handles everything.

---

## Full Details

For complete details on what happens in each phase, see:
- [`understanding-the-system.md`](understanding-the-system.md) — System overview
- [`../../START_BUILD.md`](../../START_BUILD.md) — Full Agent call

---

## Ready to Start?

1. Open [`../../START_BUILD.md`](../../START_BUILD.md)
2. Copy the Agent call
3. Replace `[YOUR PRODUCT IDEA]`
4. Paste into Claude Code
5. Approve at gates

**That's it! The system builds your product.** 🚀

---

**Questions?** Go back to the [Getting Started index](README.md)
