# Word Document Skill (docx)

Reads, edits, and creates `.docx` files using `python-docx`.

## What it does

- Creates Word documents from scratch (memos, letters, reports, proposals, templates)
- Loads templates and modifies them
- Performs find-and-replace across paragraphs and tables
- Inserts and replaces images
- Adds page numbers, headers, footers, and table-of-contents-ready heading hierarchies
- Extracts text from existing `.docx` files

## Required libraries

```bash
pip install python-docx Pillow
```

## How to use

**Claude Code:** Copy this folder to `~/.claude/skills/docx/` and ask Claude to "create a memo" or "edit proposal.docx."

**Cowork:** Cowork can't write `.docx` files directly. Use the prompt in `COWORK-PROMPT.md` to either receive Markdown you paste into Word or generate a Python script you run locally.

## Limitations

`python-docx` cannot produce:
- Tracked changes
- Comments
- Complex page layouts (multi-column with images flowing around them)
- Embedded charts (use a generated PNG instead)

For those, generate the doc and finish manually in Word.

## Customization ideas

- Add your letterhead template path so docs auto-include the branded header
- Add your default font and color scheme so output matches your style guide
- Add standard footer text (confidentiality notice, address) so it's appended automatically
