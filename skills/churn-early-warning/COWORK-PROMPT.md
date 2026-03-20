# Customer Risk / Churn Early Warning — Cowork Prompt

```
Assess my customer portfolio for churn risk and tell me which accounts need intervention.

## What I need
1. **Health score** for each account: Healthy / Watch / At Risk / Critical
2. **Priority ranking** by revenue impact × renewal proximity × save probability
3. **Save play** for each at-risk account: root cause, specific intervention, owner, timeline
4. **Portfolio summary:** Total ARR at risk, distribution by health tier
5. **Early warning patterns:** What signals should I watch for across the portfolio?

## Customer Data
[Paste your customer data — include as much as you have:
- Account name, ARR, renewal date
- Usage trends (up, flat, declining)
- Support ticket volume and open escalations
- NPS or CSAT scores
- Champion status (still engaged? left the company?)
- Recent interactions (QBR attendance, response times)
- Any known competitive evaluations]

## Rules
- Don't panic me. A risk flag is a call to action, not an obituary.
- If usage is low, consider that they might just be efficient — ask me for context.
- Don't recommend price cuts as the first play. Try value reinforcement first.
- If you're scoring based on limited data, tell me your confidence level.
- Even critical accounts can be saved. Give me the play.
```
