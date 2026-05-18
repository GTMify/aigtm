# Programmatic SEO

Plans page-at-scale SEO projects using one template + a data source.

## What it does

Given a target pattern + data source, this agent:
1. Validates real search demand per variation
2. Specs the page template (URL, title, meta, H1, sections, schema, CTA)
3. Designs the sitemap and internal linking structure
4. Sets quality gates so thin pages don't get indexed
5. Recommends a phased rollout (pilot → scale → maintain)
6. Renders 3 sample pages with real data

## Time saved

20-40 hours of upfront planning vs. building without structure.

## Optional keys

- `DATAFORSEO_LOGIN` / `DATAFORSEO_PASSWORD` — search volume and difficulty
- `AHREFS_API_KEY` — keyword research and SERP analysis
- `FIRECRAWL_API_KEY` — research existing top results

## How to use

**Cowork:** Copy the prompt from `COWORK-PROMPT.md` and paste into Claude.

**Claude Code:** Copy this folder to `~/.claude/skills/programmatic-seo/` and ask Claude to "plan a programmatic SEO project for [pattern]."

## Customization ideas

- Add your existing site's URL structure so the new template fits cleanly
- Add your schema markup library so new templates inherit existing types
- Pair with `competitor-alternatives` skill for "[competitor] alternatives" pages
- Pair with `seo-audit` to audit existing programmatic pages
