# Maintenance Guide

Use this guide to keep the repository template and active products healthy over time.

---

## Keeping the Template Up to Date

This repository is a living template. As you learn from building products, update the agents, checklists, and workflows to reflect what works.

### When to update the template

- An agent consistently produces outputs that miss a specific quality bar → update that agent's Quality Checklist
- A checklist item is never failing but also never catching issues → replace it with something more targeted
- A new workflow emerges from real builds → add it to `workflows/`
- A stack choice in `knowledge/technical_reference/default-mvp-stack.md` becomes outdated → update it

### How to update

1. Make the change in this template repository
2. For active products that have diverged from the template, manually apply the relevant change to each product's `.claude/` or `agents/` directory if needed

---

## Keeping Active Products Healthy

### Weekly checks

- [ ] Dependency audit: `npm audit`
- [ ] CI pipeline is green on main
- [ ] No unresolved P0 or P1 incidents

### Monthly checks

- [ ] Review open GitHub issues and triage anything unaddressed
- [ ] Update dependencies: `npm update` for minor updates; review majors manually
- [ ] Check for deprecated APIs or packages in use
- [ ] Review error logs for patterns that indicate a systemic issue

### Before each sprint

- [ ] Sprint plan is documented using `templates/project_management/sprint-plan-template.md`
- [ ] All open defects from the previous sprint are triaged
- [ ] Definition of done for the sprint is confirmed with all agents

---

## Deprecating Agents or Workflows

When an agent or workflow is no longer useful:

1. Move it to an `_archive/` subdirectory rather than deleting it
2. Add a note at the top of the file: `# ARCHIVED — [reason] — [date]`
3. Remove it from any index files or README tables

This preserves history without cluttering active navigation.

---

## Reviewing Agent Performance

After every product build, run a brief retrospective on the agent outputs:

- Which agent produced the highest-quality output without revision?
- Which agent required the most back-and-forth before producing useful output?
- Which checklist items caught real issues vs. which were never relevant?

Record findings in `knowledge/case_studies/` using the case study template.

Use these findings to improve agent system prompts and checklists before the next build.
