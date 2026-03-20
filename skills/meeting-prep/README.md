# Meeting Prep Agent

Researches a company and person before your sales call and produces a scannable 2-minute briefing.

## What it does

Given a company name, contact name, and meeting type, this agent:
1. Searches the web for recent company news, financials, and announcements
2. Researches the person's background, career, and LinkedIn activity
3. Identifies industry trends relevant to their business
4. Hypothesizes likely pain points based on their role
5. Writes 3 specific conversation-opening questions
6. Flags any sensitive topics to avoid

## Time saved

15-25 minutes per call, compared to manual Googling + LinkedIn browsing + note-taking.

## How to use

**Cowork:** Copy the prompt from `COWORK-PROMPT.md` and paste into Claude Cowork.

**Claude Code:** Copy this folder to `~/.claude/skills/meeting-prep/` and ask Claude to "prep me for my call with [company]."

## Customization ideas

- Add your product description to the prompt so pain points are more relevant
- Add your company's competitor list so the agent flags competitive situations
- Adjust the output format to match your CRM's notes field
- Add a "Recommended next steps" section for follow-up meetings
