# Microsite / Personalized Landing Page — Cowork Prompt

Copy into Claude Cowork. Replace the `[bracketed fields]`.

---

```
Build me a personalized single-file HTML landing page for a target account. Self-contained — one .html file, inline CSS, no external dependencies, no build step. I'll drop it on Netlify or any static host.

## Target Account
Company: [Customer]
What they do: [One sentence]
Recent signal / trigger to reference: [Funding, hire, news, post — something specific]

## Buyer Persona
Title I'm addressing: [Title]

## My Offer
Solution / scope: [What I'm proposing]
Why now: [Specific reason the cost of waiting is real]

## Proof
[1-2 named or anonymized customers with quantified results]

## Single CTA
[Book a 15-min call / watch a 10-min video / download a doc — pick ONE]

## Branding
Primary color: [Hex, or "use a neutral blue"]
Font preference: [System fonts okay, or specify a Google Font]
Logo URL: [URL, or "use a placeholder monogram"]

## What I Need
1. One paragraph explaining the structural choices you made
2. A complete single-file HTML page with inline CSS — no external stylesheets, no JS frameworks
3. Sections: hero, why-this-page-for-you, proposal, proof, why-now, repeated CTA, footer
4. Mobile-responsive via media queries
5. Accessible (alt text, 4.5:1 contrast, focusable CTA button)
6. OG meta tags for link previews
7. Hosting notes — where to drop it

## Rules
- Single file. No build pipeline.
- No tracking by default.
- One CTA, repeated.
- Personalize for real — reference the specific signal, don't just swap in the company name.
- Mobile-first at 375px width.
```
