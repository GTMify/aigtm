# Referral / Warm Intro Agent

Finds warm-intro paths into a target account and produces the 2-message bundle — the intro request you send to the mutual connection, plus the forwardable third-person blurb that connection will paste into their message to the target. Ranks possible connectors by closeness and likelihood-to-say-yes, writes a thank-you reply for after the intro lands, and provides a Plan B if the connector goes silent. Built on the principle that the forwardable blurb is the highest-leverage artifact in the entire referral process.

## How to use

**Cowork:** Copy `COWORK-PROMPT.md` into Claude Cowork.

**Claude Code:** Install to `~/.claude/skills/referral/` and ask Claude to "find a warm intro to [name] at [company]."
