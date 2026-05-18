# Marketing Psychology Toolkit

Applies behavioral science (Cialdini, Kahneman, Thaler, Ariely) to specific marketing assets and decisions.

## What it does

Given a marketing asset + the action you want, this agent:
1. Diagnoses the underlying psychological driver (loss aversion, social proof gap, decision paralysis, etc.)
2. Picks the right principle and shows the ethical vs. unethical version
3. Prescribes specific asset changes (headline, hero, CTA, body, microcopy)
4. Names dark patterns to avoid even when tempted
5. Defines measurement (including a "fail signal" so manipulation gets caught)

## Time saved

3-8 hours per asset optimization vs. trial-and-error.

## How to use

**Cowork:** Copy the prompt from `COWORK-PROMPT.md` and paste into Claude.

**Claude Code:** Copy this folder to `~/.claude/skills/marketing-psychology/` and ask Claude to "apply psychology to my landing page."

## Customization ideas

- Add your brand voice rules so principle application stays on-tone
- Add your historical A/B test data so the agent doesn't recommend tests you've already run
- Pair with `messaging`, `cold-email`, `microsite`, and `campaign` skills so every customer-facing surface inherits sound psychology
