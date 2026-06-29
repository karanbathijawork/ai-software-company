# Skill Demonstration: Product Manager → Product Brief

This example demonstrates the Product Manager agent producing a complete product brief from a minimal intake summary.

---

## Input (from AI Orchestrator)

```
Product idea: A simple AI-powered resume reviewer for job seekers
Target user: Recent graduates and career changers
Main problem: Job seekers don't know why their resume isn't getting callbacks
Expected outcome: The user gets specific, actionable feedback on their resume
MVP direction: Upload a resume, get a structured critique with improvement suggestions
```

---

## Product Manager Output

---

### Product Brief: AI Resume Reviewer

---

#### 1. Problem Statement

Most job seekers receive no feedback when their resume is rejected. They continue submitting the same resume, making the same mistakes, with no way to improve. Professional resume writers are expensive ($200–$500). Peer review is inconsistent. Job seekers need a fast, specific, actionable critique they can act on immediately.

---

#### 2. Target User

**Primary:** Recent graduates (22–27) sending their first professional resume. Technical ability is moderate. They are cost-sensitive and want fast results.

**Secondary:** Career changers (30–45) rewriting their resume for a new industry. They have more experience but struggle to frame it for a new role.

---

#### 3. Jobs to Be Done

- Functional: Get specific feedback on what is weak in the current resume
- Functional: Know what to change before submitting to the next application
- Emotional: Feel more confident that the resume represents them well
- Social: Not have to ask a mentor or friend for help

---

#### 4. MVP Scope

**Must have:**
- Upload a resume (PDF or DOCX)
- Receive structured feedback in under 60 seconds covering: summary, work experience, skills, formatting, and overall impression
- View feedback organized by section with specific suggestions
- No account required for the first review

**Should have:**
- Save feedback for future reference (requires account)
- Compare feedback across two versions of the same resume

**Won't have in MVP:**
- ATS optimization scoring
- Job-specific tailoring
- Cover letter review
- Real-time editing inside the app

---

#### 5. User Journey

1. User lands on the home page
2. User uploads their resume (drag and drop or file picker)
3. System shows a "reviewing" state while processing
4. User receives structured feedback organized by resume section
5. User reads the feedback and decides what to change

Total time from landing to feedback: under 2 minutes.

---

#### 6. Success Metrics

**Primary:** 60% of users who complete a review return within 14 days (indicating the feedback was valuable enough to act on)

**Secondary:** Average feedback generation time under 30 seconds

**Guardrail:** Feedback quality rating (thumbs up/down at end of review) stays above 75% positive

---

#### 7. Assumptions

- Users are willing to upload their resume without creating an account for the first review
- PDF parsing will be sufficient for 90%+ of uploaded resumes
- Claude will produce feedback that is specific and actionable without additional fine-tuning
- One review per session is sufficient for MVP (no comparison or versioning)

---

#### 8. Non-Goals

- This is not a resume builder — we do not edit the resume
- This is not an ATS scanner — we do not score against job descriptions
- This is not a coaching service — we do not offer human follow-up

---

#### 9. Risks

| Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|
| PDF parsing fails on complex layouts | Medium | High | Fallback to plain text extraction; warn user if parsing quality is low |
| AI feedback is too generic | Medium | High | Require specific examples and suggestions in the prompt; test against 20 real resumes before launch |
| Low return rate if first feedback is not valuable | Medium | High | Invest in prompt quality over feature breadth in MVP |

---

#### 10. Handoff Instructions

**To UX Designer:** Design the upload screen, reviewing state, and feedback results screen. The feedback screen is the most important surface — it must be easy to scan and act on.

**To Solution Architect:** Design a simple architecture: file upload endpoint → PDF parser → Claude API call → structured response → frontend display. Consider rate limiting to manage cost.

**To Technical Lead:** After architecture is approved, produce a task breakdown. Key engineering tasks include file upload handling, PDF text extraction, Claude API integration, and structured response parsing.
