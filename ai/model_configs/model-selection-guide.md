# Model Selection Guide

Use this guide to choose the right Claude model for each agent role and task type.

---

## Current Model Options

| Model | ID | Best for |
|---|---|---|
| Claude Opus 4.8 | `claude-opus-4-8` | Complex reasoning, architecture decisions, long-context synthesis |
| Claude Sonnet 4.6 | `claude-sonnet-4-6` | Balanced quality and speed; most agent tasks |
| Claude Haiku 4.5 | `claude-haiku-4-5-20251001` | Fast, cheap tasks: classification, summarization, structured extraction |

---

## Recommended Model by Agent Role

| Agent | Recommended Model | Reason |
|---|---|---|
| AI Orchestrator | Opus 4.8 | Must reason across long contexts and coordinate multiple agents |
| Product Manager | Sonnet 4.6 | Deep domain reasoning without needing Opus-level compute |
| Solution Architect | Opus 4.8 | Architecture decisions require broad reasoning and trade-off analysis |
| Technical Lead | Sonnet 4.6 | Task breakdown and design docs are well within Sonnet's capability |
| Security Engineer | Opus 4.8 | Threat modeling requires nuanced, multi-factor reasoning |
| Frontend Engineer | Sonnet 4.6 | Code generation and UI implementation |
| Backend Engineer | Sonnet 4.6 | API and service implementation |
| Software Engineer | Sonnet 4.6 | General implementation tasks |
| DevOps Engineer | Sonnet 4.6 | CI/CD and infrastructure configuration |
| QA Engineer | Sonnet 4.6 | Test planning and defect analysis |
| Code Reviewer | Sonnet 4.6 | Code review and feedback |
| Documentation Engineer | Haiku 4.5 | Structured doc generation from clear inputs |
| Automation Agent | Haiku 4.5 | Repetitive scripting and templating tasks |
| Project Manager | Haiku 4.5 | Status updates, sprint tracking, simple reporting |
| UX Designer | Sonnet 4.6 | Design specifications and UX writing |
| Forward Deployed Engineer | Sonnet 4.6 | Customer-facing analysis and integration work |

---

## Task-Level Guidance

Use **Opus 4.8** when:
- The task requires synthesizing more than 5 documents
- The task involves ambiguous requirements where judgment matters
- The output significantly constrains all downstream agents
- The task involves security, legal, or architectural risk

Use **Sonnet 4.6** when:
- The task is clearly scoped and the inputs are well-defined
- Code generation, structured output, or single-domain reasoning
- The default choice when unsure

Use **Haiku 4.5** when:
- The output format is templated and the content is formulaic
- Speed matters more than depth
- The task will be reviewed by a higher-tier model before use

---

## Cost Guidance

Prefer Sonnet for most production agent work. Upgrade to Opus only for the highest-stakes reasoning tasks. Use Haiku for high-volume or low-stakes automation.

Check current pricing at: https://www.anthropic.com/pricing

---

## Context Window

All models support large context windows. For tasks that require passing the full PRD + architecture doc + task breakdown to a single agent, prefer Opus or Sonnet which handle long contexts reliably.
