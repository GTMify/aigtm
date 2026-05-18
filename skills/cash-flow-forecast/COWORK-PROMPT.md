# Cash Flow Forecast — Cowork Prompt

```
Build me a 13-week rolling cash flow forecast for my small business. Be conservative on inflows, aggressive on outflows, and tell me in one sentence whether I'm fine, tight, or in trouble.

## Starting point (today)
- Cash on hand (checking + savings + un-deposited): $[X]
- Outstanding invoices owed to me: [list amount + expected pay week]
- Outstanding bills I owe: [list amount + due week]

## Recurring inflows (next 13 weeks)
- Customer retainers / subscriptions: [amount + which week]
- Committed sales not yet collected: [conservative only — no "hopeful" deals]
- Other inflows (loan draws, owner contributions, refunds): [list]

## Recurring outflows
- Payroll: $[X], hits [weekly/biweekly/monthly], dates: [days]
- Rent: $[X], hits Week [N] of each month
- Loan payments: $[X], hits Week [N]
- Software / subscriptions: [list with amounts]
- Estimated quarterly tax payment due in this window? [Y/N — date and amount]
- Other known expenses: [list]

## What I need
1. 13-week grid with categories × weeks and ending cash row.
2. Lowest cash point and which week it hits.
3. Runway in weeks assuming no new revenue.
4. Risk flags — weeks where I drop below one payroll cycle or go negative.
5. Plain-English diagnosis: am I fine, getting tight, or in trouble?
6. Concrete recommendations (1-3 specific actions with timelines).

After the base case, offer to model:
- Stress: my 2 biggest customers pay 30 days late
- Growth: [my pending deal] closes Week [N]

## Rules
- Conservative on inflows — committed only.
- Don't fabricate amounts I didn't give you.
- No financing or investment advice — that's a CFO conversation.
```

**Disclaimer:** Operational scaffolding, not professional financial advice. Have a CPA or fractional CFO review before hiring, taking debt, or making distributions.
