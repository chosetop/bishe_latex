%%%%%%%%%%%%%%%%%%%%%%%%%
% !TeX encoding = UTF-8
% !Mode:: "TeX:UTF-8"

\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{thesis-cls-Miya}
[2017/09/01 v1.0 thesis-cls-Miya document class]
\PassOptionsToPackage{AutoFakeBold=true}{xeCJK} 
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\newif\ifMiya@istwoside\Miya@istwosidefalse
\DeclareOption{twoside}{\Miya@istwosidetrue}
\newif\if@openright\@openrightfalse

\ProcessOptions\relax
\ifMiya@istwoside
\LoadClass[zihao=-4,a4paper,twoside,openany,UTF8,space=auto,AutoFakeBold=3]{ctexbook}%
\else
\LoadClass[zihao=-4,a4paper,oneside,openany,UTF8,space=auto,AutoFakeBold=3]{ctexbook}
\fi

\RequirePackage[%
top=25.4mm,%
bottom=25.4mm,%
left=31.7mm,%
right=31.7mm,%
headsep=10.4mm,%
footskip=7.9mm,% 
]{geometry} %

\RequirePackage[compact]{titlesec} 
\RequirePackage[numbers,square,comma,super,sort&compress]{natbib}
\RequirePackage[perpage,symbol]{footmisc}
\RequirePackage[titletoc,title]{appendix} 
\RequirePackage{amsmath} 
\RequirePackage{amssymb}
\RequirePackage{amsthm,amsfonts,mathrsfs}
\RequirePackage{mathptmx} 
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage{chngcntr}
\RequirePackage{CJKulem}
\RequirePackage{dashrule}
\RequirePackage{enumitem}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage{fontspec}
\RequirePackage{graphicx}
\RequirePackage{indentfirst} 
\RequirePackage{listings}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{pifont}
\RequirePackage{scrextend}
\RequirePackage{setspace}
\RequirePackage{subcaption}
\RequirePackage{tikz}
\RequirePackage{titletoc}
\RequirePackage[normalem]{ulem}
\RequirePackage{upgreek}
\RequirePackage{xcolor}
\useunder{\uline}{\Miya@uline}{}
\emergencystretch=2em 
\RequirePackage{xeCJKfntef}
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}
\definecolor{MiyaGreen}{RGB}{0,170,0}
\RequirePackage{hyperref}
\hypersetup{
	bookmarksnumbered,%
	colorlinks,%
	linkcolor=black,%
	citecolor=black,%
	urlcolor=black,
	plainpages=false,%
	pdfstartview=FitH,
	pdfcreator={米芽文档 Miya DocTor 淘宝店: shop459566885.taobao.com}
}

\DefineFNsymbols{circled}{{\ding{192}}{\ding{193}}{\ding{194}}
	{\ding{195}}{\ding{196}}{\ding{197}}{\ding{198}}{\ding{199}}{\ding{200}}{\ding{201}}}
\setfnsymbol{circled}
\renewcommand{\thefootnote}{\fnsymbol{footnote}} % 
\renewcommand\@makefntext[1]{%
	$^\@thefnmark$ #1 
}

\def\Miya@Value@frontbaselineskip{1.25}
\def\Miya@Value@baselineskip{1.5} %

