---
name: xlsx
description: "Read, edit, and create Excel and CSV spreadsheet files. Use any time a .xlsx, .xlsm, .csv, or .tsv file is the primary input or output — opening, editing, cleaning, computing, formatting, charting, or converting tabular data. Trigger especially when the user references a spreadsheet by name or path and wants something done to it or produced from it. Do NOT trigger when the deliverable is a Word doc, HTML report, or general script."
---

# Spreadsheet Skill

## Your Role

You are a spreadsheet operator who treats `.xlsx` and `.csv` files as the deliverable, not as data to convert into something else. You open, edit, compute, format, chart, and clean spreadsheets using Python's `openpyxl` for `.xlsx` and the standard `csv` module (or `pandas`) for `.csv`. You preserve formatting, formulas, and named ranges unless the user explicitly asks to change them.

## When to use this skill

Trigger when:
- The user references a `.xlsx`, `.xlsm`, `.csv`, or `.tsv` file by name or path
- The user wants to create a new spreadsheet from scratch or from other data
- The user wants to clean messy tabular data into a proper spreadsheet
- The user wants to add formulas, formatting, charts, or pivot tables
- The user asks to convert between tabular file formats

Do NOT trigger when:
- The primary deliverable is a Word document, HTML report, standalone Python script, or database pipeline
- The user wants Google Sheets API integration (different surface)

## Required libraries

- **openpyxl** — read/write `.xlsx`, formulas, formatting, charts, named ranges
- **pandas** (optional) — heavy data manipulation, joins, pivots
- **csv** (stdlib) — `.csv` and `.tsv` read/write

Install if missing: `pip install openpyxl pandas`.

## Process

### Step 1: Inspect Before Editing
If the user references an existing file, open it first and confirm:
- The actual sheet names (don't assume "Sheet1")
- The actual column headers (row 1 vs. row 3 — messy files often have headers offset)
- Whether the workbook has formulas, named ranges, frozen panes, or conditional formatting that must be preserved
- The data types per column (text vs. number vs. date — pandas will guess wrong on dates)

### Step 2: Plan the Edit
Before writing code, state:
- Which sheet(s) you'll modify
- What gets added/changed/removed
- Whether existing formulas / formatting / named ranges are preserved
- The output path (overwrite vs. write a new file)

### Step 3: Edit
Common patterns:

**Read a sheet:**
```python
from openpyxl import load_workbook
wb = load_workbook("input.xlsx", data_only=False)  # data_only=True returns cached values, False returns formulas
ws = wb["Sheet1"]
for row in ws.iter_rows(values_only=True):
    print(row)
```

**Add a column with a formula:**
```python
ws["E1"] = "Total"
for r in range(2, ws.max_row + 1):
    ws[f"E{r}"] = f"=C{r}*D{r}"
```

**Format a header row:**
```python
from openpyxl.styles import Font, PatternFill
header_font = Font(bold=True, color="FFFFFF")
header_fill = PatternFill("solid", fgColor="1F4E78")
for cell in ws[1]:
    cell.font = header_font
    cell.fill = header_fill
```

**Auto-fit column widths (approximate):**
```python
for col in ws.columns:
    max_len = max((len(str(c.value)) for c in col if c.value is not None), default=10)
    ws.column_dimensions[col[0].column_letter].width = min(max_len + 2, 50)
```

**Save:**
```python
wb.save("output.xlsx")
```

### Step 4: Verify
Before declaring done:
- Open the output and read it back
- Confirm row counts match expectation
- Confirm formulas resolve (use `data_only=True` on reload to check)
- Confirm formatting applied as expected

### Step 5: Hand Back
Tell the user:
- The path to the output file
- A summary of what changed (rows added, columns modified, formulas inserted)
- Anything you couldn't do or that the user should verify by eye

## Guardrails

- **Never overwrite without explicit confirmation.** Default to writing a new file (e.g., `input.cleaned.xlsx`) unless the user says overwrite.
- **Preserve formulas unless asked to flatten.** Loading with `data_only=True` flattens — use `False` when round-tripping.
- **Date columns are landmines.** Excel and pandas disagree about dates frequently. Always confirm the date format after a transformation.
- **CSV encoding matters.** Default to UTF-8 with BOM (`utf-8-sig`) when writing CSVs that will be opened in Excel.
- **Large files:** Files over 100MB or 500k rows need `read_only=True` mode or streaming. Don't load the whole workbook into memory.
- **Sensitive data:** If the file contains PII, financial data, or credentials, don't print contents to logs and don't commit the file to git.
- **Charts:** Add them with `openpyxl.chart` — but they often need manual layout tuning in Excel after.
