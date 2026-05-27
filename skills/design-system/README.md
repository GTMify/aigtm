# design-system

Build a brand-customized, single-file HTML design system from a working template — no build step, no dependencies beyond Google Fonts, one file your whole team can open in a browser.

## What this is

A skill that interviews you for the seven brand decisions that actually matter (name, tagline, primary, accent, heading font, body font, voice), then produces a self-contained `design-system.html` file you can save, share, and fork.

The template is at [`template.html`](template.html) in this folder. Open it in a browser to see what the output looks like before you customize.

## Three ways to use this

### 1. Claude Code

```bash
claude "use the design-system skill to build me one for my company"
```

Claude reads `template.html` from `~/.claude/skills/design-system/` (installed when you ran the aigtm bootstrap), interviews you, and writes the customized file to your current directory.

### 2. Cowork

Paste the contents of [`COWORK-PROMPT.md`](COWORK-PROMPT.md) into Claude Cowork. Fill in the bracketed fields. Cowork fetches the template via its raw GitHub URL and replies with the customized file.

### 3. Web form

Visit [aigtmschool2026q2.vercel.app/design-system](https://aigtmschool2026q2.vercel.app/design-system) — the takeaway page has an interactive form. Fill it in, click Download, the customized file is generated client-side and downloaded immediately. No Claude needed.

## What the template includes

| Section | Purpose |
|---|---|
| Cover | Brand title + tagline |
| Color palette | 12 swatches (brand, neutrals, semantic) with hex values |
| Typography | 8 type ramps from H1 → mono |
| Buttons | Primary / secondary / ghost, three sizes |
| Cards | 3-up feature grid |
| Badges | 5 status colors |
| Forms | Input / select / textarea with focus states |
| Navigation | Marketing top-nav pattern |
| Page preview | Hero + stats bar + testimonial composed from primitives |

## What customization actually changes

Every brand decision lives in CSS variables in `:root` at the top of the file. The skill modifies exactly seven things:

- `[Your Brand]` placeholder (replaced throughout)
- `<title>` tag
- Cover tagline
- `--color-primary` and `--color-accent` (you provide these)
- `--color-primary-dark` and `--color-primary-light` (derived from your primary)
- `--font-heading` and `--font-body` + the Google Fonts `<link>` URL
- The HOW TO USE comment block at the top

Everything else — the HTML structure, the component definitions, the spacing scale, the radius and shadow tokens — stays as-is. That's the point. The structure is the contract; the variables are the brand.

## Why a single-file design system

A design system is a single source of truth for how your brand looks on screen. Most companies maintain one in Figma (slow to share), Notion (no live components), or a Storybook (engineering-only). A single HTML file:

- Opens in any browser, on any OS, with no install
- PDF-prints to a sharable artifact in one click
- Lives in version control (treat it as code)
- Doubles as a working reference — copy the CSS for any component into your real app
- Is editable by anyone who knows enough HTML to find `:root`

When you outgrow it, port the variables into Tailwind config, CSS custom properties on your real app, or a proper Figma library. The single-file version was just to get you moving in the first 24 hours.

## How this fits the Six-Layer Power Prompt Stack

This skill is itself a Power Prompt — every layer is visible in [`SKILL.md`](SKILL.md):

| Layer | What it does here |
|---|---|
| 1. Context | Describes the template structure so Claude knows what it's building on |
| 2. Role | Senior brand designer with 30+ design systems shipped |
| 3. Task | One verb: build (interview → customize → output) |
| 4. Constraints | No structural HTML changes, no dependencies, under 800 lines, derive don't invent |
| 5. Examples | Two reference brand customizations (SEN-style + Pavilion-style) |
| 6. Output Spec | A cover paragraph + a single fenced `html` code block — that's it |

If you want to extend the template (new sections, dark mode, motion specs), edit `SKILL.md`'s Constraints layer to allow it and `template.html` to add the structure. Same six-layer pattern.

## License

MIT. Same as the rest of the [aigtm](https://github.com/GTMify/aigtm) toolkit. Pass it along.
