# GitHub MCP Setup

This guide explains how to connect the GitHub MCP server so agents can read repositories, create issues, open pull requests, and check CI status.

---

## What this enables

With the GitHub MCP server connected, agents in this framework can:

- Read files from any repository you have access to
- Create and update issues
- Open and review pull requests
- Check CI/CD run status
- Search code across repositories

---

## Setup

### 1. Generate a GitHub Personal Access Token

1. Go to GitHub → Settings → Developer settings → Personal access tokens → Fine-grained tokens
2. Create a new token with these permissions:
   - **Repository contents:** Read and write
   - **Issues:** Read and write
   - **Pull requests:** Read and write
   - **Actions:** Read (for CI status)
3. Copy the token — you will not be able to see it again

### 2. Add the MCP server to Claude Code

Add this to your Claude Code MCP settings (`~/.claude/settings.json` or the project `.claude/settings.json`):

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_token_here"
      }
    }
  }
}
```

### 3. Verify the connection

In Claude Code, ask: "List the repositories I have access to on GitHub."

If the MCP server is connected correctly, Claude will return a list of your repositories.

---

## Usage with this framework

When handing off between agents, you can reference GitHub issues or PRs directly:

- "Review PR #42 in the [repo] repository and produce code review feedback."
- "Create a GitHub issue for this defect in [repo]: [defect description]."
- "Check the CI status of the latest push to the main branch in [repo]."

---

## Security notes

- Store the token as an environment variable, not hardcoded in the settings file
- Use the minimum permissions required for your use case
- Rotate the token if it is ever accidentally committed to a repository
