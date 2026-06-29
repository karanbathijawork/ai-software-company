# Path 2: Balanced Build (Auto with Pauses)

**Recommended if you want automation with visibility.**

This path auto-orchestrates the build but pauses between phases so you can review and customize.

---

## ⏱️ Time Investment

- **To start:** 10 minutes
- **System builds:** 3–4 weeks (with pauses)
- **Your effort:** ~10–15 hours (review between phases)
- **Result:** Shipped, customized product

---

## How It's Different From Path 1

| Aspect | Path 1 | Path 2 |
|--------|--------|--------|
| **Automation** | Full | Full |
| **Pauses** | At gates only | Between phases |
| **Customization** | Can request changes | Can customize before proceeding |
| **Time to start** | 5 min | 10 min |
| **Your effort** | ~5 hours | ~10–15 hours |
| **Best for** | First products | Products needing customization |

---

## 🚀 How to Use This Path

### Step 1: Copy the Prompt

Open [`../../templates/product_documents/repeatable-one-input-prompt.md`](../../templates/product_documents/repeatable-one-input-prompt.md)

Copy the entire prompt block (everything between the triple backticks).

### Step 2: Replace Your Product Idea

Find this line in the prompt:

```
## Product Idea

"[YOUR PRODUCT IDEA HERE — 1–3 sentences describing problem, solution, and target users]"
```

Replace it with your actual product idea.

### Step 3: Paste into Claude Code

Paste the full prompt into Claude Code.

### Step 4: Follow the Flow

The Orchestrator will:

1. **Phase 00:** Show orchestration plan → "Approve?"
2. **Your review:** "Looks good" or "request changes"
3. **Phase 01:** Product Manager writes PRD → "Approve?"
4. **Your review:** "Good" or "adjust scope"
5. **Phase 02:** Design + Architecture → "Ready for Phase 03?"
6. **Your review:** "Proceed" or "refine before moving on"
7. ...continue through all phases

---

## What You Can Customize

Between phases, you can ask for:

- **MVP scope changes** — Remove features from MVP, move to Phase 2
- **Technical adjustments** — Different tech stack, architecture changes
- **Design changes** — UX tweaks, different approach
- **Timeline adjustments** — Speed up or slow down
- **Feature additions** — Add something not in original idea

---

## Approval Points

Same as Path 1, but with MORE review opportunities:

1. **After Phase 00:** Review orchestration plan
2. **After Phase 01:** Review PRD (can adjust scope)
3. **After Phase 02:** Review designs (can request changes)
4. **After Phase 03:** Review technical plan (can adjust tasks)
5. **After Phase 04:** Review implementation (before QA)
6. **After Phase 05:** Review QA results (approve release)

---

## Timeline

```
Day 1: Orchestration plan (your review)
Day 2–3: PRD (your review + potential adjustments)
Day 4–5: Design + Architecture (your review)
Day 6: Technical plan (your review)
Day 7–17: Implementation (you can check in progress)
Day 18–19: QA and fixes
Day 20: Documentation
Day 21: Release
Day 22: Cleanup

Total: ~3–4 weeks (your active involvement ~10–15 hours)
```

---

## Best For

✓ You want to customize significantly  
✓ You want to understand each phase output  
✓ You want to adjust based on what you see  
✓ It's an important product  
✓ You have time to review between phases  

---

## vs. Path 1

**Path 1** is best if: You just want to provide an idea and get a product  
**Path 2** is best if: You want to shape the product as it's being built

---

## Full Details

For complete details, see:
- [`understanding-the-system.md`](understanding-the-system.md) — System overview
- [`../../templates/product_documents/repeatable-one-input-prompt.md`](../../templates/product_documents/repeatable-one-input-prompt.md) — Full prompt

---

## Ready to Start?

1. Open [`../../templates/product_documents/repeatable-one-input-prompt.md`](../../templates/product_documents/repeatable-one-input-prompt.md)
2. Copy the prompt
3. Replace `[YOUR PRODUCT IDEA]`
4. Paste into Claude Code
5. Review outputs between phases and approve/customize

**System builds with your input throughout.** 🚀

---

**Questions?** Go back to the [Getting Started index](README.md)
