# Memory Directory: Complete Summary

New dynamic project state tracking system alongside agents, knowledge, skills, and templates.

---

## 📁 What Was Created

### New Directory: `memory/`

**Purpose:** Track evolving project state, decisions, and progress

**Why:** Agents need to understand the current state of a project to do better work

---

## 📄 Files Created

### Core Documentation (8 files)

1. **`README.md`** — Complete guide to the memory directory
   - Purpose of each file
   - How agents use memory
   - Best practices
   - Examples

2. **`AGENT_GUIDE.md`** — How agents should use memory
   - What to read before starting work
   - How to update memory during work
   - When to create session summaries
   - Memory interaction map

3. **`context.md`** — High-level project summary
   - Project goal and status
   - Current phase and deadline
   - Team members
   - Key assumptions
   - Success criteria

4. **`architecture.md`** — Current system architecture
   - Components and technology stack
   - Data flow diagrams
   - External dependencies
   - Recent changes
   - Technical debt

5. **`decisions.md`** — Design decisions (ADR-style)
   - Major decisions made
   - Rationale for each
   - Alternatives considered
   - Consequences of decisions

6. **`product.md`** — Product vision and requirements
   - MVP features completed/in-progress
   - Phase 2 features (deferred)
   - Out of scope items
   - User stories
   - Success metrics

7. **`roadmap.md`** — Timeline and milestones
   - Phase schedule
   - Deliverables per phase
   - Dependencies
   - Blocked/at-risk items
   - External dependencies

8. **`current_state.md`** — Implementation progress
   - What's done, in-progress, not started
   - Test coverage
   - Performance metrics
   - Last 24-hour summary

9. **`known_issues.md`** — Bugs and technical debt
   - Issues by priority (Critical/High/Medium/Low)
   - Technical debt
   - Performance issues
   - Security concerns

### Templates (8 templates for starting new projects)

- `TEMPLATE_context.md`
- `TEMPLATE_architecture.md`
- `TEMPLATE_decisions.md`
- `TEMPLATE_product.md`
- `TEMPLATE_roadmap.md`
- `TEMPLATE_current_state.md`
- `TEMPLATE_known_issues.md`
- `sessions/TEMPLATE_session.md`

### Sessions Directory

`sessions/` — One file per work session

- `sessions/2026-06-29.md` (example)
- `sessions/TEMPLATE_session.md` (template)

---

## 🎯 Purpose & Value

### Why Memory Directory?

| Directory | Purpose | Updates |
|-----------|---------|---------|
| `agents/` | Define agent roles | Rarely (new agent type) |
| `knowledge/` | Timeless best practices | Occasionally |
| `skills/` | Reference guides | Occasionally |
| `templates/` | Reusable templates | Occasionally |
| **`memory/`** | **Current project state** | **Frequently (daily)** |

### What Agents Can Do With Memory

✅ **Understand the project** — Read `context.md` in 2 minutes  
✅ **Know what's done** — Read `current_state.md` for implementation status  
✅ **Avoid duplicating work** — See what's already been completed  
✅ **Understand decisions** — Read `decisions.md` to understand why things were built a certain way  
✅ **Identify blockers** — Check `known_issues.md` for problems  
✅ **Know the timeline** — Read `roadmap.md` to understand deadlines  
✅ **Contribute effectively** — Use memory to coordinate with other agents  

---

## 📋 How It Works

### Before Starting Work (10 min)

Agent reads:
1. `context.md` — "What are we building?"
2. `current_state.md` — "What's already done?"
3. `roadmap.md` — "What's the deadline?"
4. `known_issues.md` — "What's broken?"

### During Work

Agent:
- References `architecture.md` for system design
- References `decisions.md` for design rationale
- References `product.md` for requirements
- Logs discoveries in `known_issues.md`

### After Work Session

Agent:
1. Updates `current_state.md` with progress
2. Creates `sessions/YYYY-MM-DD.md` with summary
3. Updates other files as needed:
   - `known_issues.md` (for bugs found/fixed)
   - `architecture.md` (for design changes)
   - `decisions.md` (for decisions made)
   - `roadmap.md` (for timeline updates)
   - `product.md` (for scope changes)
   - `context.md` (for status changes)

---

## 🔄 Integration with Orchestration

Memory works alongside the orchestration system:

```
Orchestration (one-time):
Phase 00 → Phase 01 → Phase 02 → ... → Phase 08
(Static workflow, follows plan)

Memory (continuous):
During each phase, agents read/write memory
to understand state and coordinate work
(Dynamic, evolving record)
```

**Example:** During Phase 04 (Implementation)

```
Day 1: Frontend Engineer
├─ Reads: context.md, current_state.md, roadmap.md
├─ Works on: Habit list component
└─ Writes: Updates current_state.md, creates session summary

Day 2: Backend Engineer
├─ Reads: context.md (updated), current_state.md
├─ Checks: architecture.md for API design
├─ Works on: User APIs
├─ Finds: Bug in authentication
└─ Writes: Adds to known_issues.md, updates current_state.md

Day 3: DevOps Engineer
├─ Reads: architecture.md (updated if changed)
├─ Checks: roadmap.md for timeline
├─ Works on: Infrastructure setup
└─ Writes: Updates current_state.md, notes in session summary
```

