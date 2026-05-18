# Changelog / Release Notes — Cowork Prompt

Copy into Claude Cowork. Replace the `[bracketed fields]`.

---

```
Turn this list of shipped work into user-facing release notes. Translate engineer-speak into user value, group by impact, lead with highlights.

## Inputs
[Paste git log / commit messages / Jira ticket titles / Linear issue list / PR titles / session notes — whatever you have]

## Audience
[Public users / customers OR internal team (sales + support) OR developers / API consumers]

## Product and Version
Product: [Name]
Version or release date: [v2.4.0 or 2026-05-18]

## What I Need
1. A "Highlights" section with 1-3 top items written as user value
2. Categorized full list: New / Improved / Fixed / Changed / Breaking / Deprecated / Security (omit empty categories)
3. Each entry rewritten as user value, not engineering action
4. Loud, structured callouts for breaking changes with migration steps and deadlines
5. (For internal audience) a "What Sales / Support Should Say" section

## Rules
- Drop internal-only items (refactors, infra) from public changelogs.
- Sort within each category by user impact, not ship date.
- No hype words. "Revolutionary," "blazing fast," etc. get cut.
- Be honest about bugs fixed — clear lists build trust.
- Audience tone calibration: public = value-first; internal = scripts + diff; dev = technical detail.
```
