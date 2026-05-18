# Inbox Zero

Categorizes, prioritizes, and drafts replies for an email backlog from pasted content.

## What it does

Given pasted email subjects + bodies, this agent:
1. Categorizes each email (reply now / reply later / quick yes-no / FYI / action item / defer / unsub)
2. Drafts ready-to-send replies for emails that need them
3. Extracts action items as discrete tasks
4. Suggests senders to unsubscribe from or filter
5. Flags gaps where the right reply needs info you didn't paste

## Works with pasted data

Paste email content directly — subjects, senders, preview text, or full bodies. For live integration:
- **Gmail:** install a dedicated Gmail tool separately and pipe its output here
- **Outlook:** export to a list and paste
- **General:** copy/paste from your client

## Time saved

30-60 minutes per inbox session vs. self-triage.

## How to use

**Cowork:** Copy the prompt from `COWORK-PROMPT.md` and paste your email content.

**Claude Code:** Copy this folder to `~/.claude/skills/inbox-zero/` and ask Claude to "triage my email."

## Customization ideas

- Paste 5-10 of your sent emails so the agent learns your voice
- Add your VIP list (senders that always reply-now) so triage is consistent
- Add your standard templates (e.g., "intro reply," "decline politely") to speed drafts
- Pair with `crm` and `standup` so the day's email work integrates with deal priorities
