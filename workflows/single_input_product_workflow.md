# Single-Input Product Delivery Workflow

## Purpose

This workflow allows Claude Code to take one user input and turn it into a working MVP without requiring additional clarification.

## Single Input Contract

The user provides exactly one input:

- a product idea
- a problem statement
- or a one-sentence request for a software product

Example:

- “Build a habit tracker for busy professionals.”
- “Create a simple AI-powered resume reviewer.”

## Non-Negotiable Rules

1. Do not ask the user for more information unless a blocker makes execution impossible.
2. When details are missing, make a reasonable default assumption and record it.
3. Optimize for the simplest working MVP that demonstrates the core value.
4. Prefer proven, low-friction implementation choices over experimental complexity.
5. Produce a runnable result, not just a plan.
6. If the product cannot be fully built in one pass, produce the highest-value working slice first and clearly mark the rest as follow-up work.

## Required Execution Sequence

### Phase 0 — Interpret the Input

Convert the single input into:

- a product name
- a one-sentence value proposition
- a target user
- a primary problem
- a minimal success metric

If the idea is vague, choose the most common-sense interpretation and proceed.

### Phase 1 — Define the MVP

Create a concise product brief containing:

- problem statement
- target user
- core user journey
- MVP scope
- success metrics
- assumptions
- non-goals

Keep scope narrow. The goal is to ship value quickly.

### Phase 2 — Plan the Delivery

Break the MVP into:

- product requirements
- user stories
- technical tasks
- testing plan
- deployment plan

Use a phased implementation order:

1. core user flow
2. persistence and data model
3. UI polish
4. tests and quality checks
5. documentation and run instructions

### Phase 3 — Implement the Product

Build the smallest version that can actually run.

Implementation rules:

- choose the simplest stack that can deliver the experience
- create a working project structure first
- implement the core flow before extras
- add tests for the main behavior
- include setup instructions

### Phase 4 — Validate the Result

Before finishing, verify:

- the product runs locally
- the core workflow is usable
- key user actions work
- tests pass or the main path is documented
- setup instructions are clear

### Phase 5 — Deliver the Final Output

Produce a final handoff that includes:

- what was built
- how to run it
- what the MVP covers
- what remains as future enhancements
- any assumptions made during execution

## Default Assumptions Policy

When the user does not specify details, use these defaults:

- build a web app unless a different format is clearly implied
- use a simple modern stack with strong developer ergonomics
- prioritize speed over perfection
- use local-first or lightweight deployment where possible
- default to a single-user or single-team workflow unless collaboration is explicitly required

## Quality Gates

Do not consider the project complete until:

- the product has a clear MVP definition
- the core workflow is implemented
- there is a runnable path
- the result is documented
- the user can understand how to use it

## Output Standard

The final result should feel like a real product kickoff, not a brainstorm. It should include:

- a clear product definition
- an implementation plan
- a working deliverable
- usage instructions
- next-step recommendations
