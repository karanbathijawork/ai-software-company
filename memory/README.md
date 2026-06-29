# Memory Directory

Dynamic project state and decision tracking for evolving products.

Unlike `knowledge/` (which contains timeless best practices) and `agents/` (which define roles), the `memory/` directory tracks the **current, evolving state** of a specific project or initiative.

This allows agents to understand:
- What has been decided and why
- What's been implemented
- What's coming next
- What problems we're facing
- The high-level context

---

## Purpose

The memory directory serves as a **living record of project state** that agents can read to:
1. Understand decisions that have been made (and why)
2. See what's already been built
3. Know what's coming next
4. Learn about technical challenges
5. Get context for the current work

This is useful for:
- **Long-running projects** — Keep track of what's been done across multiple sessions
- **Multi-agent coordination** — Agents read memory to understand what others have done
- **Decision rationale** — Document why choices were made
- **Onboarding** — New team members (or agents) read memory to get up to speed
- **Project tracking** — See progress and current state at a glance

---

## Files

### Core Project Files

#### `context.md`
**Purpose:** High-level project summary for agents  
**Contains:**
- Project name and goal
- Current phase/status
- Key assumptions
- Constraints
- Team/stakeholders

**When to update:** At the start and after major changes

**Example:**
```markdown
# Context: Habit Tracker

## Project Goal
Build a habit tracker for busy professionals that syncs across devices.

## Current Phase
Implementation (Phase 04)

## Status
- Frontend: 60% complete
- Backend: 70% complete
- Infrastructure: Ready
- Schedule: On track for release June 30

## Team
- Frontend Engineer: [name]
- Backend Engineer: [name]
- QA: [name]

## Key Decisions
- Use React for frontend (decided in Phase 02)
- PostgreSQL for database (decided in Phase 02)
- Deploy to AWS (decided in Phase 04)
```

---

#### `architecture.md`
**Purpose:** Current architecture overview  
**Contains:**
- System diagram (text or reference)
- Major components
- Data flow
- External dependencies
- Recent changes

**When to update:** When architecture changes (new component, refactored section, etc.)

**Example:**
```markdown
# Architecture: Habit Tracker

## Components
- Frontend: React SPA (deployed on CloudFront)
- Backend: Node.js/Express APIs (EC2)
- Database: PostgreSQL (RDS)
- Auth: AWS Cognito
- Sync: WebSocket for real-time updates

## Data Flow
User → Frontend → Backend APIs → PostgreSQL
       ↓
       Sync service (WebSocket) → Database

## Recent Changes
- Switched from REST to WebSocket for real-time sync (June 25)
- Added caching layer (Redis) for performance (June 28)
```

---

#### `decisions.md`
**Purpose:** Design decisions and rationale (ADR-style)  
**Contains:**
- Major decisions made
- Rationale for each
- Alternatives considered
- Decision date

**Format:** ADR (Architecture Decision Record) style

**Example:**
```markdown
# Architecture Decision Records

## ADR-001: Use React for Frontend

**Status:** Approved (June 15)

**Decision:** Use React for the frontend

**Rationale:**
- Team has React expertise
- Component-based architecture aligns with design specs
- Large ecosystem of packages

**Alternatives Considered:**
- Vue.js (simpler, but less team expertise)
- Angular (too heavyweight for this project)

**Consequences:**
- Must maintain Node ecosystem dependencies
- Build tooling setup required

---

## ADR-002: PostgreSQL for Primary Database

**Status:** Approved (June 15)

**Decision:** Use PostgreSQL for primary data storage

**Rationale:**
- ACID compliance needed for habit tracking
- Team has PostgreSQL experience
- Handles relational data well (habits, users, dates)

**Alternatives Considered:**
- MongoDB (more flexible, but overkill for this data model)
- DynamoDB (would require AWS expertise)

**Consequences:**
- Need to manage schema migrations
- Requires database backups and recovery planning
```

---

