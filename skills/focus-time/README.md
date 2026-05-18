# Focus Time Planner

Builds a realistic time-blocked schedule from a pasted calendar and task list.

## What it does

Given today's calendar + task list, this agent:
1. Finds the genuine focus windows (60-90+ min with buffers)
2. Matches tasks to slots by cognitive demand (deep / shallow / communication / reactive)
3. Builds a time-blocked schedule with lunch protected
4. Pre-block prep: files to open, distractions to close, 5-minute starter
5. Names tasks getting deferred (no quiet dropping)
6. Flags honest risks (meetings that run over, energy dips)

## Works with pasted data

Paste calendar events + task list inline. For live calendar integration:
- **Google Calendar:** export today's events and paste
- **Outlook:** export to a list and paste
- **Apple Calendar:** copy/paste from day view

## Time saved

15-25 minutes of decision fatigue saved per morning, plus 1-2 hours of recovered focus time per day.

## How to use

**Cowork:** Copy the prompt from `COWORK-PROMPT.md` and paste your calendar.

**Claude Code:** Copy this folder to `~/.claude/skills/focus-time/` and ask Claude to "plan my day" or "time-block my schedule."

## Customization ideas

- Add your energy curve (when you do your best work) for personalized scheduling
- Add your "always derail me" list so the plan defends against your specific patterns
- Add a standard pre-block prep template
- Pair with `standup` (start the day) and `crm` (priorities feed in)
