# Automated Improvements Discovery Guide

How to automatically find improvements you've made to the orchestration system and share them back to the template repo.

---

## Overview

When you build a product, you might improve the orchestration system:
- Better agent prompts
- Improved templates
- New workflows
- Better documentation
- Optimized processes

These improvements should flow back to the template so **all future products benefit**.

This guide automates that process.

---

## Quick Start

### Option 1: Windows (PowerShell)

```powershell
cd your-product-repo
.\scripts\discover-improvements.ps1
```

Output:
- `improvements.md` — Report of what changed
- Recommendations for next steps

### Option 2: macOS/Linux (Bash)

```bash
cd your-product-repo
./scripts/discover-improvements.sh
```

Same output as PowerShell version.

---

## What the Script Does

1. **Clones the template repo** (temporarily, in `/tmp` or `%TEMP%`)
2. **Compares your product repo** against the template baseline
3. **Finds all changes** to orchestration directories:
   - `agents/` — Agent definitions
   - `templates/` — Reusable templates
   - `workflows/` — Multi-agent processes
   - `knowledge/`, `skills/`, `ai/`, `memory/` — Reference material
   - `docs/getting-started/` — User guides
   - Root files like `START_BUILD.md`, `ORCHESTRATION_SETUP_GUIDE.md`

4. **Filters out product code** (only reports orchestration changes)
5. **Generates a report** (`improvements.md`) with:
   - What changed
   - How many lines added/removed
   - Diffs showing the improvements

---

## Usage

### Basic Usage (No Options)

```powershell
./discover-improvements.ps1
```

Compares `HEAD` against `origin/main` and generates `improvements.md`.

### With Options

```powershell
./discover-improvements.ps1 -OutputFile my-improvements.md -GeneratePatch
```

**Options:**

| Option | Default | Purpose |
|--------|---------|---------|
| `-OutputFile` | `improvements.md` | Where to save the report |
| `-GeneratePatch` | `false` | Also generate a `.patch` file |
| `-CompareBranch` | `origin/main` | Which template branch to compare against |
| `-TemplateRepo` | `https://github.com/karanbathijawork/ai-software-company.git` | Template repo URL (if you forked it) |

### Examples

```powershell
# Basic discovery
./discover-improvements.ps1

# Generate patch file too
./discover-improvements.ps1 -GeneratePatch

# Save to custom filename
./discover-improvements.ps1 -OutputFile habit-tracker-improvements.md

# Compare against a different branch
./discover-improvements.ps1 -CompareBranch origin/v2.0
```

---

## Understanding the Report

The script generates `improvements.md` with:

```markdown
# Improvements from habit-tracker

**Date:** 2026-06-29
**Product:** habit-tracker
**Template Branch:** origin/main
**Status:** Ready for review

## Summary
Found 3 improvements to orchestration system.

## Improvements

### agents/core/product_manager.md
**Lines changed:** +45 / -12

[Diff showing what changed]

### templates/project_management/master-orchestration-workflow.md
**Lines changed:** +80 / -30

[Diff showing what changed]

### docs/getting-started/README.md
**Lines changed:** +20 / -5

[Diff showing what changed]
```

---

## Sharing Improvements Back

### Step 1: Review the Report

```powershell
Get-Content improvements.md
```

Make sure the changes are:
- ✓ Actually improvements (not accidental tweaks)
- ✓ Tested in your product build
- ✓ Benefit all future products
- ✓ Don't include product-specific code

### Step 2: Create Improvements Branch

```bash
git checkout -b improvements/from-habit-tracker
```

This keeps improvements separate from product code.

### Step 3: Commit the Improvements

```bash
git add agents/ templates/ workflows/ docs/getting-started/ ...
git commit -m "Improvements: Better Product Manager agent with user persona extraction

- Extracted user persona section to PRD
- Added persona template to product_manager.md
- Tested in Habit Tracker product build
- See improvements.md for details"
```

### Step 4: Create PR on Template Repo

1. Go to: https://github.com/karanbathijawork/ai-software-company/pulls
2. Click "New Pull Request"
3. Set:
   - **Base:** `main` (in template repo)
   - **Compare:** `improvements/from-habit-tracker` (in your product repo)

4. Add description:

```markdown
## Improvements from Habit Tracker Product Build

This PR contains improvements made during the Habit Tracker product build.

### What Changed
- Better Product Manager agent (extracts user personas)
- Improved orchestration workflow
- Clearer user guides

### Why
These changes improve the system for all future product builds.

### Testing
- Tested in Habit Tracker build ✓
- Don't include product-specific code ✓
- Ready for review ✓

See `improvements.md` for detailed changes.
```

