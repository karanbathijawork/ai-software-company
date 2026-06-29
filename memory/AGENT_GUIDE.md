# Memory Directory: Agent Guide

How to use the memory directory to do better work.

---

## Before Starting Work

### 1. Read Context
**File:** `context.md`

**Questions to answer:**
- What are we building?
- Why are we building it?
- What phase are we in?
- What's the deadline?
- Who's on the team?

**Time:** 2 minutes

### 2. Understand Current State
**File:** `current_state.md`

**Questions to answer:**
- What's already been built?
- What's in progress?
- What percentage are we complete?
- Are there blockers?

**Time:** 3 minutes

### 3. Understand Next Steps
**File:** `roadmap.md`

**Questions to answer:**
- When is the deadline?
- What do we need to deliver?
- What depends on this work?
- Are there timeline risks?

**Time:** 2 minutes

### 4. Check for Blockers
**File:** `known_issues.md`

**Questions to answer:**
- Are there critical bugs?
- Will my work be blocked by something?
- Should I prioritize fixing something first?

**Time:** 2 minutes

**Total time to get oriented:** ~10 minutes

---

## During Your Work

### Reference Architecture
**File:** `architecture.md`

When you need to understand:
- How components interact
- What technology is used
- What was changed recently
- System limitations

### Reference Decisions
**File:** `decisions.md`

When you need to understand:
- Why something was built a certain way
- What alternatives were considered
- Why those alternatives weren't chosen

### Check for Context
**Files:** `product.md`, `decisions.md`

When you need to:
- Understand product scope
- Know what's in MVP vs. Phase 2
- Understand constraints or requirements

---

## When You Find an Issue

### Bug Found?
→ Add to `known_issues.md` with:
- Severity (Critical/High/Medium/Low)
- Description
- Date found
- Impact

### Architecture Change Needed?
→ Update `architecture.md` and add to `decisions.md` why the change is needed

### Scope Change?
→ Update `product.md` with new scope

### Timeline Impact?
→ Update `roadmap.md` to reflect new dates

---

## At End of Session

### Update Current State
**File:** `current_state.md`

Update:
- What you completed
- What's in progress
- Test coverage
- Performance metrics
- Any blockers

### Create Session Summary
**File:** `sessions/YYYY-MM-DD.md`

Create a new file with:
- What you did
- Results (PRs, commits, bugs fixed, etc.)
- Blockers
- Decisions made
- Tomorrow's priorities

### Update Other Files as Needed

If your work impacted:
- **Product scope** → Update `product.md`
- **System design** → Update `architecture.md` and add ADR to `decisions.md`
- **Known bugs** → Update `known_issues.md`
- **Timeline** → Update `roadmap.md`
- **Project status** → Update `context.md`

---

## Memory File Interaction Map

```
START WORK
    ↓
Read: context.md (what are we building?)
    ↓
Read: current_state.md (what's done?)
    ↓
Read: roadmap.md (what's next?)
    ↓
Read: known_issues.md (what's broken?)
    ↓
START ACTUAL WORK
    ↓
    ├─→ Need architecture info? → architecture.md
    ├─→ Need to understand why? → decisions.md
    ├─→ Need scope/requirements? → product.md
    └─→ Find a bug? → known_issues.md
    ↓
DURING WORK
    ├─→ Change something architectural? → Update architecture.md + add ADR
    ├─→ Make a decision? → Add to decisions.md
    ├─→ Find a bug? → Add to known_issues.md
    └─→ Timeline impact? → Update roadmap.md
    ↓
END SESSION
    ├─→ Update current_state.md
    ├─→ Create sessions/YYYY-MM-DD.md
    └─→ Update any other files impacted
    ↓
DONE
```

---

## Guidelines for Agents

### Be Concise
- Summary, not detailed notes
- Bullet points, not paragraphs
- Clear, scannable format

### Be Current
- Update memory when you make changes
- Don't let it get stale
- Date your entries

### Be Specific
- Include what changed
- Include why it changed
- Include impact

### Keep Context in Mind
- Remember agents read this
- Be clear what you mean
- Don't assume prior knowledge
- Link to relevant documents

### Link When Possible
- [PR #123](link) for code changes
- [Commit abc](link) for specific changes
- File paths for documentation

---

## Example: Frontend Engineer Session

### Before Starting
```
1. Read context.md
   → "Building Habit Tracker, Phase 04, deadline June 30"

2. Read current_state.md
   → "Frontend 60% complete, blocked on API contracts from Backend"

3. Read roadmap.md
   → "Phase 04 ends June 30 (3 days), then QA Phase 05"

4. Read known_issues.md
   → "Critical: Habit creation crashes with 100+ habits"
```

### During Work
```
1. Check architecture.md
   → "Backend uses REST APIs, frontend uses React"

2. Check decisions.md
   → "Decided to use React (approved June 15)"

3. Work on: Fix habit creation bug
   → Add issue to known_issues.md: "Status: In Progress"

4. Work on: Build habit detail view
   → Reference product.md for requirements
```

### End of Session
```
1. Update current_state.md
   → "Frontend 70%, fixed critical bug, detail view 80% done"

2. Create sessions/2026-06-29.md
   → "Fixed 100+ habits bug (used virtual scrolling),
      started habit detail view, blocked on API for stats"

3. Update known_issues.md
   → "Critical bug: fixed ✅, mark as resolved"

4. Done
   → Next agent knows: Bug is fixed, detail view in progress, blocked on API
```

---

## Key Principles

✅ **Use memory to do better work** — It saves time and prevents mistakes

✅ **Keep it current** — Stale memory is worse than no memory

✅ **Be specific** — "Fixed bug X" not "fixed stuff"

✅ **Link to code** — Include PR/commit links

✅ **Reference, don't copy** — Point to files, don't duplicate info

✅ **Respect other agents' work** — Read memory before starting

---

## Questions?

- **"What has been decided?"** → Read `decisions.md`
- **"What's already done?"** → Read `current_state.md`
- **"What's the architecture?"** → Read `architecture.md`
- **"What are we building?"** → Read `context.md` + `product.md`
- **"What's broken?"** → Read `known_issues.md`
- **"What happened last session?"** → Read latest `sessions/*.md`
- **"What's the timeline?"** → Read `roadmap.md`

---

**Memory is your tool. Use it to do better work, coordinate with other agents, and keep the project on track.** 🚀
