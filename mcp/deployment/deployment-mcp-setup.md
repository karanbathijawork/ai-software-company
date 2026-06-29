# Deployment MCP Setup

This guide explains how to connect deployment platforms so agents can trigger deployments, check status, and roll back.

---

## Supported platforms

| Platform | Best for |
|---|---|
| Vercel | Frontend, Next.js, static sites |
| Railway | Backend services, databases, workers |
| Fly.io | Containerized apps, global edge deployment |

---

## Vercel Setup

### 1. Get a Vercel token

1. Go to Vercel → Settings → Tokens
2. Create a token with "Full Account" scope
3. Copy the token

### 2. Add to Claude Code settings

```json
{
  "mcpServers": {
    "vercel": {
      "command": "npx",
      "args": ["-y", "vercel-mcp-adapter"],
      "env": {
        "VERCEL_TOKEN": "your_token_here"
      }
    }
  }
}
```

### 3. Common operations

- "Deploy the latest commit to Vercel production."
- "Check the status of the most recent Vercel deployment."
- "Roll back to the previous Vercel deployment."
- "List all deployments for [project name]."

---

## Railway Setup

### 1. Get a Railway token

1. Go to Railway → Account Settings → Tokens
2. Create a new token
3. Copy the token

### 2. Add to Claude Code settings

```json
{
  "mcpServers": {
    "railway": {
      "command": "npx",
      "args": ["-y", "railway-mcp"],
      "env": {
        "RAILWAY_TOKEN": "your_token_here"
      }
    }
  }
}
```

### 3. Common operations

- "Deploy the latest version of [service] on Railway."
- "Check the health of the [service] Railway deployment."
- "View the most recent deployment logs for [service]."

---

## Usage with this framework

The DevOps Engineer agent uses deployment MCP connections to:

1. Trigger production deployments after QA sign-off
2. Verify deployment health after release
3. Execute rollbacks if a deployment introduces a regression
4. Report deployment status to the Project Manager

---

## Safety rules

- Always require explicit confirmation before triggering a production deployment
- Always check CI status before deploying — never deploy a failing build
- Always have a rollback plan documented before deploying a breaking change
- Production deployment tokens must be stored as environment variables, not in code
