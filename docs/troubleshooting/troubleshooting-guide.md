# Troubleshooting Guide

Use this guide when agents produce unexpected results or the workflow stalls.

---

## Agent produces generic or shallow output

**Symptom:** The agent's output is vague, misses obvious requirements, or could apply to any product.

**Causes and fixes:**

1. **The input was too thin.** Agents produce output proportional to the quality of their input. Check that the handoff brief included the intake summary, assumptions log, and a specific task instruction.

2. **The agent was asked to do too much at once.** Split the request into smaller, focused tasks.

3. **The output format was not specified.** Add "produce the output in this format: [example]" to the prompt.

4. **The quality checklist was not run.** Ask the agent explicitly: "Run your quality checklist before finalizing this output."

---

## Agent keeps asking for more information

**Symptom:** The agent responds with questions instead of producing output.

**Fix:** Add this instruction to the prompt: "Do not ask for more information. Make a reasonable assumption for anything that is unclear, state your assumptions explicitly, and produce the output."

This is also configurable per agent in the system prompt — see `ai/system_prompts/system-prompt-guidelines.md`.

---

## Two agents produce conflicting outputs

**Symptom:** The frontend engineer's implementation doesn't match the UX design, or the backend API doesn't match the technical spec.

**Fix:**
1. Identify which agent's output is upstream (closer to requirements)
2. That output is the source of truth
3. Send the downstream agent the conflict with the upstream output and ask it to reconcile
4. If reconciliation requires a product decision, escalate to the Product Manager
5. If it requires an architectural decision, escalate to the Solution Architect

See the conflict resolution section in `agents/core/ai_orchestrator.md` for the full protocol.

---

## Workflow stalls between phases

**Symptom:** An agent has completed its output but the next phase hasn't started.

**Fix:** Check the quality gate for the completed phase. If the gate is not met, send the output back for revision. If the gate is met, explicitly activate the next agent with the appropriate handoff using `templates/project_management/agent-handoff-template.md`.

---

## Agent output does not meet the quality gate

**Symptom:** The Orchestrator's quality gate checklist fails on a specific condition.

**Fix:**
1. Identify the specific failing condition
2. Send the output back to the producing agent with the exact condition that failed
3. Ask for a revised output that satisfies that condition
4. Re-check the gate after revision

Never pass a failing output downstream — errors compound.

---

## MCP integration is not working

**Symptom:** Claude says it cannot access GitHub, Slack, or a database when you expect it to.

**Fix:**
1. Check that the MCP server is listed in `.claude/settings.json`
2. Verify the token or credentials in the MCP config are valid and have the required permissions
3. Restart the Claude Code session — MCP servers are loaded at session start
4. Check the setup guide for the specific integration in the `mcp/` directory

---

## Product brief is too broad for implementation

**Symptom:** Engineers cannot start work because the MVP scope is too large or contains too many unknowns.

**Fix:** Return to the Product Manager with this instruction: "The MVP scope is too large to implement in one pass. Please identify the single highest-value user story and scope the MVP to that story only. Defer everything else explicitly."

---

## CI/CD pipeline is failing

**Symptom:** The GitHub Actions workflow is red.

**Fix:**
1. Read the failing job's output in the Actions tab
2. Common causes: missing environment variable, failing test, lint error, type error
3. Fix the root cause — never skip or bypass CI to unblock a deploy
4. If the failure is in a test that is testing the wrong thing, fix the test, not the CI config

See `scripts/automation/automation-guide.md` for pipeline reference.
