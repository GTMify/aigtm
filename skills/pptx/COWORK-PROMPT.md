# PowerPoint Deck — Cowork Prompt

Copy and paste this into Claude Cowork. Note: Cowork can't directly create `.pptx` files on your machine. It can outline the deck slide-by-slide as Markdown you paste into PowerPoint or Google Slides, or generate a Python script with python-pptx that you run locally.

---

```
Help me with a PowerPoint deck.

## What I'm doing
[ ] Creating a new deck from scratch
[ ] Editing an existing .pptx (paste outline below)
[ ] Find-and-replace across a deck
[ ] Extracting text from a deck

## Deck type and length
Type: [Pitch / sales / QBR / board / training / launch]
Slide count: [10-30 — be specific]

## Content
[Paste outline, source notes, transcript, or describe what should be in the deck]

## Brand and template
Template path (if I have one): [Path to .pptx template]
Brand colors: [Hex codes]
Font: [Family]
Aspect ratio: [4:3 / 16:9]

## Output preference
[ ] Slide-by-slide outline in Markdown I can paste into PowerPoint
[ ] A Python script using python-pptx I run locally
[ ] Speaker notes for each slide

## Rules
- One idea per slide. Max 6 lines per content slide.
- 18pt minimum body text. No font smaller than that.
- Title every slide.
- Charts > tables > bullets > paragraphs — pick the lowest density that works.
- Use the template's layouts; don't custom-position text boxes.
- Speaker notes on every slide.
```
