# skills/

**Purpose:** Reusable skill definitions that agents invoke to accomplish specific tasks across programming languages, cloud platforms, DevOps tools, and AI capabilities. Horizontal knowledge layer, not role-specific.

**What Belongs Here:**
- Language-specific skill definitions (Python, TypeScript, Go, Java, etc.)
- Cloud platform expertise (AWS, Azure, GCP, etc.)
- DevOps tooling and infrastructure patterns (Docker, Kubernetes, Terraform, etc.)
- AI/LLM-specific capabilities (prompt engineering, reasoning, etc.)

**What Does NOT Belong Here:**
- Agent definitions (see agents/)
- Integration implementations (see mcp/)
- Project-specific tooling
- Generic knowledge or case studies (see knowledge/)
- Workflow definitions (see workflows/)

**Structure:**
```
skills/
├── programming_languages/  Language-specific expertise
├── cloud_platforms/        Cloud provider knowledge
├── devops_tools/           Infrastructure and deployment tools
└── ai_capabilities/        LLM reasoning, prompting, fine-tuning
```
