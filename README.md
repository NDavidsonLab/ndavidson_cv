# Natalie Davidson CV

This repository contains the LaTeX source for Natalie R. Davidson's academic CV.

## Structure

- `cv.tex` — main document; also where section toggles and section order live
- `preamble.tex` — packages, spacing, colors, and document formatting
- `macros.tex` — reusable commands for section headers, entries, and hyperlinks
- `sections/` — modular content files, one per CV section
- `publications.bib` — publication records (biblatex/biber)

## Build

Requires `latexmk` + `pdflatex` + `biber` (for the bibliography).

```
make        # builds cv.pdf
make clean  # removes build artifacts
```

## Editing content

Each section lives in its own file under `sections/`. Open the relevant file
and edit directly — no need to touch `cv.tex` unless you're adding/removing
a whole section or reordering things.

To add a new entry, use the existing macros in `macros.tex` rather than
hand-formatting (keeps spacing/style consistent):

- `\grant{title}{dates}{role}{amount}{description}` — funding entries
- `\talk{title}{date}{venue}{description}` — invited talks
- `\mentee{name}{role/dates}{line}{note}` — mentees
- `\software{name}{description}{links}` — software/tools

## Adding a publication

Add the entry to `publications.bib` with `keywords={mypub}` (or append
`,mypub` to an existing `keywords` field). Only entries tagged `mypub` are
shown in the Publications section — this keeps citations you reference
elsewhere (e.g. in Software) out of the main list unless you want them there
too. Your name is bolded automatically wherever it appears in an author list
(see `\cvboldifmine` in `preamble.tex`); for consortium papers where you're
a named member but the exported author list was truncated with "and
others," pull the full/accurate author list from the primary source (the
journal, bioRxiv, PubMed, or a per-paper Scholar citation) rather than a
bulk Scholar export, which tends to truncate long lists.

## Turning sections on/off

`cv.tex` defines a toggle for each optional section:

```latex
\toggletrue{showPublications}
\toggletrue{showFunding}
\toggletrue{showTalks}
\toggletrue{showMentoring}
\toggletrue{showTeachingService}
\toggletrue{showProfessional}
```

Change `\toggletrue{...}` to `\togglefalse{...}` to exclude that section from
the build — no need to comment out `\input` lines or delete content. This is
useful for making a shorter CV for a specific application while keeping the
full source intact.

The frontmatter (name, appointments, education, honors) is always included
and is not toggled, since it's core to every version of the CV.
