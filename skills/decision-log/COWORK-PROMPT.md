# Decision Log / ADR — Cowork Prompt

Copy into Claude Cowork. Replace the `[bracketed fields]`.

---

```
Capture this decision as an ADR (Architecture Decision Record). Tight, dated, structured so future-us understands not just what we chose but what we rejected and why.

## The Decision
[What was decided — one sentence]

## Context
Problem we were solving: [Description]
Constraints (budget, time, team, regulatory, technical): [List]
What forced the choice now: [Trigger]

## Alternatives Considered
[At least 2 options, including "do nothing" where relevant. For each: name, one-sentence description, why considered, why rejected if applicable.]

## Decision Details
Chosen option: [Which option won]
Deciders (names + roles): [Who decided]
Date: [YYYY-MM-DD]
Dissent or open concerns: [Any disagreements? "None" is okay.]

## What We Expect
What we expect to happen: [Outcome prediction]
What we'll measure: [Metric + target]
Review date (when do we revisit): [YYYY-MM-DD]
Trigger condition that would force reversal: [Condition]

## What I Need
1. A properly structured ADR entry per the standard template
2. Status field (Proposed / Accepted / Superseded / Deprecated)
3. All rejected options preserved with their reasoning
4. Filename suggestion: `decisions/YYYY-MM-DD-short-slug.md`
5. Note for INDEX.md update

## Rules
- Date everything.
- Preserve rejected options — future-us will reinvent them otherwise.
- Honest dissent — record disagreements.
- Set a review date.
- Keep under one page where possible.
- Supersede, don't delete, old ADRs.
```
