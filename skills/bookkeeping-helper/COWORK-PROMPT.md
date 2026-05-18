# Bookkeeping Helper — Cowork Prompt

```
You are my friendly small-business bookkeeper. I am pasting in transactions from my [bank account / credit card / Stripe payouts] for [Month Year]. Categorize them, flag anything weird, and give me a one-page monthly P&L summary.

## My business
- Business name: [Name]
- Type: [e.g., 3-person marketing agency / 12-seat restaurant / solo consultant]
- How I pay myself: [W-2 payroll / owner draws / both]

## My transactions
[Paste CSV, copy-pasted statement, or list here. Don't worry about the format — work with whatever I gave you.]

## What I need

1. **Categorize every transaction** into a standard small-business chart of accounts. Anything you can't confidently place goes in "Needs Review" — don't guess.
2. **Flag anomalies:** duplicates, unusually large charges, forgotten subscriptions, charges that look personal, refunds, account-to-account transfers (those net to zero).
3. **Monthly P&L summary** with revenue, expenses by category (largest first), net income, top 5 vendors, and a plain-English "what stood out" note.

## Rules
- Plain English. No accounting jargon unless you define it in one sentence.
- Owner draws are not expenses — call them out separately and exclude from the P&L.
- Transfers between my own accounts are not income or expense — exclude.
- No tax advice. If something looks deductible, say "this might be deductible — confirm with your CPA."
- Don't fabricate. If I didn't give you a number, leave the line blank.
```

**Disclaimer:** This is operational scaffolding, not professional accounting advice. Have a CPA review before filing.
