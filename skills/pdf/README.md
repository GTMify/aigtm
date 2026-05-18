# PDF Skill

Reads, extracts from, and creates PDF files using `pypdf`, `pdfplumber`, `reportlab`, `weasyprint`, and `ocrmypdf`.

## What it does

- Extracts text and tables from PDFs (`pdfplumber`)
- Merges, splits, rotates, and encrypts PDFs (`pypdf`)
- Creates PDFs from Markdown or HTML (`weasyprint`)
- Generates PDFs programmatically (`reportlab`)
- OCRs scanned PDFs into searchable PDFs (`ocrmypdf`)
- Fills basic AcroForm fields

## Required libraries

```bash
pip install pypdf pdfplumber reportlab weasyprint markdown
brew install ocrmypdf  # macOS, for OCR
```

## How to use

**Claude Code:** Copy this folder to `~/.claude/skills/pdf/` and ask Claude to "extract tables from invoice.pdf" or "merge these three PDFs."

**Cowork:** Cowork can read PDFs you upload but can't write to your filesystem. Use the prompt in `COWORK-PROMPT.md` to either extract content or generate a script you run locally.

## Limitations

- XFA forms (common in government PDFs) often fail — those need different tools
- OCR quality depends on scan quality; always spot-check
- Heavy graphics-PDFs may not render perfectly via `weasyprint` — use `reportlab` for full control

## Customization ideas

- Add your standard letterhead PDF so generated PDFs can be merged with branding
- Add standard encryption settings for confidential docs (AES-256, owner-only print permissions)
- Add a Markdown-to-branded-PDF template using `weasyprint` with your CSS
