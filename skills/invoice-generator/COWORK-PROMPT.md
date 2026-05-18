# Invoice Generator — Cowork Prompt

```
Generate a professional invoice for me as a self-contained HTML file I can open in any browser and print to PDF.

## My business
- Name: [Your Business]
- Address: [Address]
- Email / Phone: [Contact]
- EIN / Tax ID: [Optional]
- Payment methods: [Check to [name], ACH to [routing/acct], Stripe link, Venmo @handle, etc.]

## Bill to
- Customer name: [Name]
- Contact / Address: [Details]
- PO number: [Optional]

## Invoice details
- Invoice number: [Default: INV-YYYYMM-001]
- Date: [Default: today]
- Payment terms: [Net 15 / Net 30 / Due on receipt]
- Tax rate: [%, or 0]
- Late fee policy: [Default: 1.5%/month over 30 days late, or "none"]

## Line items
| Description | Qty | Unit | Unit Price |
|------------|-----|------|------------|
| [Item] | [N] | [hour/day/unit] | $[X] |

## What I need
1. A clean, self-contained HTML invoice (inline CSS) ready to print to PDF.
2. A short cover email I can paste into Gmail/Outlook.
3. The actual due date calculated and shown in bold — not just "Net 15."

## Rules
- Round to two decimals.
- Don't add a late fee unless I asked for one.
- Currency is USD unless I said otherwise.
- HTML must print cleanly on Letter size — no clipped totals.
```
