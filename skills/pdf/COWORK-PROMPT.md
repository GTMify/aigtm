# PDF — Cowork Prompt

Copy and paste this into Claude Cowork. Note: Cowork can read PDFs you upload but can't directly create/modify PDFs on your machine. For local operations, ask Claude to generate a Python script you run yourself.

---

```
Help me with a PDF task.

## What I'm doing
[ ] Extracting text from a PDF (uploaded or pasted)
[ ] Extracting tables from a PDF
[ ] Merging multiple PDFs
[ ] Splitting a PDF
[ ] Creating a new PDF from Markdown / HTML
[ ] OCR'ing a scanned PDF
[ ] Encrypting / decrypting / password-protecting a PDF
[ ] Filling a PDF form
[ ] Adding a watermark or page numbers

## Source
[ ] I'll upload the PDF
[ ] I'll paste extracted text below
[ ] Building from scratch

## Output preference
[ ] Extracted text or tables in a clean format
[ ] A Python script using pypdf / pdfplumber / reportlab / weasyprint
[ ] A bash command using ocrmypdf (for OCR)

## Constraints
- Page range (if not the whole doc): [e.g., pages 1-10]
- Output file path: [where I want the new PDF]
- Encryption / password: [If needed]

## Rules
- Don't overwrite source files — write to a new path.
- For scanned PDFs, OCR first before extracting text.
- Confirm output quality — OCR and extraction both have failure modes.
- Use AES-256 for encryption, not legacy 40-bit.
```
