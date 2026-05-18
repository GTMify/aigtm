# Spreadsheet Skill (xlsx / csv)

Reads, edits, and creates `.xlsx`, `.xlsm`, `.csv`, and `.tsv` files using `openpyxl` and `pandas`.

## What it does

- Opens existing spreadsheets and preserves formulas, formatting, and named ranges
- Cleans messy tabular data into proper spreadsheets
- Adds columns, formulas, formatting, charts, and pivot tables
- Converts between tabular formats (csv ↔ xlsx ↔ tsv)
- Handles large files via streaming when needed

## Required libraries

```bash
pip install openpyxl pandas
```

## How to use

**Claude Code:** Copy this folder to `~/.claude/skills/xlsx/` and ask Claude to "clean up data.xlsx" or "build a spreadsheet from this list."

**Cowork:** Cowork can't directly edit files on your machine. Use the prompt in `COWORK-PROMPT.md` to either paste data inline or generate a Python script you can run locally.

## Customization ideas

- Add your house style for header formatting (color, font, freeze row 1)
- Add CSV defaults (delimiter, encoding, quoting) for your typical import sources
- Add chart templates that match your brand
