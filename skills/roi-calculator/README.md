# ROI / Business Case Agent

Builds a conservative, risk-adjusted business case for a specific deal — with Conservative / Base / Aggressive scenarios, total cost of ownership, payback period, NPV, a CFO Q&A section anticipating procurement and finance pushback, and a sensitivity table on the biggest assumption. Refuses to proceed without a status-quo baseline so the model rests on real numbers rather than aspirational projections, and exposes the math so the customer can recreate it.

## How to use

**Cowork:** Copy `COWORK-PROMPT.md` into Claude Cowork.

**Claude Code:** Install to `~/.claude/skills/roi-calculator/` and ask Claude to "build a business case for [customer]."
