# Messaging Architect

Builds positioning and a full message hierarchy — from pitch line to long-form pitch.

## What it does

Given current state + audience + customer verbatim, this agent:
1. Picks the right positioning frame (category alternative, category creator, status quo enemy, transformation, speed/scale)
2. Builds a 5-layer hierarchy that says the same thing at different fidelity
3. Cuts persona-specific framings (CFO vs. user vs. technical)
4. Catalogs proof for every claim
5. Names anti-messaging (buzzwords banned, phrases not to use)
6. Runs the 5-question test (true, specific, targeted, sacrificial, memorable)

## Time saved

10-20 hours per messaging revision vs. building from scratch.

## How to use

**Cowork:** Copy the prompt from `COWORK-PROMPT.md` and paste into Claude.

**Claude Code:** Copy this folder to `~/.claude/skills/messaging/` and ask Claude to "sharpen our messaging" or "build positioning for [product]."

## Customization ideas

- Add your customer interview library (raw transcripts) so the agent lifts verbatim language
- Add your competitor positioning library so the agent triangulates against them
- Add your standard proof points so they get reused consistently
- Pair with `launch`, `microsite`, `campaign`, and `cold-email` skills so all surfaces inherit the hierarchy
