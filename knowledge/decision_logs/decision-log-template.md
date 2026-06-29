# Decision Log Template

Use this template to record significant decisions made during a product build.

Log decisions that are hard to reverse, that affect multiple agents, or that future team members would need to understand to maintain or extend the product.

---

# Decision Log: [Project Name]

---

## Entry Format

Each decision uses this format:

---

### Decision [Number]: [Short title]

**Date:**
**Made by:** [Agent or human]
**Status:** Decided / Superseded / Reverted

**Context:**
What situation or requirement triggered this decision?

**Options considered:**

| Option | Pros | Cons |
|---|---|---|
| Option A | | |
| Option B | | |

**Decision:**
What was decided.

**Rationale:**
Why this option over the alternatives.

**Consequences:**
What this decision affects downstream. What becomes harder or easier as a result.

**Revisit trigger:**
Under what circumstances should this decision be reconsidered?

---

## Example Entry

---

### Decision 1: Use Supabase for Auth and Database

**Date:** 2025-01-15
**Made by:** Solution Architect
**Status:** Decided

**Context:**
We needed auth and a relational database for MVP. The team had no strong preference and wanted the fastest path to a working product.

**Options considered:**

| Option | Pros | Cons |
|---|---|---|
| Supabase | Managed, includes auth and Postgres, great DX, generous free tier | Vendor dependency, limited control over infrastructure |
| Self-hosted Postgres + Auth.js | Full control, no vendor lock-in | More setup time, more maintenance burden |
| Firebase | Mature, widely used | NoSQL only, more expensive at scale, different query model |

**Decision:**
Use Supabase.

**Rationale:**
Fastest path to a working product with minimal infrastructure overhead. The free tier is sufficient for MVP. The trade-off of vendor dependency is acceptable at this stage.

**Consequences:**
Data model must be relational. Migration to self-hosted Postgres is straightforward if needed later.

**Revisit trigger:**
If monthly costs exceed $200 or if we need database features Supabase does not support.
