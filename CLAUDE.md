# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands

Compile the thesis (run twice to update TOC, bookmarks, and cross-references):

```bash
/Library/TeX/texbin/xelatex -synctex=1 -interaction=nonstopmode -file-line-error hzu.tex
/Library/TeX/texbin/xelatex -synctex=1 -interaction=nonstopmode -file-line-error hzu.tex
```

If the editor reports `spawn xelatex ENOENT`, configure the LaTeX tool to use the absolute path `/Library/TeX/texbin/xelatex`.

## Project Structure

| File/Dir | Purpose |
|---|---|
| `hzu.tex` | Main thesis source — the only file to edit |
| `thesis-cls-Miya.cls` | Custom HZU thesis document class — do not modify |
| `bibHzu.bib` | BibTeX bibliography database |
| `BibTeX-style-hzu.bst` | Bibliography style file |
| `MyText/*.md` | Draft chapter content in Markdown (source material, not compiled) |
| `myText.md` | Draft chapter 7 content |
| `*.png / *.jpg` | Figures referenced in the thesis |
| `*.ttf / *.ttc` | Chinese fonts required by the document class |

## Thesis Overview

This is an undergraduate thesis (毕设) for HZU (惠州学院) by 罗泽鑫. The topic is a fashion creativity sharing platform integrating 3D customization (Three.js) and AI virtual fitting. The thesis uses the `thesis-cls-Miya` document class with XeLaTeX.

Chapter structure in `hzu.tex`:
1. 绪论 (Introduction)
2. 开发框架及技术 (Tech stack: Vue3/Nuxt3/Three.js frontend, Go/Gin/Redis backend)
3. 需求分析 (Requirements analysis)
4. 系统设计 (System design)
5. 系统实现 (Implementation)
6. 系统测试 (Testing)
7. 总结与展望 (Conclusion)

## Editing Conventions

- **Do not** change `\documentclass`, template macros (`\title`, `\author`, etc.), or `\frontmatter`/`\mainmatter` structure.
- Enumerated items use `\begin{enumerate}[label=(\arabic*)]` style.
- Chinese quotes use full-width `""` style.
- English abbreviations (Web3D, AIGC, AI, Three.js, ControlNet) are kept as-is.
- Do not introduce new packages unless already used in the document.

### Tables

- Standard tables: `table` + `tabular`/`tabularx` with `\renewcommand{\arraystretch}{1.25}` and `\setlength{\tabcolsep}{0.2ex}`.
- Column type for auto-wrap: `>{\raggedright\arraybackslash}p{...}` or `>{\raggedright\arraybackslash}X`.
- Wrap headers with `\mbox{...}` to prevent line breaks.
- Add `@{}` on both ends of `tabular` column spec to eliminate side padding.
- Multi-page tables: use `longtable` environment with 续表 header repeated via `\endhead`.
- URLs/long identifiers in cells: use `\seqsplit{...}` or `\_\allowbreak`.

### Figures

Figures use `[H]` placement (requires `float` package, already loaded):
```tex
\begin{figure}[H]
  \centering
  \includegraphics[width=0.85\textwidth]{filename.png}
  \caption{Caption text}
  \label{fig:label}
\end{figure}
```