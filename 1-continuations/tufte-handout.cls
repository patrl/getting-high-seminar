\NeedsTeXFormat{LaTeX2e}[1994/06/01]

\ProvidesClass{tufte-handout}[2015/06/21 v3.5.2 Tufte-handout class]

%%
% Declare we're tufte-handout
\newcommand{\@tufte@class}{article}% the base LaTeX class (defaults to the article/handout style)
\newcommand{\@tufte@pkgname}{tufte-handout}% the name of the package (defaults to tufte-handout)

%%
% Load the common style elements
\input{tufte-common.def}

\PassOptionsToPackage{utf8}{inputenc}
\RequirePackage{inputenc}

\PassOptionsToPackage{T1}{fontenc} % T2A for cyrillics
\RequirePackage{fontenc}

%%
% Set up any handout-specific stuff now

%%
% Abstract

% TODO The abstract should be printed on its own page of the `titlepage'
% option was specified.
\renewenvironment{abstract}
  {\begin{quotation}\if@tufte@sfsidenotes\begin{sffamily}\fi}
  {\if@tufte@sfsidenotes\end{sffamily}\fi\end{quotation}}


%%
% If there is a `tufte-handout-local.tex' file, load it.

\PassOptionsToPackage{dvipsnames}{xcolor}
\RequirePackage{xcolor}

\definecolor{ling-cite}{rgb}{0,0.5,0} % WebGreen
\definecolor{ling-url}{named}{Maroon} % Maroon
\definecolor{ling-link}{named}{RoyalBlue} % RoyalBlue {cmyk}{1, 0.50, 0, 0}

% hyperref setup
\RequirePackage{hyperref}
\hypersetup{colorlinks=true,breaklinks=true,urlcolor=ling-url,linkcolor=ling-link,citecolor=ling-cite}

% conditionals
\RequirePackage{ifthen}

% checking for xetex/luatex
\RequirePackage{ifxetex}
\RequirePackage{ifluatex}

% trees
\PassOptionsToPackage{linguistics}{forest}
\RequirePackage{forest}

% bib stuff
\PassOptionsToPackage{
  backend=biber
, bibstyle=biblatex-sp-unified
, citestyle=sp-authoryear-comp
, url=false
, doi=false
, bibencoding=utf8}{biblatex}

\RequirePackage{biblatex}

% maths stuff
\RequirePackage{braket}
\RequirePackage{stmaryrd}
\DeclareFontFamily{U}{stmry}{}
% fix for stmaryrd optical sizes
\DeclareFontShape{U}{stmry}{m}{n}
 {
  <-5.5>  stmary5
  <5.5-6.5> stmary6
  <6.5-7.5> stmary7
  <7.5-8.5> stmary8
  <8.5-9.5> stmary9
  <9.5->  stmary10
   }{}
\RequirePackage{amsmath}

% acronyms
\PassOptionsToPackage{nolist}{acronym}
\RequirePackage{acronym}

% misc
\RequirePackage{multicol}
\RequirePackage{todonotes}
\RequirePackage{csquotes}

% necessary for custom macros
\RequirePackage{xparse}

\RequirePackage{booktabs}

