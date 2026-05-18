# Daily CRM Priorities

Surfaces the top 5-8 things you should actually work on today from pasted CRM data.

## What it does

Given pasted CRM data (calendar, open opps, follow-ups, recent activity), this agent:
1. Surfaces top 5-8 priorities with verb-led actions and time estimates
2. Drafts meeting prep for each call on today's calendar
3. Flags stalled deals with suggested next actions
4. Maintains a short watchlist for the rest of the week
5. Shows what's being deferred so you can override

## Works with pasted data

This skill is integration-agnostic. Copy/paste your CRM data, calendar, and follow-ups — Claude does the triage. For live integrations:
- **Salesforce:** install the Salesforce CLI separately
- **HubSpot:** use `HUBSPOT_API_KEY` and a fetch script, or pipe a list view export
- **Google Calendar / Outlook:** export to ICS or paste a copy

## Time saved

20-30 minutes per morning vs. self-triage.

## How to use

**Cowork:** Copy the prompt from `COWORK-PROMPT.md` and paste your data inline.

**Claude Code:** Copy this folder to `~/.claude/skills/crm/` and ask Claude to "show my priorities" or "what should I work on today."

## Customization ideas

- Add your scoring rubric (deal size thresholds, stage definitions) so triage matches how you actually rank work
- Add your stalled-deal definitions (e.g., "no activity 21 days = stalled" instead of 14)
- Pair with `standup` for a fuller morning brief or `focus-time` for calendar blocking
