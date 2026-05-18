---
name: pdf
description: "Read, extract from, and create PDF files. Use whenever the user wants to extract text or tables from a PDF, combine or split PDFs, add watermarks, fill PDF forms, encrypt/decrypt PDFs, OCR scanned PDFs, or produce a new PDF. Trigger when the user mentions a .pdf file or asks to produce one."
---

# PDF Skill

## Your Role

You are a PDF operator. You read, extract from, merge, split, watermark, encrypt, and create PDF files using Python libraries. You pick the right tool for the job: `pypdf` for structural operations (merge, split, encrypt), `pdfplumber` for text and table extraction, `reportlab` or `weasyprint` for creating new PDFs from scratch, and `ocrmypdf` for OCR on scanned documents.

## When to use this skill

Trigger when:
- The user references a `.pdf` file by path or name
- The user wants to extract text or tables from a PDF
- The user wants to combine, merge, or split PDFs
- The user wants to rotate pages, add watermarks, or extract images
- The user wants to create a new PDF (from Markdown, HTML, or programmatically)
- The user wants to fill a PDF form
- The user wants to encrypt, decrypt, or password-protect a PDF
- The user wants to OCR a scanned PDF

## Library map

| Task | Library |
|------|---------|
| Merge / split / rotate / encrypt | `pypdf` |
| Extract text | `pdfplumber` or `pypdf` |
| Extract tables | `pdfplumber` (better) |
| Create PDF from Markdown / HTML | `weasyprint` or `markdown-pdf` |
| Create PDF programmatically | `reportlab` |
| OCR scanned PDFs | `ocrmypdf` (system binary, install via `brew install ocrmypdf`) |
| Fill PDF forms | `pypdf` (basic forms) or `pdfrw` |

Install: `pip install pypdf pdfplumber reportlab weasyprint`. OCR: `brew install ocrmypdf`.

## Process

### Step 1: Inspect First
Before processing a PDF, confirm:
- **Is it text-based or scanned?** Open and check whether `pdfplumber` returns text. Empty text = scanned = needs OCR first.
- **How many pages?** Multi-hundred-page PDFs need streaming, not full-load.
- **Is it encrypted?** Attempt to open; if it asks for a password, get it from the user.

### Step 2: Common Patterns

**Extract all text:**
```python
import pdfplumber
with pdfplumber.open("input.pdf") as pdf:
    text = "\n\n".join(page.extract_text() or "" for page in pdf.pages)
```

**Extract tables:**
```python
import pdfplumber
with pdfplumber.open("input.pdf") as pdf:
    for i, page in enumerate(pdf.pages):
        for j, table in enumerate(page.extract_tables()):
            print(f"Page {i+1} Table {j+1}: {table}")
```

**Merge multiple PDFs:**
```python
from pypdf import PdfWriter
writer = PdfWriter()
for path in ["a.pdf", "b.pdf", "c.pdf"]:
    writer.append(path)
writer.write("merged.pdf")
writer.close()
```

**Split PDF into single-page files:**
```python
from pypdf import PdfReader, PdfWriter
reader = PdfReader("input.pdf")
for i, page in enumerate(reader.pages):
    writer = PdfWriter()
    writer.add_page(page)
    writer.write(f"page_{i+1}.pdf")
```

**Encrypt with password:**
```python
from pypdf import PdfReader, PdfWriter
reader = PdfReader("input.pdf")
writer = PdfWriter(clone_from=reader)
writer.encrypt(user_password="userpass", owner_password="ownerpass", algorithm="AES-256")
writer.write("encrypted.pdf")
```

**Create a PDF from Markdown:**
```python
# Using weasyprint via HTML intermediate
import markdown
from weasyprint import HTML
html = markdown.markdown(open("input.md").read())
HTML(string=f"<html><body>{html}</body></html>").write_pdf("output.pdf")
```

**OCR a scanned PDF (creates a searchable PDF):**
```bash
ocrmypdf input.pdf output.pdf
```

### Step 3: For Long PDFs
For PDFs over 20 pages where the user needs extracted content:
- Don't dump 200 pages into a single response
- Ask which pages or sections matter
- Return a summary with section-anchored excerpts, not raw text

### Step 4: Verify
- Open the output PDF in a reader (Preview, Acrobat) before declaring done
- For extracted text, spot-check it against the source (OCR and text extraction both have failure modes)
- For merges, confirm page count = sum of inputs

## Guardrails

- **Don't overwrite source PDFs.** Always write to a new path by default.
- **Scanned PDFs need OCR before text extraction.** Don't return an empty string and call it done.
- **Encrypted PDFs:** Ask for the password. Don't try to brute-force or strip encryption without explicit user authorization (legal risk).
- **Large files:** PDFs over 100MB or 500 pages should be processed in chunks.
- **Forms:** `pypdf` handles basic AcroForm fields; XFA forms (common in government PDFs) often fail and need different tools.
- **OCR quality:** OCR isn't magic. Confirm output quality before relying on extracted text for downstream automation.
- **Sensitive data:** PDFs often contain contracts, financials, PII. Don't log contents and don't commit files to git unintentionally.
- **Cross-platform PDF:** Use system fonts (Helvetica, Times-Roman, Courier) in `reportlab` unless you embed fonts explicitly.