% Simon Charlow's tower macro (https://gist.github.com/schar/2cd7de8af510e0cbeefb26720f389d59)
% requires the booktabs package
\NewDocumentCommand\typetower{mm}{% a 2-level semantic tower
  \begin{tabular}[c]{@{\,}c@{\,}}
    \(\type{#1}\)
    \\
    \midrule
    \(\type{#2}\)
    \\
  \end{tabular}
}
\NewDocumentCommand\semtower{mm}{% a 2-level semantic tower
  \begin{tabular}[c]{@{\,}c@{\,}}
    \(#1\)
    \\
    \midrule
    \(#2\)
    \\
  \end{tabular}
}
\NewDocumentCommand\tower{mmm}{% a 2-level type/category tower
  \begin{tabular}[c]{@{\,}c@{\,}}
    \(\hfil #1\ \vrule width .05em\ #2 \hfil\)
    \\
    \midrule
    \(#3\)
    \\
  \end{tabular}
}

% inquisitive diagrams stuff
\tikzstyle{index on}=[inner sep=2pt, white, circle, fill=black]
\tikzstyle{index off}=[inner sep=2pt, black, circle, draw]
\tikzstyle{index gray}=[inner sep=2pt, black, circle, fill=lightgray]
\tikzstyle{opaque}=[fill=gray,fill opacity=.1]
\tikzstyle{counter}=[densely dashed]

% macro for the interpretation function. Requires stmaryrd
\NewDocumentCommand\eval{sO{}O{}m}{%
  \IfBooleanTF#1
  {\ensuremath{\left\llbracket{#4}\right\rrbracket^{#2}_{#3}}}
  {\ensuremath{\left\llbracket\text{#4}\right\rrbracket^{#2}_{#3}}}
}

\NewDocumentCommand{\citeposs}{m}{\citeauthor{#1}'s (\citeyear{#1})}
\NewDocumentCommand{\citepossalt}{m}{\citeauthor{#1}'s \citeyear{#1}}

\NewDocumentCommand{\sub}{m}{\textsubscript{#1}}
\NewDocumentCommand{\supscr}{m}{\textsuperscript{#1}}

\NewDocumentCommand\type{m}{\ensuremath{\mathtt{#1}}}

\NewDocumentCommand\ml{m}{\ensuremath{\textsf{#1}}}

\NewDocumentCommand\dmroot{m}{\ensuremath{\sqrt{\text{#1}}}}

% requires pifont
\RequirePackage{pifont}
\NewDocumentCommand\cmark{}{\ding{51}}%
\NewDocumentCommand\xmark{}{\ding{55}}%

\NewDocumentCommand\trace{O{}}{\textit{t\textsubscript{#1}}}
\NewDocumentCommand\bracketStr{O{}m}{[\textsubscript{#1}\,{#2}\,]}
\NewDocumentCommand\powerset{m}{\ensuremath{𝒫(#1)}}
\NewDocumentCommand\strawsonEntails{}{\ensuremath{⊧_S}}
\NewDocumentCommand\nstrawsonEntails{}{\ensuremath{̸⊧_S}}
\NewDocumentCommand\fade{m}{\textcolor{gray}{#1}}
\NewDocumentCommand\bind{}{\ensuremath{≫\!\!=}}

\RequirePackage{microtype}

\RequirePackage{fontspec}
  \defaultfontfeatures{Scale=MatchLowercase}
  \setmainfont[%
  UprightFeatures={
    SizeFeatures={
      {Size={-8.4},Font=MinionPro-Capt},
      {Size={8.4-13},Font=MinionPro-Regular},
      {Size={13-19.9},Font=MinionPro-Subh},
      {Size={19.9-},Font=MinionPro-Disp}
    },
  },
  BoldFeatures={
    SizeFeatures={
      {Size={-8.4},Font=MinionPro-BoldCapt},
      {Size={8.4-13},Font=MinionPro-Bold},
      {Size={13-19.9},Font=MinionPro-BoldSubh},
      {Size={19.9-},Font=MinionPro-BoldDisp}
    },
  },
  ItalicFeatures={
    SizeFeatures={
      {Size={-8.4},Font=MinionPro-ItCapt},
      {Size={8.4-13},Font=MinionPro-It},
      {Size={13-19.9},Font=MinionPro-ItSubh},
      {Size={19.9-},Font=MinionPro-ItDisp}
    },
  },
  BoldItalicFeatures={
    SizeFeatures={
      {Size={-8.4},Font=MinionPro-BoldItCapt},
      {Size={8.4-13},Font=MinionPro-BoldIt},
      {Size={13-19.9},Font=MinionPro-BoldItSubh},
      {Size={19.9-},Font=MinionPro-BoldItDisp}
    },
  },
  ]{Minion Pro}

  \setsansfont[%
  UprightFeatures={
    SizeFeatures={
      {Size={-8.4},Font=CronosPro-Capt},
      {Size={8.4-13},Font=CronosPro-Regular},
      {Size={13-19.9},Font=CronosPro-Subh},
      {Size={19.9-},Font=CronosPro-Disp}
    },
  },
  BoldFeatures={
    SizeFeatures={
      {Size={-8.4},Font=CronosPro-BoldCapt},
      {Size={8.4-13},Font=CronosPro-Bold},
      {Size={13-19.9},Font=CronosPro-BoldSubh},
      {Size={19.9-},Font=CronosPro-BoldDisp}
    },
  },
  ItalicFeatures={
    SizeFeatures={
      {Size={-8.4},Font=CronosPro-CaptIt},
      {Size={8.4-13},Font=CronosPro-Italic},
      {Size={13-19.9},Font=CronosPro-SubhIt},
      {Size={19.9-},Font=CronosPro-DispIt}
    },
  },
  BoldItalicFeatures={
    SizeFeatures={
      {Size={-8.4},Font=CronosPro-BoldCaptIt},
      {Size={8.4-13},Font=CronosPro-BoldIt},
      {Size={13-19.9},Font=CronosPro-BoldSubhIt},
      {Size={19.9-},Font=CronosPro-BoldDispIt}
    },
  },
  ]{Cronos Pro}

  \PassOptionsToPackage{math-style=ISO}{unicode-math}
  \RequirePackage{unicode-math}
  \setmathfont{STIX Two Math}%[range={\lBrace,\rBrace}]
  \setmonofont{SF Mono}

  % example sentences:
\RequirePackage{leipzig}
\RequirePackage{expex}
% fix for conflict between expex and unicode-math, as described here: https://tex.stackexchange.com/questions/97845/expex-glosses-get-broken-when-unicode-math-is-loaded-in-xelatex-and-lualatex
\let\expexgla\gla
\AtBeginDocument{\let\gla\expexgla}

\DeclareDocumentCommand \tikzexsetup {} {%
  \tikzstyle{every picture}+=[remember picture, inner sep=0pt,baseline, anchor=base]}
% arg 1: optional strut; arg 2: node name; arg 3: node content
\DeclareDocumentCommand \ND {s m m} {%
  \tikzifinpicture{}{\tikz}\node(#2){\IfBooleanTF{#1}{\strut}{}#3};}

\definelingstyle{exarrbelow}{belowexskip=1em plus 0.375em minus 0.25em}

\usetikzlibrary{arrows.meta}

\tikzset{exarrows/.style={semithick,arrows={-Stealth[scale=1, scale length=1,scale width=1]}}}


%%
% End of file
\endinput