#### `product.md`
**Purpose:** Current product vision and requirements  
**Contains:**
- MVP definition (what IS in scope)
- Out of scope (what ISN'T)
- User stories completed
- User stories in progress
- User stories planned for Phase 2
- Success metrics

**When to update:** When scope changes or milestones are hit

**Example:**
```markdown
# Product: Habit Tracker

## MVP (Phase 07 - Release)

### Completed ✅
- User authentication
- Create/edit/delete habits
- Daily habit tracking
- Sync across devices
- Basic analytics (streak counter)

### In Progress ⏳
- Mobile app
- Push notifications
- Habit templates

### Phase 2 (Future)
- Social features (friend challenges)
- Advanced analytics
- AI habit recommendations
- Wearable integration

## Out of Scope (MVP)
- Gamification (badges, points)
- Social sharing
- AI recommendations
- Wearable sync

## User Stories (MVP)
- [ ] As a user, I can create a new habit
- [ ] As a user, I can mark a habit complete for today
- [ ] As a user, I can see my streak
- [ ] As a user, my data syncs across devices
- [ ] As a user, I can see weekly/monthly views
```

---

#### `roadmap.md`
**Purpose:** Upcoming milestones and plans  
**Contains:**
- Next phases/milestones
- Dates/timelines
- What each phase delivers
- Dependencies
- Known blockers

**When to update:** As phases complete or timelines change

**Example:**
```markdown
# Roadmap: Habit Tracker

## Phase 04: Implementation (NOW)
**Target:** June 30 (5 days)
- Frontend: 60% → 100%
- Backend: 70% → 100%
- Deploy to staging
- Final testing

## Phase 05: QA (July 1-2)
**Target:** 2 days
- Full testing
- Bug fixes
- QA sign-off

## Phase 06: Documentation (July 3)
**Target:** 1 day
- User guide
- API documentation
- Deployment runbook

## Phase 07: Release (July 4)
**Target:** 1 day
- Deploy to production
- Monitor metrics
- Announce

## Phase 08: Cleanup (July 5)
**Target:** 1 day
- Remove template artifacts
- Clean codebase

## Blocked/At Risk
- Mobile app (pending review of requirements)
- Push notifications (needs decision on service)
```

---

#### `current_state.md`
**Purpose:** What has been implemented so far  
**Contains:**
- Features completed
- Features in progress
- Test coverage
- Performance metrics
- Known issues found during development

**When to update:** Daily or as features are completed

**Example:**
```markdown
# Current State: Habit Tracker

## Implementation Progress

### Frontend (60% complete)
- ✅ Authentication screens
- ✅ Habit list view
- ✅ Habit creation form
- ⏳ Habit detail view (70% done)
- ⏳ Analytics dashboard (40% done)
- ❌ Mobile responsive (not started)

### Backend (70% complete)
- ✅ User APIs
- ✅ Habit CRUD APIs
- ✅ Habit tracking APIs
- ✅ Sync WebSocket
- ⏳ Analytics endpoints (80% done)
- ❌ Push notification service (not started)

### Infrastructure
- ✅ AWS account set up
- ✅ VPC and networking configured
- ✅ RDS PostgreSQL deployed
- ✅ EC2 instances for backend
- ✅ S3 for static assets
- ✅ CloudFront CDN

### Testing
- Frontend: 40% unit test coverage
- Backend: 65% unit test coverage
- Integration tests: In progress
- E2E tests: Planned for Phase 05

### Performance
- Frontend load time: 1.2s (target: <1s)
- API response time: 150ms avg (target: <200ms)
- Database query time: 50ms avg (target: <100ms)
```

---

#### `known_issues.md`
**Purpose:** Technical debt and open bugs  
**Contains:**
- Bugs found (by priority)
- Technical debt items
- Performance issues
- Security concerns
- Known limitations

**When to update:** As issues are discovered or resolved

**Example:**
```markdown
# Known Issues: Habit Tracker

## Critical 🔴
- Frontend crashes on habit creation with 100+ habits (found: June 27, blocked: Phase 05)
- Missing user validation on backend API (found: June 28, fix: in progress)

## High 🟠
- Sync delay when 50+ users online (performance issue)
- Missing error handling for network failures on mobile
- Database connection pooling not configured

## Medium 🟡
- Habit list doesn't paginate (loads all at once - OK for MVP, fix in Phase 2)
- No rate limiting on API endpoints
- Email confirmation not working in staging

## Low 🔵
- UI could be more responsive at 1366px breakpoint
- Toast notifications sometimes cut off at bottom
- Unused imports in 3 files

## Technical Debt
- Need to refactor habit controller (too large)
- Tests need better organization
- Documentation is sparse
- Need to set up monitoring/alerting
```

---

#### `sessions/`
**Purpose:** Session summaries for long-running work  
**Contents:** One file per session (dated)

**When to create:** At start or end of major work sessions

**Example:** `sessions/2026-06-29.md`
```markdown
# Session: 2026-06-29

**Date:** June 29, 2026  
**Duration:** 4 hours  
**Participants:** Frontend Engineer, Backend Engineer  
**Focus:** Phase 04 Implementation

## What We Did
1. Fixed critical bug in habit creation (was crashing with 100+ habits)
   - Root cause: Missing pagination on frontend
   - Solution: Implemented virtual scrolling
   - Time: 1 hour

2. Completed authentication flow
   - Login/logout/signup working
   - Token refresh implemented
   - Password reset UI pending
   - Time: 1.5 hours

3. Started habit detail view
   - 70% complete
   - Needs: Stats calculations, edit form
   - Time: 1.5 hours

## Blockers
- None currently

## Next Session Priorities
1. Finish habit detail view
2. Implement analytics dashboard
3. Fix database connection pooling issue
4. Write integration tests for auth flow

## Decisions Made
- Decided to use virtual scrolling for habit lists (better performance)
- Decided to defer mobile app to Phase 2 (timeline concern)

## Notes
- Team is working well, on track for June 30 deadline
- Need to add monitoring/alerting before Phase 07
```

---

## How Agents Use Memory

### When Starting a Session

Agents should read:
1. `context.md` — Understand the project
2. `current_state.md` — See what's been done
3. `roadmap.md` — Understand what's next
4. Latest `sessions/*.md` — See what happened last session

### During Work

Agents should:
- Check `known_issues.md` for blockers
- Reference `decisions.md` to understand why things were done
- Check `architecture.md` to understand system design
- Read `product.md` to understand scope

### After Completing Work

Agents should:
- Update `current_state.md` with progress
- Add any new issues to `known_issues.md`
- Create a session summary in `sessions/`
- Update `decisions.md` if new decisions were made
- Update `architecture.md` if system changed

---

## File Structure

```
memory/
├── README.md (this file)
├── context.md
├── architecture.md
├── decisions.md
├── product.md
├── roadmap.md
├── current_state.md
├── known_issues.md
└── sessions/
    ├── 2026-06-29.md (first session)
    ├── 2026-06-30.md
    └── ... (one per session/day)
```

---

## Best Practices

### Keeping Memory Current
- Update `current_state.md` daily (or per session)
- Update `known_issues.md` as bugs are found
- Update `decisions.md` when decisions are made
- Create `sessions/*.md` at end of work sessions

### For Agents
- Read memory before starting work
- Reference memory when making decisions
- Update memory when work is complete
- Don't just append — synthesize and update key files

### Avoiding Staleness
- Set a reminder to review memory weekly
- Archive old `sessions/` files (older than 1 month)
- Update `roadmap.md` as dates change
- Mark decisions with dates (so you know if they're old)

---

## Distinction from Other Directories

| Directory | Purpose | Updates |
|-----------|---------|---------|
| `agents/` | Define agent roles | Rarely (new agent type) |
| `knowledge/` | Timeless best practices | Occasionally (new patterns) |
| `skills/` | Reference guides | Occasionally (new tool) |
| `memory/` | **Current project state** | **Frequently (daily/session)** |

---

## Example: How This Works in Practice

### Day 1: Project Starts
```
context.md: "Building Habit Tracker, Phase 00-01"
current_state.md: "No implementation yet"
roadmap.md: "Phase 04 starts June 20"
sessions/2026-06-20.md: "Orchestration + PRD complete"
```

### Day 5: Mid-Implementation
```
current_state.md: "Frontend 40%, Backend 50%"
known_issues.md: "Bug with habit creation, performance issue on sync"
decisions.md: "Decided to use WebSocket for real-time"
sessions/2026-06-25.md: "Switched to WebSocket, fixed 3 bugs"
```

### Day 10: Near Release
```
current_state.md: "Frontend 95%, Backend 90%, Infrastructure ready"
known_issues.md: "3 critical bugs, 5 high priority"
roadmap.md: "Phase 05 QA starts tomorrow, Phase 07 release June 30"
sessions/2026-06-29.md: "Fixed critical bug, auth flow complete, blockers resolved"
```

---

## This is Living Documentation

The memory directory is **not** a burden — it's a tool for agents to do better work.

Every entry serves a purpose:
- ✅ `context.md` — Saves time (agents don't ask "what's the goal?")
- ✅ `decisions.md` — Prevents rework (agents understand why)
- ✅ `current_state.md` — Prevents duplication (agents know what's done)
- ✅ `known_issues.md` — Prevents bugs (agents see what's broken)
- ✅ `roadmap.md` — Prevents surprises (agents know what's next)
- ✅ `sessions/` — Provides continuity (agents see progress)

Keep it **concise**, **current**, and **useful**.
