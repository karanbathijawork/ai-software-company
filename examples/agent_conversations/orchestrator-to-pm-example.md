# Example: Orchestrator → Product Manager Handoff

This example shows a complete intake conversation and handoff from the AI Orchestrator to the Product Manager.

---

## User Input

```
Build a simple job application tracker for recent graduates.
```

---

## AI Orchestrator Output

### Intake Checklist Review

- Target user: clear (recent graduates)
- Core problem: implied (losing track of job applications)
- MVP direction: derivable (track applications, status, notes)
- No clarification needed — proceeding.

---

### Intake Summary

**Product idea:** Job application tracker for recent graduates

**Target user:** Recent graduates actively applying for jobs, typically tracking 10–50 applications simultaneously across multiple companies

**Main problem:** Job seekers lose track of where they applied, what stage each application is at, and what follow-up actions are needed

**Expected outcome:** The user can see all their applications in one place, update status as things progress, and know what to do next

**MVP direction:** A simple web app where a user can add a job application with company, role, status, and notes — then update it as the process moves forward

---

### Clarification Log

No clarification was requested. The user's input was specific enough to define a target user and a core problem. Default assumptions were made for all unspecified details.

---

### Assumptions Log

- Platform: web app (not mobile-first)
- Authentication: single-user, simple email/password login
- Status options: Applied, Phone Screen, Interview, Offer, Rejected, Withdrawn
- Collaboration: single-user only in MVP; no team or shared tracking
- Data storage: persistent (not session-only)
- Deadline reminders: deferred to post-MVP

---

### MVP Hypothesis

**Proposed MVP:** A web app where a logged-in user can add job applications with a company name, job title, application date, current status, and notes. The user can update status as the process progresses and view a list sorted by most recent activity.

**Why this is the right first version:** It covers the entire core user problem (tracking) with no extraneous features. It gives the user immediate value after five minutes of use.

**What it should prove:** That users will enter and update their applications consistently over a job search period — the core retention behaviour.

**Success metric:** User updates at least one application status within 7 days of creating their account.

---

### Handoff Brief

**To:** Product Manager

**From:** AI Orchestrator

**Instruction:** Please turn this intake package into a product brief, MVP definition, and prioritized user stories using the PRD template at `templates/product_documents/prd-template.md`.

**Context to use:** The intake summary, assumptions log, and MVP hypothesis above are your source of truth. Do not ask the user for additional information — make reasonable assumptions for anything not covered above and label them explicitly.

**Recommended next step:** Produce the PRD, then hand off to the UX Designer and Solution Architect in parallel.

---

## Product Manager Response

### Product Brief: Job Application Tracker

**Problem:** Recent graduates applying for multiple roles simultaneously have no simple way to track where they applied, what stage each application is at, and what their next action is. Spreadsheets are cumbersome and general-purpose task apps lack the right structure.

**Target user:** Recent graduates (22–27 years old), actively job searching, applying to 10–50 roles over 1–6 months.

**Desired outcome:** The user always knows the current status of every application and what they should do next.

---

### MVP Scope

**Must have:**
- Create an account and log in
- Add a job application (company, role title, date applied, status, notes)
- Update an application's status
- View all applications sorted by most recent activity
- Delete an application

**Should have:**
- Filter applications by status
- Mark an application with a next action and due date

**Won't have in MVP:**
- Email reminders
- Calendar integration
- Resume tracking
- Multi-user or sharing
- Analytics or charts

---

### User Stories

1. As a job seeker, I want to create an account so that my applications are saved and private to me.
2. As a job seeker, I want to add a job application so that I have a record of every role I applied to.
3. As a job seeker, I want to update an application's status so that my tracker reflects where things stand.
4. As a job seeker, I want to add notes to an application so that I can remember details like interviewer names and key talking points.
5. As a job seeker, I want to view all my applications in one list so that I can see everything at a glance.
6. As a job seeker, I want to delete an application so that I can remove roles I am no longer pursuing.

---

### Success Metric

The user updates at least one application status within 7 days of first login.

---

### Handoff Instruction

**To UX Designer:** Produce wireframes for the application list, application detail, and add/edit form screens.

**To Solution Architect:** Produce an architecture document for a simple full-stack web app using the default MVP stack (React + Vite, Node.js, Supabase).
