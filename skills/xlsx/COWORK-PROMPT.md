# Spreadsheet — Cowork Prompt

Copy and paste this into Claude Cowork. Replace the `[bracketed fields]` with your details. Note: Cowork can't directly edit files on your machine — paste the source data inline and Claude will produce the transformed output as text or generate a Python script you can run locally.

---

```
Help me with a spreadsheet task.

## What I'm starting with
[ ] An existing file at: [path]
[ ] Pasted data: [paste CSV or table below]
[ ] Building from scratch

## What I want
[Describe the transformation, formulas, formatting, chart, or output]

## Output preference
[ ] A new .xlsx file
[ ] A CSV
[ ] Cleaned/transformed data I can paste into my own sheet
[ ] A Python script I can run locally with openpyxl/pandas

## Constraints
- Sheet name(s) to use: [Name(s)]
- Columns to preserve: [List or "all"]
- Formatting requirements: [Bold headers, color, frozen panes, freeze row 1, etc.]
- Charts: [Type + data range if needed]

## Rules
- Preserve existing formulas unless I tell you to flatten them.
- UTF-8 with BOM for CSVs that will open in Excel.
- Don't overwrite my source file — write to a new path by default.
- Date columns are landmines — confirm the format after any transformation.
```
