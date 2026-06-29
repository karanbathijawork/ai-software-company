# workflows/

**Purpose:** Multi-agent workflow definitions that orchestrate how agents collaborate, hand off work, and sequence activities across the software development lifecycle. Defines process flows and agent interactions.

**What Belongs Here:**
- Project lifecycle workflows (Inception → Launch → Support)
- Feature development workflows (Design → Implementation → Testing → Review)
- Incident management and response workflows
- Cross-functional handoff patterns and approval chains

**What Does NOT Belong Here:**
- Individual agent definitions (see agents/)
- Knowledge or best practices (see knowledge/)
- Checklists or verification steps (see checklists/)
- Workflow execution examples (see examples/)
- Implementation code or scripts

**Structure:**
```
workflows/
├── project_lifecycle/     End-to-end project phases
├── feature_development/   Feature design, build, test, review
├── incident_management/   Detection, investigation, resolution
└── cross_functional/      Multi-team handoffs and approvals
```
