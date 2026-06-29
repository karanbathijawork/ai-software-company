# Project Intake Protocol

Use this protocol whenever the orchestrator receives a new product request.

## Purpose

Turn a single user input into a structured intake package that can be handed off to the Product Manager without ambiguity.

## Required Intake Output

The orchestrator must produce the following sections before handing off:

1. Intake Summary
2. Clarification Log
3. Assumptions Log
4. MVP Hypothesis
5. Handoff Brief

## 1. Intake Summary
Include:
- Product idea
- Target user
- Main problem
- Desired outcome
- Initial scope

## 2. Clarification Log
Include:
- Whether clarification was needed
- Any questions asked
- Any questions skipped because the request was clear enough

## 3. Assumptions Log
Include:
- Assumptions made to proceed
- Default choices used when specifics were missing
- Any risks created by those assumptions

## 4. MVP Hypothesis
Include:
- Proposed MVP definition
- Why this is the right first version
- What it should prove
- Success metric for the first release

## 5. Handoff Brief
Include:
- A short handoff note for the Product Manager
- The product context to use
- The recommended next step

## Decision Rule

- If the request is clear, proceed directly.
- If the request is ambiguous in a way that would materially change the product, ask one or two concise clarifying questions.
- If the ambiguity is still too large to proceed safely, escalate to a human.

## Final Instruction to the Product Manager

The orchestrator should end the intake phase with this handoff:

“Please turn this intake package into a product brief, MVP definition, and prioritized user stories.”
