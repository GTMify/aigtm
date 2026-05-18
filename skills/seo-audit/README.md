# SEO Audit

Audits sites for SEO issues and prioritizes the top 10-20 fixes by impact × effort.

## What it does

Given a site URL + available data, this agent:
1. Walks through 7 layers (indexation, architecture, performance, on-page, schema, authority, GSC signals)
2. Prioritizes findings by impact × effort
3. Surfaces 3-5 quick-win fixes for the current week
4. Writes detailed fix instructions (before/after/verify) for each top fix
5. Skips 2010-era SEO myths and focuses on what actually moves rankings today

## Time saved

15-30 hours per audit vs. running tools individually and synthesizing findings.

## Optional keys

- `GA4_SERVICE_ACCOUNT_JSON` — pull Analytics data
- `DATAFORSEO_LOGIN` / `DATAFORSEO_PASSWORD` — keyword and rank data
- `AHREFS_API_KEY` — backlink and authority data
- `FIRECRAWL_API_KEY` — fast crawl for technical issues

## How to use

**Cowork:** Copy the prompt from `COWORK-PROMPT.md` and paste into Claude.

**Claude Code:** Copy this folder to `~/.claude/skills/seo-audit/` and ask Claude to "audit [site] for SEO issues."

## Customization ideas

- Add your house style for fix tickets (Jira format, GitHub issues) so the output ships ticket-ready
- Add your tech stack so fix instructions reference the right framework
- Add a quarterly cadence so audits run automatically against the same site
- Pair with `programmatic-seo` to audit existing page-at-scale projects
