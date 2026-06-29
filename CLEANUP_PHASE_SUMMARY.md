# Phase 08: Cleanup — What's New!

After your product ships (Phase 07), **Phase 08 automatically removes all template scaffolding** to ensure a clean, production-ready codebase.

---

## The Problem You Solved

When building a product from a template, you often end up with:
- ✗ Template reference files and boilerplate
- ✗ Placeholder code and comments like "TODO: Remove this"
- ✗ Example/demo code and fixtures
- ✗ Unused test data
- ✗ Template documentation
- ✗ Example configurations
- ✗ Old draft versions
- ✗ Junk that makes the codebase feel "generated"

**Result:** A production product that feels messy, not purpose-built.

---

## The Solution: Phase 08 (Cleanup)

After Phase 07 completes, Phase 08 automatically:

1. **Identifies all template artifacts** using the cleanup manifest
2. **Asks for approval** before removing anything
3. **Removes approved junk** (template files, boilerplate, examples, etc.)
4. **Updates documentation** to remove template references
5. **Verifies the codebase** is still intact and working
6. **Commits the cleanup** to git with a clear record

**Result:** A pristine, production-ready codebase with zero cruft.

---

## Files Created

### Core Files

| File | Purpose |
|---|---|
| `CLEANUP_MANIFEST.md` | Defines what gets removed, what stays, exceptions |
| `agents/engineering/cleanup_agent.md` | Cleanup Agent definition—orchestrates the cleanup |

### Updated Files

| File | What Changed |
|---|---|
| `START_BUILD.md` | Added Phase 08 description and timeline |
| `templates/project_management/master-orchestration-workflow.md` | Added Phase 08 (Cleanup) section with full instructions |
| `_delivery/TEMPLATE_PROJECT/master_progress.md` | Added Phase 08 to the phase completion table |

---

## What Gets Removed (from CLEANUP_MANIFEST.md)

### Definitely Removed ✓
- `TEMPLATE_PROJECT/`, `EXAMPLE_*.md`, template-suffixed files
- Lines with markers: `"TODO: Remove this"`, `"[SCAFFOLD]"`, `"[TEMPLATE]"`
- Example configurations: `config/example_*.json`, `config/sample_*.yaml`
- Example test fixtures: `tests/fixtures/demo_*`, `tests/mocks/template_*`
- Documentation artifacts: `docs/examples/`, `docs/tutorials/`
- Build cache: `.cache/`, `*.log`, `.pytest_cache/`
- Old draft versions: `prd_v1.md`, `architecture_draft.md`
- IDE artifacts: `.vscode/extensions.json`, `.idea/`, `.DS_Store`

### Definitely Kept ✓
- All actual product source code
- Real tests and test data
- Production configuration
- Product documentation (user guides, API docs, runbooks)
- CI/CD configurations
- Infrastructure code
- Database migrations
- `README.md`, `SETUP.md`, `LICENSE`
- `package.json`, `requirements.txt` (for dependency lists)
- `.env.example` (template for env vars)

---

## How Phase 08 Works

### When It Runs
```
Phase 07 (Release): Product ships
        ↓
Phase 08 (Cleanup): Remove template artifacts
        ↓
Done: Production-ready, clean codebase
```

### What Happens
```
1. Orchestrator asks: "Ready for cleanup?"
   ↓
2. Invokes Cleanup Agent with CLEANUP_MANIFEST.md
   ↓
3. Cleanup Agent scans codebase for template artifacts
   ↓
4. Groups findings by category:
   - Template scaffolding
   - Test fixtures
   - Documentation artifacts
   - Configuration examples
   - Build artifacts
   - Unused dependencies
   - Old versions
   - IDE artifacts
   ↓
5. For each category, asks: "Remove [Category]? [Yes/No/Review Each]"
   ↓
6. Gets human approval before deleting anything
   ↓
7. Removes approved files using "git rm"
   ↓
8. Updates documentation (remove "[TEMPLATE]" markers, etc.)
   ↓
9. Verifies codebase is intact:
   - Essential files exist
   - Source code intact
   - Tests still pass
   - Git status clean
   ↓
10. Commits cleanup with clear message:
    "Phase 08: Cleanup template artifacts"
    ↓
11. Archives cleanup report in _delivery/<project>/cleanup/
    ↓
12. Marks Phase 08 complete in master_progress.md
```

---

## What You Get

After cleanup runs, you have:

