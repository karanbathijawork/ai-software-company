# API Specification Template

Use this template to document API endpoints before implementation begins.

The Backend Engineer produces this document. The Frontend Engineer uses it to implement data fetching. The QA Engineer uses it to write integration tests.

---

# API Specification: [Service or Feature Name]

**Version:** 1.0
**Base URL:** `/api/v1`
**Auth:** All endpoints require a valid session token in the `Authorization: Bearer <token>` header unless marked public.

---

## Endpoints

---

### [Resource Name]

#### `GET /resource`

Returns a list of resources for the authenticated user.

**Auth required:** Yes

**Query parameters:**

| Parameter | Type | Required | Description |
|---|---|---|---|
| `page` | integer | No | Page number, default 1 |
| `limit` | integer | No | Items per page, default 20, max 100 |

**Response `200 OK`:**

```json
{
  "data": [
    {
      "id": "string",
      "name": "string",
      "createdAt": "ISO 8601 timestamp"
    }
  ],
  "total": 100,
  "page": 1,
  "limit": 20
}
```

**Error responses:**

| Status | Code | Description |
|---|---|---|
| 401 | `UNAUTHORIZED` | Missing or invalid token |
| 500 | `INTERNAL_ERROR` | Unexpected server error |

---

#### `GET /resource/:id`

Returns a single resource by ID.

**Auth required:** Yes

**Path parameters:**

| Parameter | Type | Description |
|---|---|---|
| `id` | string | The resource ID |

**Response `200 OK`:**

```json
{
  "id": "string",
  "name": "string",
  "createdAt": "ISO 8601 timestamp"
}
```

**Error responses:**

| Status | Code | Description |
|---|---|---|
| 401 | `UNAUTHORIZED` | Missing or invalid token |
| 403 | `FORBIDDEN` | User does not own this resource |
| 404 | `NOT_FOUND` | Resource does not exist |

---

#### `POST /resource`

Creates a new resource.

**Auth required:** Yes

**Request body:**

```json
{
  "name": "string (required, max 200 chars)"
}
```

**Response `201 Created`:**

```json
{
  "id": "string",
  "name": "string",
  "createdAt": "ISO 8601 timestamp"
}
```

**Error responses:**

| Status | Code | Description |
|---|---|---|
| 400 | `VALIDATION_ERROR` | Request body failed validation |
| 401 | `UNAUTHORIZED` | Missing or invalid token |

---

#### `PUT /resource/:id`

Updates an existing resource. All fields are optional — only send what you want to change.

**Auth required:** Yes

**Request body:**

```json
{
  "name": "string (optional, max 200 chars)"
}
```

**Response `200 OK`:**

```json
{
  "id": "string",
  "name": "string",
  "updatedAt": "ISO 8601 timestamp"
}
```

---

#### `DELETE /resource/:id`

Deletes a resource permanently.

**Auth required:** Yes

**Response `204 No Content`**

---

## Error Format

All error responses follow this format:

```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human-readable description of what went wrong"
  }
}
```

---

## Rate Limits

- 100 requests per minute per authenticated user
- 429 Too Many Requests is returned when the limit is exceeded
- `Retry-After` header indicates when the client may retry

---

## Changelog

| Version | Date | Change |
|---|---|---|
| 1.0 | | Initial spec |
