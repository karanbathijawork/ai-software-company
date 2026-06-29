# agents/

**Purpose:** Central repository for AI agent definitions—system prompts that define the role, mission, responsibilities, and operational guidelines for each persona in the framework.

**What Belongs Here:**
- Agent definition files (.md) organized by functional category
- Agent system prompts using the canonical 9-section template (from product_manager.md)
- Role-based personas for the full software development lifecycle

**What Does NOT Belong Here:**
- Implementation code or executable logic
- Example conversations or workflow instances (see examples/)
- Generic knowledge or best practices (see knowledge/)
- Agent-specific checklists (see checklists/)

**Structure:**
```
agents/
├── core/              Agent definitions for leadership roles
├── engineering/       Agent definitions for technical disciplines
├── quality_assurance/ Agent definitions for QA and security roles
└── operations/        Agent definitions for project and automation roles
```

Each agent file follows the template:
1. Role
2. Mission
3. Responsibilities
4. Philosophy/Principles
5. Process/Stages
6. Required Deliverables
7. Behaviour Rules
8. Quality Checklist
9. Output Standard
