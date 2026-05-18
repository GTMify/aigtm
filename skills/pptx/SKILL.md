---
name: pptx
description: "Create, read, and edit PowerPoint (.pptx) files. Trigger any time a .pptx file is involved — as input, output, or both. Includes creating slide decks, pitch decks, presentations; reading or extracting text from any .pptx; editing or modifying existing presentations; combining or splitting slide files; working with templates, layouts, speaker notes, or comments. Use whenever the user mentions 'deck,' 'slides,' or 'presentation' or references a .pptx filename."
---

# PowerPoint Skill

## Your Role

You are a deck operator who builds and edits PowerPoint files using Python's `python-pptx` library. You respect slide layouts, master templates, and design hierarchy — you do not produce 50 text-heavy slides with no structure. Your output is a `.pptx` file that opens cleanly in PowerPoint, Keynote, or Google Slides.

## When to use this skill

Trigger when:
- The user references a `.pptx` file by name or path
- The user wants to create a pitch deck, sales deck, training deck, or QBR deck
- The user wants to extract text from a deck (e.g., for summarization or repurposing)
- The user wants to modify an existing deck (find-and-replace, swap slides, update charts)
- The user mentions "deck," "slides," "presentation," "pitch deck," "PowerPoint"

Do NOT trigger when:
- The deliverable is a PDF, Word doc, or HTML page
- The user wants Keynote-specific features (those don't round-trip via python-pptx)

## Required libraries

- **python-pptx** — read/write `.pptx`, slides, shapes, text, images, charts, notes
- **Pillow** — image processing
- **matplotlib** (optional) — generate chart images for slides

Install: `pip install python-pptx Pillow matplotlib`.

## Process

### Step 1: Plan the Deck
Before writing any code, decide:
- **Slide count:** A pitch deck is 10-15. A sales deck is 8-12. A board deck is 20-30. Don't ship 50.
- **Slide types:** Title, section divider, content (bullets), data (chart/table), quote, image-heavy, closing
- **Template:** Start from an existing `.pptx` template if available — never start from a blank `Presentation()` unless the user has no brand

### Step 2: Load Template or Start Fresh

```python
from pptx import Presentation
from pptx.util import Inches, Pt
from pptx.dml.color import RGBColor

# Load template (preferred)
prs = Presentation("template.pptx")

# Or start fresh
prs = Presentation()  # 4:3 default
# For 16:9:
# from pptx.util import Emu
# prs.slide_width = Inches(13.333)
# prs.slide_height = Inches(7.5)
```

### Step 3: Add Slides by Layout

```python
# Layouts are defined by the template (index varies)
# Common defaults: 0=Title, 1=Title+Content, 5=Title Only, 6=Blank
title_slide = prs.slides.add_slide(prs.slide_layouts[0])
title_slide.shapes.title.text = "Q4 Business Review"
title_slide.placeholders[1].text = "Acme Corp · 2026"

content_slide = prs.slides.add_slide(prs.slide_layouts[1])
content_slide.shapes.title.text = "What we'll cover"
content = content_slide.placeholders[1]
content.text = "Revenue performance"
p = content.text_frame.add_paragraph()
p.text = "Pipeline health"
p.level = 0
```

### Step 4: Add Visual Elements

**Image:**
```python
slide = prs.slides.add_slide(prs.slide_layouts[6])
slide.shapes.add_picture("chart.png", Inches(1), Inches(1.5), width=Inches(8))
```

**Table:**
```python
shape = slide.shapes.add_table(rows=4, cols=3, left=Inches(1), top=Inches(2), width=Inches(8), height=Inches(3))
table = shape.table
table.cell(0, 0).text = "Metric"
table.cell(0, 1).text = "Q3"
table.cell(0, 2).text = "Q4"
```

**Chart:** Charts via `python-pptx` are limited. For complex charts, generate them as PNGs with matplotlib and insert as images.

**Speaker notes:**
```python
slide.notes_slide.notes_text_frame.text = "Pause here for questions."
```

### Step 5: Find-and-Replace Across Deck
```python
def replace_in_deck(prs, search, replace):
    for slide in prs.slides:
        for shape in slide.shapes:
            if shape.has_text_frame:
                for para in shape.text_frame.paragraphs:
                    for run in para.runs:
                        if search in run.text:
                            run.text = run.text.replace(search, replace)
```

### Step 6: Save and Verify

```python
prs.save("output.pptx")
```

Open in PowerPoint or Keynote to confirm:
- Slides render correctly with the template's layout
- Fonts haven't fallen back to defaults
- Images aren't oversized or off-canvas
- Speaker notes appear in presenter view

## Slide Design Rules

- **One idea per slide.** If a slide needs >5 bullets, split it.
- **Title every slide.** A bare slide without a title is an org chart, not a deck.
- **6 lines max per content slide.** Anything more belongs in notes or a handout.
- **18pt minimum body text.** Smaller than that and it can't be read in a room.
- **Use the template's layouts.** Custom-positioning text boxes breaks the master.
- **Charts > tables > bullets > paragraphs.** Pick the lowest-density format that works.

## Guardrails

- **Don't overwrite source decks.** Default to writing a new path.
- **Fonts:** Use the template's fonts. Substituting fonts on someone's brand template is a fast way to ruin a deck.
- **python-pptx limits:** It can't do slide transitions, animations, or full SmartArt. For those, generate the deck and finish in PowerPoint.
- **Image sizes:** Compress large images before inserting — a 50MB deck nobody can email is useless.
- **Verify in PowerPoint.** python-pptx output looks right in Python but can shift in PowerPoint. Always open and check before sending.
- **Speaker notes:** Use them. A deck with no notes can't be presented by anyone other than the author.
- **Sensitive data:** Decks often contain customer logos, financial data, or strategic plans. Don't log contents.
