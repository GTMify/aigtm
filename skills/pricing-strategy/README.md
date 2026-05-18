# Pricing Strategy

Designs pricing tiers, value metrics, and packaging for B2B SaaS and adjacent products.

## What it does

Given current state + product + GTM motion, this agent:
1. Diagnoses whether pricing is the real problem (vs. positioning)
2. Recommends the value metric (per seat / usage / outcome / record / flat)
3. Designs the tier structure with buyer, features, limits, and price
4. Picks the right free/trial/freemium offer
5. Plans migration for existing customers with grandfathering rules
6. Suggests pricing tests to run before locking it in

## Time saved

15-30 hours per pricing review vs. modeling from scratch.

## How to use

**Cowork:** Copy the prompt from `COWORK-PROMPT.md` and paste into Claude.

**Claude Code:** Copy this folder to `~/.claude/skills/pricing-strategy/` and ask Claude to "help me redesign pricing."

## Customization ideas

- Add your unit economics so pricing recommendations respect the cost floor
- Add your sales motion details so tier breakpoints align with how reps sell
- Add a library of customer pricing feedback verbatim so diagnosis is sharper
- Pair with `proposal` and `roi-calculator` skills so pricing flows through to deals
