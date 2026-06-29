# Phase 08: Cleanup Manifest

After a product build completes (Phase 07), this manifest defines what to automatically remove to ensure a clean, production-ready codebase.

---

## When to Run Cleanup

**After:** Phase 07 (Release) is complete and product is live  
**Before:** Handing off to operations or marking project complete

---

## What Gets Removed

### Category 1: Template Scaffolding

Remove all placeholder/boilerplate files that were generated during initial setup:

```
├── TEMPLATE_*.md (all template reference files)
├── EXAMPLE_*.md (all example files)
├── *_TEMPLATE.* (any template-suffixed files in code)
├── examples/ (example code directory)
├── sample_* (sample files)
├── placeholder/ (placeholder files/directories)
├── boilerplate/ (boilerplate code directories)
└── .scaffold/ (build scaffolding artifacts)
```

**Exception:** Keep if the product actually uses it (e.g., example code is part of the product documentation)

---

### Category 2: Template Comments & Markers

Remove comments and code markers that reference the template system:

```
# Remove lines matching:
- "# TODO: Remove this for production"
- "// NOTE: This is a template scaffolding"
- "SCAFFOLD:" (any line with this marker)
- "TEMPLATE:" (any line with this marker)
- "BOILERPLATE:" (any line with this marker)
- "[TEMPLATE]" (any bracketed template markers)
- "// Remove this template file when"
- "# Delete this file after"
```

**Tool:** Use grep to find and replace these patterns

---

### Category 3: Generated Test Fixtures & Mocks

Remove test data that was generated for demonstration:

```
├── tests/fixtures/demo_* (demo test fixtures)
├── tests/mocks/template_* (template mocks)
├── test_data/ (temporary test data)
├── fixtures/examples/ (example fixtures)
├── seeded_data/ (if it's clearly demo data, not production seed)
└── mock_databases/ (mock database files)
```

**Exception:** Keep if test fixtures are real test data needed for CI/CD

---

### Category 4: Documentation Artifacts

Remove documentation that was generated as examples:

```
├── DEVELOPMENT.md (if it's just template content, not project-specific)
├── ARCHITECTURE_TEMPLATE.md (remove the template, keep any actual architecture docs)
├── SETUP_INSTRUCTIONS_EXAMPLE.md
├── docs/examples/ (example documentation)
├── docs/tutorials/ (tutorial documentation that's not product-specific)
└── docs/template_* (template documentation)
```

**Exception:** Keep real documentation that users/operators need

---

### Category 5: Configuration Examples

Remove unused configuration files that were generated as examples:

```
├── .env.example (keep) — useful for developers
├── .env.template.* (remove)
├── config/example_*.json (remove)
├── config/sample_*.yaml (remove)
├── docker-compose.override.yml (may remove if not used)
└── kubernetes/examples/ (remove example k8s files)
```

**Exception:** Keep `.env.example` and any real config that's actually in use

---

### Category 6: Build Artifacts & Cache

Remove build outputs and temporary files:

```
├── build/ (if empty or contains only temp artifacts)
├── dist/ (if empty or contains only build artifacts)
├── .cache/ (all cache)
├── *.log (all log files)
├── node_modules/ (only in `_delivery/` — keep in actual project)
├── __pycache__/ (Python cache)
├── *.pyc (Python compiled)
├── .pytest_cache/ (pytest cache)
└── .coverage (coverage reports)
```

**Exception:** Keep in-use artifacts (e.g., if `dist/` is where the actual product is built)

---

### Category 7: Unused Dependencies

In `package.json`, `requirements.txt`, `go.mod`, etc:

Remove dependencies that were installed for:
- Template examples
- Demo code
- Development tools not actually used
- Example integrations that weren't implemented

**Check:** `npm ls` (Node), `pip check` (Python), `cargo tree` (Rust) to find unused deps

---

### Category 8: Generated Reports & Analysis