```
Project Directory
├── src/ (actual source code — all kept)
├── tests/ (real tests — all kept)
├── docs/ (product documentation — all kept)
├── config/ (production config — all kept)
├── infrastructure/ (actual infrastructure code — all kept)
├── README.md (updated: product description, template language removed)
├── SETUP.md (updated: product-specific setup)
├── package.json (updated: product name instead of "template")
├── .env.example (kept: useful for developers)
├── .gitignore (all necessary patterns)
├── LICENSE (kept)
└── [NO JUNK]

_delivery/<project>/cleanup/
├── cleanup_report.md (what was removed)
├── removed_files.txt (list of deleted files)
├── cleanup_manifest_applied.md (manifest + what was actually removed)
├── git_diff_cleanup.patch (git patch for recovery if needed)
└── verification_report.md (verification checklist)
```

**Result:** A production product that looks purpose-built, not generated from a template.

---

## Example: Habit Tracker Before & After

### Before Cleanup
```
habit-tracker/
├── TEMPLATE_PROJECT/                    ← REMOVED
├── SCAFFOLD_NOTES.md                    ← REMOVED
├── examples/                            ← REMOVED
├── tests/
│   └── fixtures/
│       ├── demo_user_data.json          ← REMOVED
│       ├── mock_db.sqlite               ← REMOVED
│       └── real_test_data.json          ✓ KEPT
├── _analysis/                           ← REMOVED
├── docs/
│   ├── tutorials/                       ← REMOVED
│   └── user_guide/                      ✓ KEPT
├── config/
│   ├── example_config.json              ← REMOVED
│   ├── production.json                  ✓ KEPT
│   └── staging.json                     ✓ KEPT
├── .vscode/extensions.json              ← REMOVED
├── prd_v1.md                            ← REMOVED (archived in _delivery/)
├── prd_v2.md                            ✓ KEPT (final version)
├── DEVELOPMENT.md                       ← REMOVED (was generic template)
├── src/                                 ✓ KEPT (all code)
├── tests/                               ✓ KEPT (all tests)
└── [other junk files]
```

### After Cleanup
```
habit-tracker/
├── README.md                            ✓ UPDATED (product description)
├── SETUP.md                             ✓ UPDATED (product-specific)
├── ARCHITECTURE.md                      ✓ KEPT
├── src/                                 ✓ KEPT (all code)
├── tests/                               ✓ KEPT (all tests)
│   └── fixtures/
│       └── real_test_data.json          ✓ KEPT
├── docs/
│   ├── user_guide/                      ✓ KEPT
│   └── api_docs/                        ✓ KEPT
├── config/
│   ├── production.json                  ✓ KEPT
│   └── staging.json                     ✓ KEPT
├── .env.example                         ✓ KEPT
├── package.json                         ✓ UPDATED (removed template name)
├── LICENSE                              ✓ KEPT
└── [CLEAN — no junk]
```

**Size reduction:** ~40% less files, cleaner structure, production-ready feel.

---

## Key Points

✓ **Automatic:** Phase 08 runs automatically after Phase 07  
✓ **Safe:** Asks for approval before removing anything  
✓ **Reversible:** Everything is in git history and backed up in `_delivery/`  
✓ **Verified:** Checks that the codebase is still intact after cleanup  
✓ **Audited:** Creates a detailed cleanup report  
✓ **Committed:** Records cleanup in git so it's part of your history  

---

## Timeline

Phase 08 adds **1–2 hours** to the total build time (the cleanup itself is fast).

```
Phase 07 (Release): 1 day
Phase 08 (Cleanup): 1–2 hours (mostly asking questions)
Total: Add ~4–10% to overall timeline
```

---

## Files to Read

1. **[CLEANUP_MANIFEST.md](CLEANUP_MANIFEST.md)** — Detailed definition of what gets removed/kept
2. **[agents/engineering/cleanup_agent.md](agents/engineering/cleanup_agent.md)** — Cleanup Agent definition
3. **[START_BUILD.md](START_BUILD.md)** — Updated to include Phase 08
4. **[templates/project_management/master-orchestration-workflow.md](templates/project_management/master-orchestration-workflow.md)** — Phase 08 section with full instructions

---

## Summary

**Phase 08 is the final touch.** After your product ships (Phase 07), Phase 08 automatically:
1. Identifies template junk
2. Asks for approval
3. Removes it
4. Verifies the codebase is intact
5. Commits the cleanup

**Result:** A production-ready product with zero template artifacts—looks purpose-built, not generated.

Now when you build products, you get:
- ✓ Phases 00–07: Build the product
- ✓ Phase 08: Clean it up
- ✓ Final result: Production-quality, pristine codebase

Enjoy your clean products! 🎉
