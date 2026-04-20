---
name: thu-forge
description: Forge a Quarto book dissertation (.qmd chapters) into a thuthesis-formatted PDF via XeLaTeX. Trigger when the user asks to compile, build, or render a Quarto-based Tsinghua thesis, or when troubleshooting LaTeX/BibTeX errors in such a project.
allowed-tools: Read Grep Glob Bash(bash *) Bash(python3 *) Bash(quarto *) Bash(xelatex *) Bash(bibtex *) Bash(grep *)
---

# thu-forge

`thu-forge` orchestrates the build pipeline that turns a [Quarto](https://quarto.org/) book (`.qmd` chapters) into a PDF typeset with the [thuthesis](https://github.com/tuna/thuthesis) LaTeX class. It handles chapter splitting, heading demotion, citation conversion, image path fixing, and BibTeX integration.

This skill is an **independent build orchestrator**. It does not bundle, modify, or redistribute `thuthesis`. Users must obtain the upstream `thuthesis` class from <https://github.com/tuna/thuthesis> themselves. This project is not affiliated with or endorsed by the thuthesis maintainers (TUNA).

## Pipeline

```
.qmd files → quarto render --to pdf → index.tex
           → split_quarto_tex_v2.py  → chap01–09.tex
           → XeLaTeX (×3) + BibTeX  → main.pdf
```

## Key Files

| File | Purpose |
|------|---------|
| `_quarto.yml` | Quarto config; must have `bibliography` and `cite-method: natbib` |
| `thuthesis/build.sh` | One-click full build (runs entire pipeline) |
| `thuthesis/recompile.sh` | XeLaTeX-only recompilation (3 passes + BibTeX) |
| `thuthesis/scripts/split_quarto_tex_v2.py` | Chapter splitting + heading demotion + cleanup |
| `thuthesis/scripts/consolidate_bibs.py` | Merge multiple `.bib` files into one |
| `thuthesis/thusetup.tex` | Template config (fonts, macros, preamble fixes) |
| `thuthesis/main.tex` | LaTeX main file (includes chapters, backmatter) |
| `references.bib` | Master bibliography file |

## Invocation

```
/thu-forge:compile
```

See [`commands/compile.md`](../../commands/compile.md) for the full step-by-step execution checklist.

## Reference Docs

- [`references/chapter-groups.md`](references/chapter-groups.md) — How to update `CHAPTER_GROUPS` when chapter structure changes
- [`references/pitfalls.md`](references/pitfalls.md) — Known pitfalls with diagnosis and fixes
