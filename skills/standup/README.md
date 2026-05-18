# Morning Brief / Daily Standup

90-second morning brief from pasted calendar, pipeline, and recent activity.

## What it does

Given today's calendar + recent activity + email subjects, this agent:
1. Names "the one thing" — the highest-leverage action of the day
2. Summarizes today's calendar with the *purpose* of each meeting
3. Surfaces what changed since yesterday
4. Lists decisions and asks waiting on you
5. Names what to ignore today (protecting deep work)

## Works with pasted data

This skill is integration-agnostic. Paste calendar, pipeline, and inbox excerpts inline. For live integrations:
- **Gmail / Outlook:** install a dedicated email tool separately
- **Google Calendar:** export the day to a list and paste
- **CRM:** export today's snapshot or use the `crm` skill output as input

## Time saved

10-15 minutes per morning vs. self-triage across multiple tools.

## How to use

**Cowork:** Copy the prompt from `COWORK-PROMPT.md` and paste your data inline.

**Claude Code:** Copy this folder to `~/.claude/skills/standup/` and ask Claude to "give me my morning brief."

## Customization ideas

- Add your default focus areas so the "one thing" recommendation is calibrated to your role
- Add your stalled-deal definitions and they'll surface here automatically
- Pair with `crm` skill (run daily) and `focus-time` (block the deep work)