5. Click "Create Pull Request"

### Step 5: Wait for Review & Merge

Template repo maintainer will:
- Review your improvements
- Test them
- Merge to `main` if approved

Then all future product builds automatically use your improvements! 🎉

---

## Advanced: Generating Patches

If you prefer to share patches instead of PRs:

```powershell
./discover-improvements.ps1 -GeneratePatch
```

This generates:
- `improvements.md` — Report
- `improvements.patch` — Git patch file

You can then:

1. **Email the patch:**
   ```
   Send improvements.patch to template maintainer
   ```

2. **Or apply locally:**
   ```bash
   cd /path/to/template-repo
   git apply /path/to/improvements.patch
   ```

---

## Troubleshooting

### "No improvements found"

Means no changes to orchestration system detected. This is OK if:
- You only modified product code (apps, services, etc.)
- You didn't improve any agents, templates, or workflows

### "Unknown option"

Make sure you're using correct syntax:

```powershell
# Correct:
./discover-improvements.ps1 -OutputFile my-file.md

# Wrong (missing dash):
./discover-improvements.ps1 OutputFile my-file.md
```

### "Not a git repository"

Run from your product repo root:

```bash
cd your-product-repo
# Should have .git/ directory
ls -la .git/
./discover-improvements.ps1
```

### "Template clone failed"

Check internet connection and template URL:

```powershell
# Test with custom URL:
./discover-improvements.ps1 -TemplateRepo https://github.com/YOUR-USERNAME/ai-software-company.git
```

---

## Automation: Make It Part of Your Workflow

### Option 1: Run After Each Phase

```powershell
# After Phase 04 (Implementation completes)
./discover-improvements.ps1 -OutputFile improvements-phase04.md

# Review improvements at end of build
```

### Option 2: Git Hook

Create `.git/hooks/post-merge`:

```bash
#!/bin/bash
# Auto-discover improvements after pulling template updates
./scripts/discover-improvements.ps1
```

### Option 3: CI/CD Integration

In your GitHub Actions:

```yaml
- name: Discover Improvements
  run: ./scripts/discover-improvements.ps1
  
- name: Upload Improvement Report
  uses: actions/upload-artifact@v3
  with:
    name: improvements
    path: improvements.md
```

---

## Best Practices

✅ **Run regularly** — After major work, especially after phases 02-04

✅ **Review before sharing** — Make sure improvements are real, not accidents

✅ **Document why** — In commit message, explain why this improves the system

✅ **Test improvements** — Build another small product to verify improvements work

✅ **Keep separate** — Use `improvements/` branch to keep orchestration changes isolated

✅ **Link back** — In PR, reference the product that discovered the improvement

✅ **Track improvements** — Update `IMPROVEMENTS_LOG.md` in template repo

---

## Examples of Good Improvements

### ✓ Better Agent Prompt

```
agents/core/product_manager.md:
- Added instruction to extract user personas
- Clarified MVP vs Phase 2 distinction
- Added example of good PRD structure
```

**Why:** Helps all future PM agents produce better PRDs

### ✓ Improved Template

```
templates/product_documents/repeatable-one-input-prompt.md:
- Simplified one-input format
- Added more context about phases
- Removed confusing sections
```

**Why:** Makes it easier for everyone to trigger builds

### ✓ New Workflow

```
workflows/feature_development/parallel-build.md:
- New workflow for building features in parallel
- Speeds up Phase 04 by 30%
```

**Why:** All products benefit from faster builds

### ✗ Product Code (Don't Share)

```
src/components/HabitList.tsx:
- Added virtual scrolling for performance
```

**Why:** This is product-specific, not orchestration system improvement

---

## Questions?

- **"How do I know if something is an improvement?"** — If it makes the orchestration system better for all future products, it's an improvement.
- **"Can I share partial improvements?"** — Yes! Only commit the orchestration changes, not product code.
- **"What if the template maintainer rejects my improvement?"** — They'll give feedback. Update and resubmit, or keep it in your product if it's too specialized.
- **"Can I share improvements if I have a forked template repo?"** — Yes! Just set the template URL when running the script.

---

## Workflow Summary

```
Build Product
    ↓
Improve Agents/Templates/Workflows (during build)
    ↓
Run: ./discover-improvements.ps1
    ↓
Review: improvements.md
    ↓
Create: improvements/from-product-name branch
    ↓
Commit: Improvements with good messages
    ↓
Create PR: Against template repo
    ↓
Template maintainer reviews & merges
    ↓
All future products benefit from improvements ✨
```

---

**Ready to discover improvements?** Run the script and share back! 🚀
