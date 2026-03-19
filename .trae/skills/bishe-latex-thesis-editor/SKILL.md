---
name: "bishe-latex-thesis-editor"
description: "Edits this thesis LaTeX project while preserving structure and refreshing the TOC. Invoke when user asks to insert/replace thesis content or update the directory (目录)."
---

# 毕设论文 LaTeX 修改助手（结构/目录/内容解析）

## 目标

- 保证论文结构排版符合模板：章节层级、标题样式、列表/图表/公式环境尽量沿用项目现有写法
- 将用户发送的内容解析成可直接写入 `hzu.tex` 的 LaTeX 结构
- 在变更后刷新目录（目录/书签/交叉引用），确保目录条目与页码更新

## 适用场景（触发条件）

- 用户发来一段“绪论/摘要/结论/某章节”的正文内容，希望“补充进去/替换进去”
- 用户要求“补充英文摘要/关键词”
- 用户提醒“更新目录/更新 TOC”
- 用户发来带编号的小节（如 1.1、1.2）但需要转换成 LaTeX 的 `\section/\subsection` 层级

## 执行流程

### 1) 读取上下文并锁定插入点

- 读取 `hzu.tex`，定位目标章节区域（例如 `\chapter{绪论}` 后的内容）
- 优先保留现有文档骨架：`\frontmatter/\mainmatter`、`\tableofcontents`、章节顺序、模板命令
- 对于“替换/补充”：
  - 替换：用用户内容替换该章节内的占位文字段落
  - 补充：在对应 `\section/\subsection` 位置追加内容，不破坏已有结构

### 2) 解析用户文本为 LaTeX 结构

- 章节/小节映射规则：
  - “绪论 / 第X章 / 结论”等 → `\chapter{...}`
  - “1.1 研究背景与意义 / 1.2 ...” → `\section{...}`（章节内）
  - “（1）（2）...”或“第一/第二/第三”要点 → 用 `\begin{enumerate}[label=(\arabic*)] ... \end{enumerate}`（若项目已有该风格）
  - “（1）xxx”且每条较长时，保留为枚举；若只是短语，可改成段落
- 排版一致性：
  - 中文引号使用全角样式“”保持一致
  - 英文缩写（Web3D、AIGC、AI、Three.js、ControlNet）按原文保留
  - 避免引入新宏包/新命令，除非项目现有模板已依赖

### 3) 按模板风格写入 `hzu.tex`

- 不改变 `\documentclass` 与模板命令（如 `\title/\author/...`）
- 写入时优先使用项目已经出现的环境与写法（例如 `enumerate` 的 `label=(\arabic*)` 风格）
- 不添加与任务无关的内容

### 4) 刷新目录（目录/书签/交叉引用）

- 在项目目录内运行两遍 XeLaTeX 以更新 `.toc/.out`：

```bash
/Library/TeX/texbin/xelatex -synctex=1 -interaction=nonstopmode -file-line-error hzu.tex
/Library/TeX/texbin/xelatex -synctex=1 -interaction=nonstopmode -file-line-error hzu.tex
```

- 若用户使用编辑器构建出现 `spawn xelatex ENOENT`：
  - 建议在编辑器的 LaTeX 工具配置中把 `xelatex` 改为绝对路径 `/Library/TeX/texbin/xelatex`

## 输出要求

- 只做用户请求的修改：插入/替换指定章节内容、补充摘要、更新目录
- 提供可点击的文件定位链接：例如 `hzu.tex:Lxx-Lyy`
- 如果仅出现警告（字体替代、未定义引用等），不阻塞目录更新；仅在用户要求时再处理告警

## 示例

### 示例 1：用户发来“1.1/1.2/1.3”的绪论文本

- 目标：替换 `\chapter{绪论}` 下的占位内容
- 操作：生成三个 `\section{...}`，并把条目型内容转为 `enumerate`
- 最后：运行两遍 XeLaTeX 刷新目录

### 示例 2：用户要求“补充英文摘要”

- 目标：替换 `\begin{englishabstract}...\end{englishabstract}` 内占位英文
- 操作：根据中文摘要语义写成英文，并更新 `\englishkeywords{...}`
