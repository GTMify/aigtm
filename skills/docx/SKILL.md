---
name: docx
description: "Create, read, and edit Microsoft Word (.docx) files. Use whenever the user wants to produce a Word document, extract text from a .docx, perform find-and-replace in a Word file, work with headings, tables, page numbers, or letterheads, insert/replace images, or convert content into a polished Word document. Do NOT use for PDFs, spreadsheets, or Google Docs."
---

# Word Document Skill

## Your Role

You are a document operator who produces polished Word documents that procurement teams, legal counsel, and executives accept without complaint. You use Python's `python-docx` library to create and edit `.docx` files. You respect Word conventions — proper headings, styles, tables, and page numbers — rather than generating a wall of plain text and calling it a Word doc.

## When to use this skill

Trigger when:
- The user references a `.docx` file by name or path
- The user wants to create a Word document (report, memo, letter, template, proposal)
- The user wants to read or extract content from a `.docx`
- The user wants find-and-replace in a Word file
- The user wants to insert or replace images, add tables, or work with headers/footers
- The user mentions "Word doc," "Word document," "letterhead," "memo," "template"

Do NOT trigger when:
- The deliverable is a PDF, spreadsheet, Google Doc, or HTML page
- The user wants tracked changes/comments and the situation requires full Microsoft Word feature parity (python-docx has limits here)

## Required libraries

- **python-docx** — read/write `.docx`, styles, headings, tables, images, headers/footers
- **docx2txt** (optional) — quick text extraction
- **Pillow** — if inserting images

Install if missing: `pip install python-docx Pillow`.

## Process

### Step 1: Understand the Target
Get from the user:
- **What document type?** Memo, letter, report, proposal, template
- **Length?** 1 page, 10 pages, longer
- **Sections?** Headings, ToC, page numbers, footers
- **Branding?** Logo on first page, header on each page, font family, color
- **Existing template?** If yes, load it and modify — don't start from scratch

### Step 2: Set Up Document Structure
Common pattern:

```python
from docx import Document
from docx.shared import Inches, Pt, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH

doc = Document()  # or Document("template.docx") to load a template

# Set default font
style = doc.styles["Normal"]
style.font.name = "Calibri"
style.font.size = Pt(11)

# Add a heading
doc.add_heading("Document Title", level=0)

# Add a paragraph
p = doc.add_paragraph("Body text here.")

# Add a table
table = doc.add_table(rows=3, cols=2)
table.style = "Light Grid Accent 1"
table.rows[0].cells[0].text = "Header A"
table.rows[0].cells[1].text = "Header B"

# Add an image
doc.add_picture("logo.png", width=Inches(2))

# Save
doc.save("output.docx")
```

### Step 3: Common Patterns

**Find-and-replace across the document:**
```python
def replace_in_paragraphs(doc, search, replace):
    for para in doc.paragraphs:
        if search in para.text:
            for run in para.runs:
                if search in run.text:
                    run.text = run.text.replace(search, replace)
    for table in doc.tables:
        for row in table.rows:
            for cell in row.cells:
                for para in cell.paragraphs:
                    if search in para.text:
                        for run in para.runs:
                            run.text = run.text.replace(search, replace)
```

**Page numbers in footer:**
```python
from docx.oxml.ns import qn
from docx.oxml import OxmlElement

section = doc.sections[0]
footer = section.footer
p = footer.paragraphs[0]
p.alignment = WD_ALIGN_PARAGRAPH.CENTER
# Insert page number field
run = p.add_run()
fldChar1 = OxmlElement("w:fldChar")
fldChar1.set(qn("w:fldCharType"), "begin")
instrText = OxmlElement("w:instrText")
instrText.text = "PAGE"
fldChar2 = OxmlElement("w:fldChar")
fldChar2.set(qn("w:fldCharType"), "end")
run._r.extend([fldChar1, instrText, fldChar2])
```

**Headings with proper hierarchy:**
- `doc.add_heading("...", level=0)` — title
- `level=1` — H1 / chapter
- `level=2` — H2 / section
- `level=3` — H3 / subsection

Use the hierarchy — Word's ToC and accessibility tools depend on it.

### Step 4: Verify
Before declaring done:
- Open the output in Word or Pages and confirm it renders correctly
- Check that headings show in the navigation pane
- Check that page numbers appear if added
- Check that images aren't oversized or distorted

### Step 5: Hand Back
Tell the user:
- The output path
- A summary of what's in the doc (pages, sections, tables, images)
- Anything python-docx couldn't render that the user may want to add manually in Word (e.g., complex page layouts, tracked changes, comments)

## Guardrails

- **Use heading styles, not bold-large-font fakes.** Heading hierarchy enables ToC, navigation, and accessibility.
- **Use table styles, not manual cell coloring.** Built-in styles (`Light Grid Accent 1` etc.) survive style updates.
- **Don't overwrite source files by default.** Write to a new path (e.g., `input.edited.docx`).
- **python-docx has limits:** It can't do tracked changes, comments, or complex page layouts. For those, hand back the doc and tell the user to finish manually.
- **Letterheads with first-page-different headers:** Set `section.different_first_page_header_footer = True`.
- **Fonts:** Use system fonts (Calibri, Arial, Helvetica, Times New Roman). Custom fonts may not render on the user's machine.
- **Sensitive data:** If the doc contains contracts, PII, or confidential terms, don't print contents to logs.
