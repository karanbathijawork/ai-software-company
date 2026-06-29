# Technical Specification Template

Use this template to document the technical design of a feature or system before implementation begins.

The Technical Lead produces this document. Engineers use it as their implementation reference.

---

# [Feature or System Name]

**Author:** Technical Lead
**Date:**
**Status:** Draft / In Review / Approved
**PRD Reference:** [link to PRD section]

---

## 1. Problem

What technical problem is this spec solving?

- What is the current state?
- Why is the current state insufficient?
- What constraint or requirement drives this design?

---

## 2. Proposed Solution

One or two sentences describing the approach.

Why this approach over alternatives?

---

## 3. Architecture

### Components Affected

List the components or services this change touches.

- Component A — describe the change
- Component B — describe the change

### New Components

List any new services, modules, or layers being introduced.

### Dependency Changes

List any new third-party libraries or services required.

---

## 4. Data Model

### New Tables or Collections

```
TableName
  - field_name: type, constraints, description
  - field_name: type, constraints, description
```

### Changed Tables or Collections

```
ExistingTable
  - added: field_name: type, description
  - removed: field_name (reason)
  - changed: field_name — describe the change
```

### Migration Plan

How will existing data be migrated? What is the rollback plan if migration fails?

---

## 5. API Design

### New Endpoints

```
POST /api/resource
Request body: { field: type, field: type }
Response: { field: type, field: type }
Auth required: yes/no
```

### Changed Endpoints

Describe any breaking or non-breaking changes to existing endpoints.

---

## 6. Security Considerations

- What data is stored or transmitted by this feature?
- Who has access to it?
- What authorization checks are required?
- Are there any new attack surfaces introduced?

---

## 7. Performance Considerations

- Estimated read/write volume
- Any queries that could be slow at scale
- Caching strategy (if any)
- Pagination or streaming requirements

---

## 8. Testing Plan

### Unit Tests

What functions or modules require unit tests?

### Integration Tests

What end-to-end flows must be tested?

### Edge Cases

List the non-obvious scenarios that must be covered.

---

## 9. Rollout Plan

- Is this a breaking change? If yes, how will backwards compatibility be handled?
- Is a feature flag required?
- What is the deployment order if multiple services are involved?
- What does rollback look like if this release fails?

---

## 10. Open Questions

List unresolved decisions that must be answered before implementation can begin.

| Question | Owner | Deadline |
|---|---|---|
| | | |

---

## 11. Alternatives Considered

List the approaches that were ruled out and why.

| Approach | Reason rejected |
|---|---|
| | |
