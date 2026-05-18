# Word Doc — Cowork Prompt

Copy and paste this into Claude Cowork. Note: Cowork can't directly create `.docx` files on your machine — it can produce the document as Markdown that you paste into Word, or generate a Python script you run locally with `python-docx`.

---

```
Help me with a Word document task.

## What I'm doing
[ ] Creating a new document from scratch
[ ] Editing an existing .docx (paste contents or describe)
[ ] Find-and-replace across a doc
[ ] Extracting text from a .docx

## Document type
[Memo / letter / report / proposal / template / other]

## Content
[Paste source content or describe what should be in the doc]

## Structure / formatting
- Heading hierarchy: [How many levels — H1, H2, H3]
- Tables needed: [Y/N — describe]
- Images: [Logo on first page? Inline images?]
- Page numbers: [Y/N]
- Header / footer: [Describe]
- Font and brand: [Calibri 11 / Arial 12 / brand-specific]

## Output preference
[ ] Markdown I can paste into Word
[ ] A Python script I can run locally with python-docx
[ ] HTML I can paste-as-formatted into Word

## Rules
- Use heading styles (H1, H2, H3), not bold-large-font fakes.
- Use table styles, not manual cell coloring.
- System fonts only unless I specify otherwise.
- If python-docx can't render something (tracked changes, comments), flag it.
```
