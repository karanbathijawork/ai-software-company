# Test Plan Template

The QA Engineer produces this document before testing begins. Engineers use it to understand what will be tested and how.

---

# Test Plan: [Feature or Release Name]

**Version:** 1.0
**Date:**
**QA Engineer:**
**PRD Reference:** [link to PRD or feature brief]
**Target release date:**

---

## 1. Scope

### In scope
List the features, user stories, and acceptance criteria that will be tested.

- [ ] [User story or acceptance criterion]
- [ ] [User story or acceptance criterion]

### Out of scope
List anything explicitly excluded from this test pass and why.

- [Item] — [reason: deferred to next sprint / not yet implemented / covered by unit tests]

---

## 2. Test Environments

| Environment | URL / Access | Purpose |
|---|---|---|
| Local | `localhost:3000` | Developer smoke testing |
| Staging | `staging.[product].com` | QA testing |
| Production | `[product].com` | Smoke test post-deploy only |

---

## 3. Test Types

### Unit Tests
- Owner: Engineer
- Tool: [Vitest / Jest / Pytest]
- Coverage target: [e.g., 80% for business logic]
- Run: automatically in CI on every PR

### Integration Tests
- Owner: Engineer + QA Engineer
- Tool: [Vitest / Supertest / Pytest]
- Covers: API endpoints, database interactions, third-party integrations
- Run: automatically in CI on every PR

### End-to-End Tests
- Owner: QA Engineer
- Tool: [Playwright / Cypress]
- Covers: core user journeys from browser to database
- Run: on staging before every release

### Manual Exploratory Testing
- Owner: QA Engineer
- Covers: edge cases, UX flows, error states not covered by automation
- Run: before every release

### AI Output Testing *(for AI-powered features)*
- Owner: QA Engineer + ML Engineer
- Covers: prompt correctness, response quality, edge cases (empty input, very long input, adversarial prompts)
- Run: manually on staging; automated regression suite for known-good examples

---

## 4. Test Cases

### Core User Journey

| ID | Test Case | Steps | Expected Result | Priority |
|---|---|---|---|---|
| TC-001 | [Name] | 1. [Step] 2. [Step] | [What should happen] | P0 |
| TC-002 | | | | P1 |

### Edge Cases

| ID | Test Case | Steps | Expected Result | Priority |
|---|---|---|---|---|
| TC-010 | Empty input | Submit form with no data | Validation error shown | P1 |
| TC-011 | Maximum input | Submit form with 10,000 characters | Graceful truncation or error | P1 |

### Error States

| ID | Test Case | Steps | Expected Result | Priority |
|---|---|---|---|---|
| TC-020 | API failure | Simulate backend timeout | User sees friendly error, not stack trace | P0 |
| TC-021 | Auth expired | Access protected route with expired token | Redirected to login | P0 |

### Security Tests

| ID | Test Case | Expected Result |
|---|---|---|
| TC-030 | Access another user's data by guessing ID | 403 Forbidden |
| TC-031 | Submit HTML/script in input field | Rendered as plain text, not executed |
| TC-032 | Access protected API without auth token | 401 Unauthorized |

---

## 5. Regression Test Suite

List the test cases that must pass on every release, regardless of what changed.

- [ ] TC-001: [Core flow name]
- [ ] TC-020: API failure handling
- [ ] TC-021: Auth expiry handling
- [ ] TC-030: Authorization boundary

---

## 6. Exit Criteria

Testing is complete and sign-off can be given when:

- [ ] All P0 test cases pass
- [ ] All P1 test cases pass or are explicitly accepted as known issues
- [ ] No open critical (P0) defects
- [ ] No open high (P1) defects unless accepted with a documented mitigation
- [ ] Regression suite is green
- [ ] Security test cases pass

---

## 7. Defect Tracking

Log defects in [GitHub Issues / Linear / Jira] with:
- Severity: P0 / P1 / P2 / P3
- Steps to reproduce
- Expected vs actual behaviour
- Screenshot or recording if applicable

---

## 8. Sign-off

| Condition | Status |
|---|---|
| All exit criteria met | |
| Known issues documented | |
| QA Engineer sign-off | |
| Release approved | |
