# Architecture Decision Record (ADR) Template

An ADR documents a significant architectural decision: what was decided, why, and what the consequences are.

The Solution Architect produces ADRs. Each significant decision gets its own file.

**Naming convention:** `adr-001-short-title.md`, `adr-002-short-title.md`, etc.

---

# ADR-[NUMBER]: [Short Decision Title]

**Date:**
**Status:** Proposed / Accepted / Deprecated / Superseded by ADR-[N]
**Deciders:** [Agent or human who made this decision]
**Consulted:** [Agents whose input informed this decision]

---

## Context

What is the situation that requires a decision?

Describe the forces at play — technical constraints, business requirements, team experience, timeline, scale expectations. Be factual, not evaluative.

---

## Decision

What was decided?

State it clearly in one or two sentences. Avoid hedging — this section should read as a firm commitment.

---

## Options Considered

### Option A: [Name]

**Description:** What this option involves.

**Pros:**
- [Pro 1]
- [Pro 2]

**Cons:**
- [Con 1]
- [Con 2]

---

### Option B: [Name]

**Description:** What this option involves.

**Pros:**
- [Pro 1]

**Cons:**
- [Con 1]

---

### Option C: [Name] *(if applicable)*

---

## Rationale

Why was the chosen option selected over the alternatives?

Reference the specific forces from the Context section. Explain why the chosen option's trade-offs are acceptable for this product at this stage.

---

## Consequences

### Positive
- [What becomes easier or better as a result of this decision]

### Negative
- [What becomes harder or worse — be honest]

### Risks
- [What could go wrong, and how likely is it]

---

## Revisit Trigger

Under what circumstances should this decision be reconsidered?

Examples:
- If monthly database costs exceed $X
- If we need to support more than Y concurrent users
- If a specific third-party dependency is deprecated

---

## Related Decisions

- ADR-[N]: [Title] — [how it relates]
