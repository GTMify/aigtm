# ROI / Business Case — Cowork Prompt

Copy into Claude Cowork. Replace the `[bracketed fields]`.

---

```
Build a risk-adjusted business case for a specific deal. I need something a CFO will respect — conservative, with the math shown, with a CFO Q&A section.

## Customer
Company: [Customer]
Size: [Employees / revenue]
Industry: [Industry]

## What They're Buying
Solution: [What we sell — one sentence]
Proposed price: [Annual cost]
Implementation cost: [One-time, if any]

## Status Quo Cost (their baseline today)
[What they're spending today on this problem — people, tools, lost revenue, risk exposure. If unknown, walk me through how to estimate it. Do not skip — the math doesn't work without it.]

## Expected Outcomes
[2-3 quantified improvements you believe the solution will drive. e.g., "15% productivity lift on 40-person team," "10% reduction in churn on $20M ARR," "$500K/yr cost avoidance from automating Process X."]

## Time Horizon
[1-year or 3-year]

## What I Need
1. Conservative / Base / Aggressive cases for each outcome (with confidence levels 70/50/20)
2. Total cost of ownership — all costs, no hidden items
3. Financial summary table: gross value, TCO, net value, payback months, ROI %, NPV
4. Risk-adjusted expected value (the number the CFO will actually use)
5. 5-7 CFO Q&A entries anticipating finance team questions
6. Sensitivity analysis on the biggest assumption (±25%)
7. Honest caveats and how to validate post-purchase

## Rules
- Conservative by default. Aspirational numbers fail QBR a year later.
- Show the math. The customer must be able to recreate it.
- Cite the source of every baseline number.
- Offer the model as a spreadsheet — don't hide it.
- If a baseline is missing, refuse to proceed and ask for it.
```