Remove one-time analysis files:

```
├── _analysis/ (temporary analysis directories)
├── dependency-report.* (dependency analysis)
├── security-scan-results.json (if it's a one-time scan)
├── performance-baseline.txt (if it was just for reference)
├── TECH_DEBT_AUDIT.md (if it was a one-time report)
└── CODEBASE_ANALYSIS.md (if it was a one-time report)
```

**Exception:** Keep any reports needed for operations or compliance

---

### Category 9: Old Versions & Drafts

Remove superseded versions:

```
├── prd_v1.md, prd_v2.md (keep only final version, archive old in _delivery/)
├── architecture_draft.md
├── ROADMAP_OLD.md
├── NOTES_DISCARDED.md
├── OLD_DESIGN/ (old design directories)
└── deprecated/ (old code/configs)
```

**Keep in _delivery/:** Archive old versions there for reference, don't keep in main codebase

---

### Category 10: IDE & Editor Artifacts

Remove editor-specific files (usually already in .gitignore, but verify):

```
├── .vscode/extensions.json (if it's just for template dev)
├── .idea/ (JetBrains IDE cache)
├── *.swp, *.swo (Vim temp files)
├── .DS_Store (macOS metadata)
└── Thumbs.db (Windows metadata)
```

---

## What To KEEP

### Essential Product Files

✓ **Source code:** All actual product code  
✓ **Tests:** All real tests (not demo tests)  
✓ **Configuration:** Production configuration files  
✓ **Documentation:** Product documentation for users/operators  
✓ **Infrastructure:** Actual infrastructure code (Terraform, k8s manifests, etc.)  
✓ **Database:** Real migrations, schemas  
✓ **Build files:** CI/CD configs, build scripts  
✓ **Dependencies:** All used dependencies  

### Project Documentation

✓ `README.md` — product overview  
✓ `ARCHITECTURE.md` — actual architecture docs  
✓ `CONTRIBUTING.md` — contribution guidelines  
✓ `SETUP.md` — setup instructions  
✓ `docs/` — user/operator documentation  
✓ `CHANGELOG.md` — release notes  
✓ `memory/` — evolving project state, decisions, and progress tracking (DO NOT DELETE)  

### Configuration

✓ `.env.example` — template for environment vars  
✓ `.gitignore` — git ignore rules  
✓ `package.json`, `requirements.txt`, etc. — dependency lists  
✓ CI/CD configs (`.github/workflows/`, `.gitlab-ci.yml`, etc.)  

### Meta

✓ `LICENSE` — project license  
✓ `.github/` — GitHub settings (but remove template issues/discussions)  
✓ `.git/` — git history  

---

## How to Use This Manifest

### Automated Cleanup (Recommended)

```bash
# Phase 08 Cleanup Agent will:
1. Parse this manifest
2. Identify files/directories matching removal patterns
3. Ask for confirmation on each removal
4. Delete approved items
5. Verify essential files still exist
6. Report what was removed
7. Commit cleanup to git
```

### Manual Cleanup

```bash
# Review each category above
# For each file/directory:
# 1. Check if it matches the removal pattern
# 2. Verify it's not an exception
# 3. Remove manually with: git rm <file>
# 4. Commit: git commit -m "Phase 08: Cleanup template artifacts"
```

---

## Verification Checklist

After cleanup, verify:

