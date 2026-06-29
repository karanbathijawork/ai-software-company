# Slack MCP Setup

This guide explains how to connect the Slack MCP server so agents can send status updates, post to channels, and retrieve messages for context.

---

## What this enables

With the Slack MCP server connected, agents can:

- Post status reports and sprint updates to a channel
- Send escalation alerts when a blocker is identified
- Retrieve recent messages from a channel for context
- Notify stakeholders at key phase transitions

---

## Setup

### 1. Create a Slack App

1. Go to https://api.slack.com/apps and click "Create New App"
2. Choose "From scratch"
3. Name it "AI Orchestrator" and select your workspace
4. Under "OAuth & Permissions," add these Bot Token Scopes:
   - `chat:write` — to post messages
   - `channels:read` — to list channels
   - `channels:history` — to read channel messages
5. Click "Install to Workspace" and authorize the app
6. Copy the **Bot User OAuth Token** (starts with `xoxb-`)

### 2. Add the MCP server to Claude Code

```json
{
  "mcpServers": {
    "slack": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-slack"],
      "env": {
        "SLACK_BOT_TOKEN": "xoxb-your-token-here",
        "SLACK_TEAM_ID": "T0000000000"
      }
    }
  }
}
```

Find your Team ID in your Slack workspace URL: `https://app.slack.com/client/T0000000000/...`

### 3. Invite the bot to your channels

In Slack, open the channel you want the agent to post to and run:

```
/invite @AI Orchestrator
```

---

## Recommended channels

| Channel | Purpose |
|---|---|
| `#product-updates` | PM posts product briefs and PRD updates |
| `#engineering` | Technical Lead posts task breakdowns and design decisions |
| `#releases` | DevOps Engineer and Project Manager post deployment updates |
| `#incidents` | P0 and P1 incident alerts and resolution notices |

---

## Usage with this framework

Tell agents which channel to use in the handoff brief:

- "Post a status report to #engineering summarizing the task breakdown."
- "Send an escalation alert to #product-updates: [description of blocker]."
- "Notify #releases that the MVP has been deployed to production."
