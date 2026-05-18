# PowerPoint Skill (pptx)

Reads, edits, and creates `.pptx` files using `python-pptx`.

## What it does

- Creates pitch, sales, QBR, board, training, and launch decks
- Loads existing templates and modifies them while preserving the master
- Performs find-and-replace across all slides
- Inserts images, tables, basic charts, and speaker notes
- Extracts text from existing decks (useful for repurposing into other formats)

## Required libraries

```bash
pip install python-pptx Pillow matplotlib
```

## How to use

**Claude Code:** Copy this folder to `~/.claude/skills/pptx/` and ask Claude to "build a pitch deck" or "edit Q4-review.pptx."

**Cowork:** Cowork can't write `.pptx` files directly. Use the prompt in `COWORK-PROMPT.md` to either receive a slide outline you paste into PowerPoint or generate a Python script you run locally.

## Limitations

`python-pptx` cannot produce:
- Slide transitions and animations
- Full SmartArt (use static images instead)
- Embedded PowerPoint charts with live data (use matplotlib PNGs)

For those, generate the deck and finish manually in PowerPoint or Keynote.

## Customization ideas

- Set your brand template path so all generated decks inherit your master slides
- Add a chart-style template (matplotlib rcParams) so chart PNGs match your brand
- Add standard closing slides (thank you, contact, Q&A) so they auto-append
- Pair with the `one-pager` or `qbr-builder` skill to convert long-form docs into slides
