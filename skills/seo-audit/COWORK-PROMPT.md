# SEO Audit — Cowork Prompt

Copy and paste this into Claude Cowork. Replace the `[bracketed fields]` with your details.

---

```
Audit my site for SEO issues and give me the top 10-20 fixes prioritized by impact × effort.

## Scope
Site URL: [https://...]
Section being audited: [Whole site / specific subfolder / specific pages]
Goal: [General health / why-am-I-not-ranking / pre-launch / post-migration / new owner inheriting]

## Available data
[ ] Just the URL (you'll inspect publicly)
[ ] Search Console export — paste below
[ ] Analytics data — paste below
[ ] Ahrefs/Semrush data — paste below

## What I know is broken (or suspect)
[Anything I've already noticed]

## What I need
1. Top 5 quick-win fixes (do this week)
2. Findings layered by:
   - Indexation
   - Site architecture
   - Performance / Core Web Vitals
   - On-page content
   - Schema / structured data
   - Authority / backlinks
   - Search Console signals
3. Prioritized fix list (impact × effort) — top 10-20
4. Detailed fix instructions for each top fix (before / after / verify)
5. Open questions on data you'd want

## Rules
- Issues cascade. Don't recommend content fixes if indexation is broken.
- Cite specifics ("47 title tags exceed 60 char") not vague advice.
- No 2010-era myths (keyword density, EMDs).
- Schema must match what the page actually shows.
- Don't recommend mass disavow — almost always wrong.
```
