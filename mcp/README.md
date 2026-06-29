# mcp/

**Purpose:** Model Context Protocol (MCP) server definitions for integrating external systems, APIs, and data sources. Enables agents to access tools and information from third-party platforms.

**What Belongs Here:**
- MCP server configurations for GitHub, GitLab, and source control systems
- Communication platform integrations (Slack, Teams, Email)
- Data source connections (databases, APIs, document stores)
- Deployment and CI/CD platform integrations

**What Does NOT Belong Here:**
- Agent definitions (see agents/)
- Business logic or workflows (see workflows/)
- Skill definitions (see skills/)
- Usage examples (see examples/)
- Implementation code for the MCP servers

**Structure:**
```
mcp/
├── code_hosting/   GitHub, GitLab, Gitea configurations
├── communication/  Slack, Teams, Discord, Email integrations
├── data_sources/   Databases, APIs, CMS, data lakes
└── deployment/     Jenkins, GitHub Actions, GitLab CI configs
```
