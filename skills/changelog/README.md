# Changelog / Release Notes Agent

Generates user-facing release notes from git logs, ticket lists, PR titles, or session notes. Translates engineer-speak into user value, groups by impact rather than ship date, and adapts tone for three distinct audiences (public customers, internal team for sales/support enablement, or developers consuming an API). Leads with 1-3 highlights so the most-read part of the changelog surfaces what matters, drops internal-only items from public notes, and flags breaking changes loudly with migration steps.

## How to use

**Cowork:** Copy `COWORK-PROMPT.md` into Claude Cowork.

**Claude Code:** Install to `~/.claude/skills/changelog/` and ask Claude to "write release notes" or "build the changelog."