- [ ] All template reference files removed
- [ ] No "TODO: Remove this" comments in code
- [ ] Test fixtures only contain real test data
- [ ] Example/demo code removed (unless it's part of product docs)
- [ ] Unused dependencies removed from manifests
- [ ] Documentation is product-specific, not template-generic
- [ ] Configuration files contain only actual settings
- [ ] Build cache cleared
- [ ] No template markers in code
- [ ] README reflects actual product (not template instructions)
- [ ] .gitignore contains all necessary patterns
- [ ] git status shows clean working directory

---

## Files to Update

Some files need to be updated to remove template references:

### 1. `README.md`
```
Before: "This is a template for building AI products..."
After: "Product Name - Description of what this product does"
```

### 2. `SETUP.md` or similar
```
Before: "Instructions for setting up your template..."
After: "Instructions for setting up this specific product"
```

### 3. `package.json` (or equivalent)
```
Before: "name": "ai-product-template"
After: "name": "<actual-product-name>"
```

### 4. Any `.env.example`
```
Remove: Example values used only for template setup
Keep: Actual required environment variables
```

---

## What Gets Saved (Not Deleted)

Everything gets archived in `_delivery/<project>/` for reference:

```
_delivery/<project>/cleanup/
├── removed_files.txt (list of what was deleted)
├── cleanup_manifest_applied.md (this manifest + what was actually removed)
├── git_diff_cleanup.patch (git patch of cleanup changes)
└── archives/ (backups of removed files, if needed for reference)
```

This ensures you have a record of what was removed and can restore if needed.

---

## Example: Habit Tracker Cleanup

**Before cleanup:**
```
habit-tracker/
├── TEMPLATE_PROJECT/
├── SCAFFOLD_NOTES.md
├── examples/
├── tests/fixtures/demo_user_data.json
├── _analysis/
├── docs/tutorials/
├── config/example_*.json
├── .vscode/extensions.json (template-specific)
├── prd_v1.md (old version)
├── DEVELOPMENT.md (template doc)
├── tests/fixtures/mock_db.sqlite
└── [actual product code]
```

**After cleanup:**
```
habit-tracker/
├── README.md (updated: product description)
├── SETUP.md (updated: setup for this product)
├── ARCHITECTURE.md (actual product architecture)
├── docs/ (product documentation only)
├── config/ (actual product config)
├── tests/fixtures/ (real test data only)
├── tests/ (real tests only)
├── src/ (actual product code)
├── .env.example (real env vars)
└── [everything clean, no junk]
```

---

## Notes

- **Destructive:** This phase removes files. Ensure cleanup is committed to git first.
- **Reversible:** All removed files are archived in `_delivery/` and git history, so you can recover them if needed.
- **Customizable:** If a "removable" item is actually needed for your product, keep it. Use your judgment.
- **Automated:** Phase 08 will ask for confirmation before removing anything questionable.

---

## Phase 08 Process

```
Cleanup Agent will:

1. Read this manifest
2. Scan codebase for matching patterns
3. Group files by category
4. Ask: "Remove Category 1 (Template Scaffolding)? [Y/N/Review]"
5. If Review: show list of files to remove, ask for each
6. Delete approved files
7. Update documentation (remove template references)
8. Run cleanup verification
9. Commit cleanup: git commit -m "Phase 08: Cleanup template artifacts"
10. Report what was cleaned up
11. Archive removed file list in _delivery/<project>/cleanup/
```

---

## Integration with Orchestration

**Phase 07 (Release):** Product ships and is live  
**Phase 08 (Cleanup):** Remove template artifacts (NEW)  
**Done:** Production-ready codebase

The Orchestrator will:
1. Recognize when Phase 07 is complete
2. Ask: "Ready for cleanup?" 
3. Invoke Cleanup Agent (or process)
4. Apply this manifest
5. Update final status in master_progress.md
6. Mark project as "Complete & Cleaned"

---

## Questions?

**Q: What if I need something that's marked for removal?**
A: Use `git log` and `git restore` to recover it. Everything is in git history.

**Q: Can I keep some template files?**
A: Yes! If they're useful for your product, keep them. This manifest is a guide, not law.

**Q: How do I verify the cleanup was correct?**
A: Run the verification checklist above. If anything is wrong, `git revert` the cleanup commit.

**Q: What if I want a different cleanup strategy?**
A: Customize this manifest per project. Add it to your `_delivery/<project>/` folder.
