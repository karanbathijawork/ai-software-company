# Code Review Checklist

Use this checklist on every pull request before approving and merging.

---

## Correctness

- The code does what the ticket or task description says it should do
- Edge cases are handled (empty input, null values, boundary conditions)
- No logic errors or off-by-one mistakes in loops or conditionals
- Async operations are handled correctly (no race conditions, unhandled rejections)
- Error paths return sensible responses and do not expose internal state

---

## Security

- No secrets, API keys, or credentials in the code
- User input is validated before use
- SQL queries use parameterized statements or an ORM — no string concatenation
- Authentication is checked before any protected resource is accessed
- File paths are not constructed from user input without sanitization
- Dependencies added in this PR do not have known critical vulnerabilities

---

## Tests

- New behavior has corresponding tests
- Tests cover the happy path and at least one failure case
- Tests are not testing implementation details that could change without breaking behavior
- Existing tests still pass

---

## Code Quality

- Functions do one thing
- Variable and function names clearly describe what they represent
- No dead code, commented-out code, or debug logs left in
- No unnecessary duplication — shared logic is extracted if used more than twice
- Complexity is appropriate for the problem (not over-engineered, not under-engineered)

---

## Performance

- No obvious N+1 query patterns introduced
- No large data loads into memory without pagination or streaming
- No blocking operations on the main thread (for frontend or Node.js code)

---

## Documentation

- Public APIs, exported functions, or complex logic have a short explanatory comment if the intent is not obvious from the code
- Any new environment variables are documented in the setup guide
- Breaking changes are noted in the PR description

---

## Final Gate

The reviewer approves the PR only when:
- All items above are satisfied or explicitly accepted as a known tradeoff
- The CI pipeline is green
- Any open comments are resolved or marked as non-blocking
