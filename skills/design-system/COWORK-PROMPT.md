# Design System — Cowork Prompt

Paste this whole block into Claude Cowork. Fill in the bracketed fields. Submit. Cowork will reply with a customized design-system HTML file you can save and open in any browser.

```text
I want you to build me a brand-customized, single-file HTML design system. You'll act as a senior brand designer who has stood up design systems for 30+ product and revenue teams. You build with primitives — color, type, spacing, radius, shadow. You ship one file every team can open in a browser, share, and fork.

CONTEXT — what you're building on top of:

The starting template is a self-contained HTML file with a sticky sidebar TOC; a color palette section (12 swatches: brand, neutrals, semantic); typography ramps (H1 → mono, 8 ramps); buttons (primary / secondary / ghost in 3 sizes); cards; badges; forms; navigation; and a composed page preview at the bottom. Every brand decision lives in CSS variables in :root at the top of the file. Fetch the template here:

https://raw.githubusercontent.com/GTMify/aigtm/main/skills/design-system/template.html

MY BRAND ANSWERS (fill these in):

- Brand name: [Your company name — replaces [Your Brand] throughout the file]
- Tagline: [One short sentence — goes under the brand name on the cover]
- Primary color: [Hex code — dominant CTA / accent on most surfaces]
- Accent color: [Hex code — secondary highlight that complements the primary]
- Heading font: [A Google Font name — e.g., Fraunces, Playfair Display, Space Grotesk, Inter, IBM Plex Sans]
- Body font: [A Google Font name — often the same family different weight, or a clean sans]
- Brand voice: [One line — "authoritative + warm", "playful + direct", "operator + technical", etc.]

WHAT TO DO:

1. Read the template at the URL above. Do not change the HTML structure (sections, classes, layout). Brand variables only.

2. Derive the rest of the palette from my primary and accent:
   - --color-primary-dark — darken primary ~15% (hover state)
   - --color-primary-light — lighten primary ~25% (tint / chip background)
   - --color-bg — neutral that pairs with the primary (default #FAFAF7)
   - --color-ink — near-black (#1A1A1A)
   - --color-ink-muted — #5C5C5C
   - --color-neutral — #E5E2DC or a neutral matching the bg
   - --color-dark — #0F1419 for dark sections

3. Apply these transformations to the template:
   - Search-and-replace [Your Brand] with my brand name (preserve my exact capitalization)
   - Update <title> to "[My brand name] — Design System"
   - Replace the cover tagline with mine
   - Update CSS variables in :root with my colors (derived ones from step 2 for what I didn't provide)
   - Swap the Google Fonts <link> URL to load my chosen heading + body fonts
   - Update --font-heading and --font-body in :root
   - Update the HOW TO USE comment block at the top to credit my brand

4. Output the entire customized HTML file as a single fenced code block (language hint: html). Above the block, give me a short cover paragraph (≤3 sentences) summarizing what you customized — brand name, color thesis, type thesis.

CONSTRAINTS:

- No dependencies beyond Google Fonts. Single file. No build step.
- Don't fabricate brand colors I didn't give you. Derive only.
- Don't include a logo unless I provide a URL.
- Final file must stay under 800 lines.
- If my primary color fails WCAG AA contrast on white (text contrast < 4.5:1), note it once in the cover paragraph and proceed anyway.
- If my fonts aren't on Google Fonts, ask once for a Google Fonts alternative.

OUTPUT SPEC:

1. Cover paragraph (≤3 sentences) — what changed.
2. Single fenced `html` code block — the complete customized template, ready to save as `.html`.

That's it. After you reply, I'll save the block as <my-brand-name>-design-system.html, open it in any browser, and that's my live design system.
```

## After Cowork replies

1. Click into the `html` code block and copy.
2. Save as `<your-brand-name>-design-system.html` (lowercase, hyphens).
3. Open the file in any browser — that's your design system.
4. To revise: edit the CSS variables in `:root` at the top of the file.
5. To share: drop on any static host (Vercel, Netlify, GitHub Pages) or PDF-print directly from the browser.

## How this works under the hood

This is a skill from the [aigtm](https://github.com/GTMify/aigtm) toolkit. The template lives at [`skills/design-system/template.html`](template.html) in the repo. The full SKILL.md (Claude Code version) is in the same folder — it does the same thing but reads the template directly from your filesystem instead of fetching it via URL.

Same Six-Layer Power Prompt Stack as every other skill in the repo. Layer 1 (Context) = your brand. Layer 6 (Output Spec) = a single fenced HTML block. The skill is the framework.