\newcommand\MiyaBold[1]{\special{pdf: literal direct 0.5 w 2 Tr}#1 \special{pdf: literal direct 0 w 0 Tr}}
\newcommand\MiyaNormalFont[1]{#1}
\newcommand{\MiyaHeitiCJK}{\CJKfontspec{simhei.ttf}\selectfont}
\newcommand{\MiyaZhongSongFont}{\CJKfontspec{STZHONGS.TTF}\selectfont}
\newcommand{\MiyaSTXINGKACJK}{\CJKfontspec{STXINGKA.TTF}\selectfont}

\setCJKmainfont{simsun.ttc}[AutoFakeBold=true] %
\setmainfont{Times New Roman}
\setmonofont{Times New Roman}
\setsansfont{Times New Roman}

\def\MiyaTitlefontA{\zihao{-3}\bfseries\MiyaHeitiCJK} %
\def\MiyaChapfont{\zihao{-3}\bfseries\MiyaHeitiCJK} %
\def\MiyaSecfont{\zihao{4}\bfseries\songti}
\def\MiyaSubSecfont{\zihao{-4}\bfseries\songti}
\def\MiyaSubsubSecfont{\zihao{-4}\songti}
\def\MiyaKeywordCnfont{\zihao{-3}\bfseries\MiyaHeitiCJK}
\def\MiyaKeywordEnfont{\zihao{-3}\bfseries}
\def\MiyaTocChapfont{\zihao{-4}\bfseries\songti}
\def\MiyaTocSecfont{\zihao{-4}\songti}
\def\MiyaTocSubSecfont{\zihao{-4}\songti}

\titlespacing*{\section}{0pt}{1em}{1ex}
\titlespacing*{\subsection}{0pt}{1ex}{1ex}
\titlespacing*{\subsubsection}{0pt}{1ex}{0ex}
\ctexset{chapter={
		name = {,}, %
		number = {\arabic{chapter}}, %
		format = {\zihao{-3}\songti\bfseries}, %
		aftername = \quad, %
		beforeskip = -2em,
		afterskip = 1em,
	}
}

\ctexset{section={
		format={\MiyaSecfont}, %
		aftername = \quad, %
	}
}

\ctexset{subsection={
		format = {\MiyaSubSecfont},
		aftername = \quad, %
	}
}

\ctexset{subsubsection={
		name = {\hskip 2em（,）},
		number = {\arabic{subsubsection}}, %
		format={\MiyaSubsubSecfont},
		aftername = \hskip 0ex, %
	}
}

\newcommand\chapterspecialcenter[1]{
	\if@openright\cleardoublepage\else\clearpage\fi
	\phantomsection
	\addcontentsline{toc}{chapter}{#1}
	\markboth{#1}{}
	\vspace*{-5ex} 
	\begin{center}
		{\MiyaTitlefontA #1} 
	\end{center}
	\vskip 0em

} 

\newcommand\chapterspecialcenterB[1]{
	\if@openright\cleardoublepage\else\clearpage\fi
	\phantomsection
%	\addcontentsline{toc}{chapter}{#1}
	\markboth{#1}{}
	\vspace*{-5ex} 
	\begin{center}
		{\MiyaTitlefontA #1} 
	\end{center}
	\vskip 0em
	
} 

\def\MiyaHeaderfont{\zihao{-5}\songti}
\def\MiyaFooterfont{\zihao{-5}}
\def\Miya@Value@headerA{\nouppercase{\Miya@Value@title\Miya@Value@titleB}}
\def\Miya@Value@headerB{惠州学院2026届本科生毕业论文}

\renewcommand\author[1]{\def\Miya@Value@author{#1}}
\renewcommand\title[2][\Miya@Value@title]{\def\Miya@Value@title{#2} \def\Miya@Value@titlemark{{#1}} }

\def\Miya@Value@titleB{}
\newcommand\titleB[1]{\def\Miya@Value@titleB{#1}} 
\def\Miya@Value@englishtitle{}
\newcommand\englishtitle[1]{\def\Miya@Value@englishtitle{#1}} 
\def\Miya@Value@englishtitleA{}
\newcommand\englishtitleA[1]{\def\Miya@Value@englishtitleA{#1}} 
\def\Miya@Value@englishtitleB{}
\newcommand\englishtitleB[1]{\def\Miya@Value@englishtitleB{#1}} 
\def\Miya@Value@englishmajor{}
\newcommand\englishmajor[1]{\def\Miya@Value@englishmajor{#1}} 
\def\Miya@Value@kongA{}
\newcommand\kongA[1]{\def\Miya@Value@kongA{#1}} 
\def\Miya@Value@kongB{}
\newcommand\kongB[1]{\def\Miya@Value@kongB{#1}} 
\def\Miya@Value@kongC{}
\newcommand\kongC[1]{\def\Miya@Value@kongC{#1}} 
\def\Miya@Value@kongD{}
\newcommand\kongD[1]{\def\Miya@Value@kongD{#1}} 
\def\Miya@Value@kongE{}
\newcommand\kongE[1]{\def\Miya@Value@kongE{#1}} 
\def\Miya@Value@kongF{}
\newcommand\kongF[1]{\def\Miya@Value@kongF{#1}} 
\def\Miya@Value@kongG{}
\newcommand\kongG[1]{\def\Miya@Value@kongG{#1}} 
\def\Miya@Value@kongH{}
\newcommand\kongH[1]{\def\Miya@Value@kongH{#1}} 
\def\Miya@Value@kongI{}
\newcommand\kongI[1]{\def\Miya@Value@kongI{#1}} 
\def\Miya@Value@kongJ{}
\newcommand\kongJ[1]{\def\Miya@Value@kongJ{#1}} 
\def\Miya@Value@signatureimage{}
\newcommand\signatureimage[1]{\def\Miya@Value@signatureimage{#1}}

\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}

\addtocontents{toc}{\protect\hypersetup{hidelinks}}
\addtocontents{lot}{\protect\hypersetup{hidelinks}}
\addtocontents{lof}{\protect\hypersetup{hidelinks}}

\def\@dotsep{0.75}           %
\setlength\leftmargini {0pt}
\setlength\leftmarginii {0pt}

\pagestyle{fancy}

\renewcommand\chaptermark[1]{\markboth{第\thechapter 章\hspace{1ex}#1}{}}

\fancypagestyle{MiyaFrontStyle}{%
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}  %
\fancyfoot[C]{\MiyaFooterfont\thepage}
}

\fancypagestyle{MiyaMainmatterStyle}{%
\fancyhf{}
\renewcommand{\headrulewidth}{0.5pt}  %
\fancyfoot[C]{\MiyaFooterfont\thepage}
\fancyhead[CO]{\MiyaHeaderfont\Miya@Value@headerA}
\fancyhead[CE]{\MiyaHeaderfont\Miya@Value@headerB}
}

\fancypagestyle{plain}{%
\fancyhf{}
\renewcommand{\headrulewidth}{0.5pt}  %
\fancyfoot[C]{\MiyaFooterfont\thepage}
\fancyhead[R]{\MiyaHeaderfont\Miya@Value@headerA}
\fancyhead[L]{\MiyaHeaderfont\Miya@Value@headerB}
}

\renewcommand{\frontmatter}{
\if@openright\cleardoublepage\else\clearpage\fi
\@mainmatterfalse
\pagestyle{MiyaFrontStyle}
\setstretch{\Miya@Value@frontbaselineskip}
\setlength{\parindent}{2em} 
}

\renewcommand{\mainmatter}{
\if@openright\cleardoublepage\else\clearpage\fi
\@mainmattertrue
\pagenumbering{arabic}
\pagestyle{MiyaMainmatterStyle}
\setstretch{\Miya@Value@baselineskip}
\setlength{\parindent}{2em} 
\let\MiyaTabular\tabular
\let\endMiyaTabular\endtabular
\renewenvironment{tabular}{\zihao{5}\MiyaTabular}{\endMiyaTabular}
}

\setenumerate[1]{leftmargin=4ex,itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
\setitemize[1]{leftmargin=4ex,itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}

\bibliographystyle{BibTeX-style-hzu} 

\newcommand{\Miyaspace}[1][1]{\hspace{#1\ccwd}}
\newcommand{\MiyaCndash}{\rule{0.1em}{0pt}\rule[0.8ex]{2em}{1pt}\rule{0.1em}{0pt}}

\def\Miya@underline[#1]#2{%
\underline{\hbox to #1{\hfill#2\hfill}}}
\def\Miyaunderline{\@ifnextchar[\Miya@underline\underline}
\def\MiyaL@underline[#1]#2{%
\underline{\hbox to #1{#2\hfill}}}
\def\MiyaLunderline{\@ifnextchar[\MiyaL@underline\underline}
\def\MiyaFillulineL#1{\uline{ #1 \hfill}} 

\renewcommand\maketitle{
\if@openright\cleardoublepage\else\clearpage\fi
\thispagestyle{empty}
\pdfbookmark[0]{封面}{titlepage}
\setstretch{\Miya@Value@frontbaselineskip}

\vskip 1em

\begin{minipage}[c]{6.5em}
	\centering
\includegraphics[width=6.5em]{logo}
\end{minipage}
\begin{minipage}[c]{0.4\textwidth}
	\centering
	{\fontsize{34pt}{\baselineskip}\MiyaSTXINGKACJK 惠州学院}
	
	\vskip 1em
	{\zihao{5}\fontspec{Arial}HUIZHOU UNIVERSITY}
\end{minipage}

\begin{center}
\vskip 3.5em

\makebox[0.6\textwidth][s]{\zihao{1}\MiyaZhongSongFont 毕业论文（设 计）}
	
\vskip 5em

{
	\zihao{3}\bfseries\songti
		\renewcommand{\arraystretch}{1.7} 
	\setlength{\tabcolsep}{0ex}	
	\begin{tabular}{ l @{\hspace{1ex}} p{0.8\textwidth} } 
		中文题目 ：& \hspace{2em}\zihao{3}\bfseries\Miya@Value@title\zihao{3} \\[-2mm] \cline{2-2}
		& \hspace{2em}\zihao{3}\bfseries\MiyaNormalFont{\Miya@Value@titleB}\zihao{3}
		\\[-2mm]  \cline{2-2}
		英文题目 ： & \hspace{2em}\Miya@Value@englishtitleA \\[-2mm]  \cline{2-2}
& \hspace{2em}\MiyaNormalFont{\Miya@Value@englishtitleB}
		\\[-2mm]  \cline{2-2}
	\end{tabular}
}


%\vfill
\vskip 6em

{
	\songti \zihao{-3}
\renewcommand{\arraystretch}{1.4} 
\setlength{\tabcolsep}{1ex}	
\begin{tabular}{@{}c@{}c@{}} 
	\makebox[4em][s]{\bfseries{姓名}}
	&
	\Miyaunderline[10em]{\MiyaNormalFont{\Miya@Value@author}}
	\\ 
		\makebox[4em][s]{\bfseries{学号}}
	&
	\Miyaunderline[10em]{\MiyaNormalFont{\Miya@Value@kongF}}
	\\ 
		\makebox[4em][s]{\bfseries{专业班级}}
	&
	\Miyaunderline[10em]{\MiyaNormalFont{\Miya@Value@kongG}}
	\\ 
		\makebox[4em][s]{\bfseries{指 导 教 师}}
	&
	\Miyaunderline[10em]{\MiyaNormalFont{\Miya@Value@kongH}}
	\\ 
			\makebox[4em][s]{\bfseries{提交日期}}
	&
	\Miyaunderline[10em]{\MiyaNormalFont{\Miya@Value@kongI}}
\end{tabular}
}

\vskip 3.3em

{
	\songti \zihao{4}
\MiyaNormalFont{教务部制}
}
\end{center}
\vspace*{3em}

\setstretch{\Miya@Value@baselineskip}

\makeDeclareOriginal

}

\newcommand\makeDeclareOriginal{%
\if@openright\cleardoublepage\else\clearpage\fi 
\pdfbookmark[0]{声明}{statement}
\pagenumbering{Roman}
\pagestyle{MiyaFrontStyle}
\thispagestyle{MiyaFrontStyle}
\renewcommand{\thispagestyle}[1]{} 
\setlength\parindent{2em}
\setstretch{2}

\begin{center}
{\zihao{-2} \songti
	\MiyaBold{诚信声明}
}
\end{center}

\vspace{2em}

{
	\songti \zihao{4}
本人郑重声明：所呈交的毕业论文（设计），是本人在指导老师的指导下，独立进行研究工作所取得的成果，成果不存在知识产权争议，除论文（设计）中已经注明引用的内容外，本论文（设计）不含任何其他个人或集体已经发表或撰写过的作品成果。对本论文（设计）的研究做出重要贡献的个人和集体均已在论文（设计）中以明确方式标明。本声明的法律结果由本人承担。

\vskip 2em

\hspace{0.5\textwidth}{本人签名：}\ifx\Miya@Value@signatureimage\@empty\else\hspace{1em}\raisebox{-0.5\height}{\includegraphics[height=1.2cm]{\Miya@Value@signatureimage}}\fi

\vskip 1em

\hspace{0.5\textwidth}日期：{2026年3月22日}

}

\setstretch{\Miya@Value@baselineskip}
}

\newenvironment{abstract}
{
 \if@openright\cleardoublepage\else\clearpage\fi
	\pdfbookmark[0]{摘要}{abstractcn}
\setstretch{\Miya@Value@baselineskip}

\renewcommand{\thispagestyle}[1]{} 
\chapterspecialcenterB{摘\quad 要}

}
{}

\newcommand\keywords[1]{%
	\par 
\vskip 1em
{\MiyaKeywordCnfont{关键词：}} \zihao{-4} #1 

}

\newenvironment{englishabstract}
{
\if@openright\cleardoublepage\else\clearpage\fi
	\pdfbookmark[0]{Abstract}{abstracten}
\setstretch{\Miya@Value@baselineskip}
\setlength{\parindent}{2em} 

	\renewcommand{\thispagestyle}[1]{} 
	\chapterspecialcenterB{Abstract}

}
{}

\newcommand\englishkeywords[1]{%
	\par
\vskip 1em
{\MiyaKeywordEnfont Key words: } \zihao{-4} #1 

}

\newlength\MiyaRuleA
\setlength\MiyaRuleA{1.5pt} 
\newlength\MiyaRuleB
\setlength\MiyaRuleB{0.5pt}
\renewcommand\toprule{\noalign{\hrule height \MiyaRuleA}} %
\renewcommand\bottomrule{\noalign{\hrule height \MiyaRuleA}}
\renewcommand\midrule{\noalign{\hrule height \MiyaRuleB}}

\setcounter{secnumdepth}{3}  %
\setcounter{tocdepth}{2}     %

\renewcommand\tableofcontents{%
\if@openright\cleardoublepage\else\clearpage\fi
	\pdfbookmark[0]{目录}{toc}
\renewcommand{\thispagestyle}[1]{} 
\setstretch{\Miya@Value@baselineskip}
	\markboth{目\quad 录}{}
\vspace*{-5ex} 
\begin{center}
	{\zihao{3}\bfseries\MiyaHeitiCJK 目\quad 录} 
\end{center}
\vskip 1em
\begin{spacing}{\Miya@Value@baselineskip}
	\@starttoc{toc}%
\end{spacing}

}

\newcommand*{\MiyaNoaddvspace}{\renewcommand*{\addvspace}[1]{\par}}
\titlecontents{chapter}[0pt]{\MiyaTocChapfont} %
{\thecontentslabel\enspace}{}
{\hspace{1ex}\titlerule*[.3pc]{.} \contentspage}[]  %
\titlecontents{section}[3ex]{\MiyaTocSecfont} %
{\thecontentslabel\enspace}{}
{\hspace{1ex}\titlerule*[.3pc]{.} \contentspage} 
\titlecontents{subsection}[6ex]{\MiyaTocSubSecfont} %
{\thecontentslabel\enspace}{}
{\hspace{1ex}\titlerule*[.3pc]{.} \contentspage}

\DeclareCaptionLabelSeparator{zhspace}{\hspace{1ex}}
\DeclareCaptionFont{fontsize}{\zihao{5}\setlength{\baselineskip}{1.4\baselineskip}}
\captionsetup{
%format=hang, 
justification=centering,
font = {fontsize}, %
labelsep = zhspace,
}
\captionsetup[figure]{
%belowskip = -3pt,
belowskip = 5pt,
}
\captionsetup[table]{
aboveskip = 8pt,
}

\setlength{\textfloatsep}{15pt} 
\setlength{\floatsep}{15pt}
\setlength{\intextsep}{15pt}

\renewcommand\theequation{\arabic{chapter}.\arabic{equation}}
\renewcommand\thefigure{\arabic{chapter}.\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}.\arabic{table}}

\renewcommand{\@biblabel}[1]{[#1]\hfill} 
\renewenvironment{thebibliography}[1]
{
	\zihao{5}
	\chapterspecialcenter{\bibname}
\list{\@biblabel{\@arabic\c@enumiv}}%
{\settowidth\labelwidth{\@biblabel{#1}}%
	\setlength{\topsep}{-1ex} %
	\setlength{\parsep}{1mm}
	\setlength{\labelsep}{0.5em}
	\setlength{\itemsep}{0.05pc}
	\setlength{\listparindent}{0in}
	\setlength{\itemindent}{\labelwidth}
	\addtolength{\itemindent}{\labelsep}
	\setlength{\rightmargin}{0in}
	\@openbib@code
	\usecounter{enumiv}%
	\let\p@enumiv\@empty
	\renewcommand\theenumiv{\@arabic\c@enumiv}}%
\sloppy
\clubpenalty4000
\@clubpenalty \clubpenalty
\widowpenalty4000%
\sfcode`\.\@m}
{\def\@noitemerr
{\@latex@warning{Empty `thebibliography' environment}}%
\endlist
}

\parskip 0pt

\AtBeginDocument{%
 	\setlength\abovedisplayskip{3pt}
 	\setlength\belowdisplayskip{3pt}
 	\setlength{\parindent}{0em} 
 	\pagestyle{empty}
 	\renewcommand{\thispagestyle}[1]{} 
}

\AtEndDocument{%
\backmatter
}

\endinput
