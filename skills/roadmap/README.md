# Roadmap Agent

Builds a Now / Next / Later prioritized roadmap with effort estimates, dependencies, and the rationale behind the order — not a 12-month Gantt chart pretending to predict the future. Scores backlog items on impact / effort / confidence with a RICE-style total, capacity-bounds the "Now" bucket so it forces real prioritization, lists explicit non-goals to build trust, and outputs three audience-calibrated views (internal team, exec leadership, customer-facing) since each needs a different cut of the same plan.

## How to use

**Cowork:** Copy `COWORK-PROMPT.md` into Claude Cowork.

**Claude Code:** Install to `~/.claude/skills/roadmap/` and ask Claude to "build a roadmap" or "prioritize the backlog."
