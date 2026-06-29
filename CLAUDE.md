# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

This repository is a library of AI agent definitions for a full software development lifecycle. Each agent in `agents/` is a markdown file containing a system prompt that defines the role, responsibilities, philosophy, process, and output standards for that AI persona.

## Repository Structure

```
agents/          # Agent system prompt definitions (one .md per role)
ai/              # Model selection, system prompt guidelines, safety rules, response patterns
checklists/      # Quality checklists (code review, security, pre-launch, process intake)
docs/            # Supporting documentation and user guides
examples/        # Example agent conversations, skill demonstrations, and output samples
knowledge/       # Shared domain knowledge (best practices, case studies, decision logs, tech reference)
mcp/             # MCP server setup guides (GitHub, Slack, database, deployment)
scripts/         # Operational guides (setup, validation, automation, maintenance)
skills/          # Reference guides for languages, AI capabilities, cloud platforms, DevOps tools
templates/       # Reusable templates (PRD, technical spec, sprint plan, API spec, agent handoff)
workflows/       # Multi-agent workflow definitions (project lifecycle, feature dev, incident, cross-functional)
```

## Agent File Convention

Each file in `agents/` follows this structure:

1. **Role** — one-paragraph description of who this agent is
2. **Mission** — the single guiding objective
3. **Responsibilities** — bulleted list of what the agent owns
4. **Philosophy / Principles** — how the agent thinks and prioritizes
5. **Process / Stages** — step-by-step workflow the agent follows
6. **Required Deliverables** — the exact output sections the agent must produce
7. **Behaviour Rules** — explicit constraints (what the agent never does)
8. **Quality Checklist** — self-verification steps before output is complete
9. **Output Standard** — audience and format expectations

Use `agents/core/product_manager.md` as the reference template for all other agent files — it contains the canonical example of a fully-specified agent.

## Agents Defined

| Agent | File |
|---|---|
| AI Orchestrator | `agents/core/ai_orchestrator.md` |
| Automation Agent | `agents/engineering/automation_agent.md` |
| Backend Engineer | `agents/engineering/backend_engineer.md` |
| Code Reviewer | `agents/quality_assurance/code_reviewer.md` |
| DevOps Engineer | `agents/engineering/devops_engineer.md` |
| Documentation Engineer | `agents/engineering/documentation_engineer.md` |
| Forward Deployed Engineer | `agents/operations/forward_deployed_engineer.md` |
| Frontend Engineer | `agents/engineering/frontend_engineer.md` |
| Product Manager | `agents/core/product_manager.md` |
| Project Manager | `agents/core/project_manager.md` |
| QA Engineer | `agents/quality_assurance/qa_engineer.md` |
| Security Engineer | `agents/quality_assurance/security_engineer.md` |
| Software Engineer | `agents/engineering/software_engineer.md` |
| Solution Architect | `agents/core/solution_architect.md` |
| Technical Lead | `agents/core/technical_lead.md` |
| UX Designer | `agents/operations/ux_designer.md` |

## Key Design Principles (from Product Manager reference)

Agent files embody these priorities in order:
1. Customer Value
2. Simplicity
3. Fast Learning
4. Business Impact
5. Maintainability
6. Extensibility

Each agent is scoped strictly to its domain — for example, the Product Manager never writes code or discusses architecture; the Software Engineer never makes product decisions. Cross-cutting concerns belong in `workflows/` as multi-agent sequences.

## When Adding a New Agent

- Follow the 9-section structure above
- Scope the agent's **Behaviour Rules** to explicitly exclude adjacent domains
- The agent's output must state which downstream agents consume it
- Add a **Quality Checklist** the agent runs on its own output before completion
