# Product Marketing Artifact Suite

Builds the foundational PMM stack: positioning brief, persona docs, value matrix, competitive frame, sales enablement.

## What it does

Given a subject + available inputs, this agent:
1. Writes a positioning brief in the April Dunford structure
2. Builds persona docs with verbatim customer language
3. Creates a value matrix (persona × capability) with outcomes and proof
4. Frames the top 3 competitors with win/lose/hinge analysis
5. Produces a sales enablement kit (1-pager, talk track, demo flow, FAQ, objection handling)
6. Marks every artifact with an updated date and owner

## Time saved

20-40 hours per suite vs. building all artifacts individually.

## How to use

**Cowork:** Copy the prompt from `COWORK-PROMPT.md` and paste into Claude.

**Claude Code:** Copy this folder to `~/.claude/skills/pmm/` and ask Claude to "build a PMM suite for [subject]."

## Customization ideas

- Add your customer interview transcript library so persona verbatim is automatic
- Add your standard demo flow so enablement kits inherit it
- Add a glossary of internal terms vs. customer terms so docs use the right language
- Pair with `messaging`, `battlecard`, and `competitor-alternatives` skills to extend the suite
