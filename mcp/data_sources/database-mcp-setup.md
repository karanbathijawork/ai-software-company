# Database MCP Setup

This guide explains how to connect a database via MCP so agents can query data, inspect schemas, and run migrations.

---

## What this enables

With a database MCP server connected, agents can:

- Read schema information to inform architecture and API design
- Query data to produce reports or validate feature behavior
- Run migrations as part of a deployment workflow
- Inspect existing data models before adding new fields

---

## Supported databases

| Database | MCP Server Package |
|---|---|
| PostgreSQL | `@modelcontextprotocol/server-postgres` |
| SQLite | `@modelcontextprotocol/server-sqlite` |

---

## PostgreSQL Setup

### 1. Get your connection string

Format: `postgresql://user:password@host:port/database`

For Supabase, find this under Project Settings → Database → Connection string.

### 2. Add the MCP server to Claude Code

```json
{
  "mcpServers": {
    "postgres": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres", "postgresql://user:password@host:5432/dbname"]
    }
  }
}
```

---

## SQLite Setup

```json
{
  "mcpServers": {
    "sqlite": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sqlite", "--db-path", "/path/to/your/database.db"]
    }
  }
}
```

---

## Security rules

- **Never connect a production database with write access during development.**
- Use a read-only user for schema inspection and reporting tasks.
- Use a migration user (limited to schema changes) for migration tasks.
- Never put connection strings with credentials in version control — use environment variables.

**Safer connection string pattern:**

```json
{
  "mcpServers": {
    "postgres": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres"],
      "env": {
        "DATABASE_URL": "postgresql://readonly_user:password@host:5432/dbname"
      }
    }
  }
}
```

---

## Usage with this framework

- **Solution Architect:** "Inspect the current schema and identify tables relevant to the new feature."
- **Backend Engineer:** "After implementing the migration, run it against the development database."
- **QA Engineer:** "Query the test database to confirm that the expected records were created."