---

## 📂 Full Directory Structure

```
memory/
├── README.md (complete guide)
├── AGENT_GUIDE.md (how to use memory)
├── context.md (project overview)
├── architecture.md (system design)
├── decisions.md (ADRs)
├── product.md (vision & requirements)
├── roadmap.md (timeline)
├── current_state.md (progress)
├── known_issues.md (bugs & debt)
├── TEMPLATE_context.md
├── TEMPLATE_architecture.md
├── TEMPLATE_decisions.md
├── TEMPLATE_product.md
├── TEMPLATE_roadmap.md
├── TEMPLATE_current_state.md
├── TEMPLATE_known_issues.md
└── sessions/
    ├── TEMPLATE_session.md
    └── [dated session files]
```

---

## ✅ Key Features

### 1. Living Documentation
- Not static (changes as project evolves)
- Current (updated frequently)
- Relevant (agents read and use it)

### 2. Structured & Consistent
- Template files for starting projects
- Consistent format across files
- Clear purposes for each file

### 3. Agent-Friendly
- Short, scannable format
- Designed for agents to read
- Indexed and linked

### 4. Decision Tracking
- ADR-style decision records
- Why decisions were made
- Alternatives considered
- Consequences documented

### 5. Progress Tracking
- Current state is always visible
- Issues are prioritized
- Blockers are flagged
- Timeline is clear

---

## 🚀 How to Use This

### Starting a New Project

1. Copy templates to your project directory:
   ```
   cp memory/TEMPLATE_*.md [your-project]/memory/
   cp -r memory/sessions [your-project]/memory/
   ```

2. Fill in the files:
   - `context.md` — Project overview
   - `architecture.md` — System design
   - `decisions.md` — Design decisions made
   - `product.md` — MVP scope
   - `roadmap.md` — Timeline
   - `current_state.md` — Initial status (probably "planning")
   - `known_issues.md` — Known limitations (probably empty)

3. During work:
   - Agents read memory before starting
   - Agents update memory as they work
   - Agents create session summaries

### Keeping Memory Fresh

✅ Update `current_state.md` daily  
✅ Create `sessions/*.md` files after work  
✅ Update `known_issues.md` as bugs are found  
✅ Update `decisions.md` when decisions are made  
✅ Update `architecture.md` if system changes  
✅ Keep everything concise and current  

---

## 💡 Example: Habit Tracker Project

### Day 1: Phase 04 Starts

```
context.md:
- Goal: Habit tracker for busy professionals
- Phase: 04 Implementation
- Deadline: June 30 (3 days)
- Team: Frontend, Backend, DevOps engineers

current_state.md:
- Frontend: 0% (starting Phase 04)
- Backend: 0% (starting Phase 04)
- Infrastructure: 0% (starting Phase 04)
```

### Day 5: Mid-Implementation

```
current_state.md:
- Frontend: 60% (list view done, detail view in progress)
- Backend: 70% (APIs working, auth in progress)
- Infrastructure: Ready

known_issues.md:
- Critical: Authentication bug found
- High: Performance issue with 100+ habits
- Medium: Missing error handling on mobile
```

### Day 10: Release Candidate

```
current_state.md:
- Frontend: 95% (ready for QA)
- Backend: 95% (ready for QA)
- Infrastructure: Ready
- Test coverage: 70%

known_issues.md:
- Critical: Fixed ✅
- High: Pending fix ⏳
- Medium: Will defer to Phase 2

sessions/2026-06-29.md:
- What was done: Fixed critical bug, completed auth flow
- What's next: Finish detail view, QA testing, release
- Blockers: None
```

---

## 🔗 Relationship to Other Parts of System

```
README.md → Points to docs/getting-started/ and memory/
   ↓
docs/getting-started/
   ├─ Guides new users on how to build products
   └─ References memory/ for tracking state during builds
   
agents/
   └─ Use memory/ to understand project state
   
templates/
   └─ Could reference memory/ files for documentation
   
_delivery/<project>/
   └─ Contains project-specific memory files
   
memory/
   └─ Global templates and guides for creating project memory
```

---

## ✨ Summary

**Memory is a living, evolving record of project state.**

It answers questions agents have:
- "What are we building?" → `context.md`
- "What's already done?" → `current_state.md`
- "What's broken?" → `known_issues.md`
- "Why was this built this way?" → `decisions.md`
- "What's the deadline?" → `roadmap.md`
- "What are the requirements?" → `product.md`
- "What does the system look like?" → `architecture.md`

It's **not** a burden — it's a tool that helps agents do better work.

---

## 📊 What Was Added

- ✅ `memory/` directory with complete guides
- ✅ 9 core documentation files
- ✅ 8 template files for new projects
- ✅ `AGENT_GUIDE.md` for how agents use memory
- ✅ `sessions/` directory for work summaries
- ✅ Updated `README.md` to reference memory
- ✅ Full integration with orchestration system

---

## 🎯 Status

**✅ Memory directory is complete and ready to use.**

It's an optional but powerful capability alongside:
- `agents/` (define roles)
- `knowledge/` (best practices)
- `skills/` (reference guides)
- `templates/` (reusable formats)

Ready to integrate into your product builds! 🚀
