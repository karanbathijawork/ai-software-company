# API Reference Guide

This directory contains the API reference documentation for products built with this framework.

---

## How to use this directory

When the Documentation Engineer produces API documentation for a product, it lives here.

Use the template at `templates/code_artifacts/api-spec-template.md` to document endpoints before implementation. After implementation, move the finalized spec here as the living reference.

---

## API Documentation Standards

### What every endpoint must document

- HTTP method and path
- Authentication requirement
- All request parameters (path, query, body) with types and whether they are required
- All response shapes for success and error cases
- Rate limits if applicable

### Format

Use the OpenAPI-compatible format defined in `templates/code_artifacts/api-spec-template.md`.

For large APIs, create one file per resource (e.g., `users-api.md`, `applications-api.md`).

### Versioning

When an API introduces breaking changes:
- Create a new versioned file (e.g., `api-v2.md`)
- Mark the old version as deprecated with a migration note at the top
- Keep the deprecated doc for one major release cycle

---

## Naming convention

```
[product-name]-api.md          # Full API reference for a product
[resource-name]-api.md         # Reference for a single resource
[product-name]-api-v2.md       # Versioned reference
```

---

## Keeping docs current

API documentation is owned by the Documentation Engineer and reviewed by the Backend Engineer on every PR that changes an endpoint.

An API change without a corresponding doc update is treated as an incomplete PR — the code reviewer checklist flags this explicitly.
