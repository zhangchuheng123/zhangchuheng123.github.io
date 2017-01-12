%!TEX TS-program = xelatex
%!TEX encoding = UTF-8 Unicode

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{SealZhang}[2015/3/29 beta1.0 thesis]
 
\LoadClass[a4paper, 11pt]{article}
\RequirePackage{geometry,fontspec,xltxtra,xunicode,listings,latexsym,amssymb,amsmath,xcolor,colortbl,ifthen,graphicx,xspace,eucal,verbatim,enumerate,indentfirst,hyperref,ulem}
\usepackage[justification=centering]{caption}

% \sloppy

% ----- Language Selection -----
\DeclareOption{CHN}
	{\typeout{当前设定为中文}%
	\def\figurename{图}%
	\def\tablename{表}%
	\renewcommand{\contentsname}{目录}%
	\renewcommand{\today}{\number\year 年\number\month 月\number\day 日}%
	\renewcommand\refname{参考文献}%
	\renewcommand{\abstractname}{摘要}
	\setlength{\parindent}{2em}}
\DeclareOption{ENG}{\typeout{当前设定为英文}}
\ExecuteOptions{ENG}
\ProcessOptions

% ----- Chinese Supporting -----
\geometry{letterpaper}
\defaultfontfeatures{Mapping=tex-text}
\setromanfont{SimSun} 
\XeTeXlinebreaklocale “zh”
\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt 
\newfontfamily{\H}{SimHei}
\newfontfamily{\E}{Arial}  

% ----- graphics -----
\graphicspath{{./}{./img/}{./fig/}{./image/}{./figure/}{./picture/}{./imgs/}{./figs/}{./images/}{./figures/}{./pictures/}}

% ----- listing -----
\definecolor{grey}{rgb}{0.8,0.8,0.8}
\definecolor{darkgreen}{rgb}{0,0.6,0}
\definecolor{darkblue}{rgb}{0,0,0.9}
\definecolor{darkred}{rgb}{0.8,0,0}
\def\lstbasicfont{\fontfamily{pcr}\selectfont\footnotesize}
\lstset{
 	%indexing,
	%numbers=left,
	%numberstyle=\small,
	%character display
    showstringspaces=false,
    showspaces=false,
    tabsize=4,
    frame=lines,
    basicstyle=\footnotesize\ttfamily,
    keywordstyle=\color{cyan}\bfseries,
    identifierstyle=\color{red},
    commentstyle=\color{darkgreen},%\itshape,
    stringstyle=\color{orange},
}
\lstloadlanguages{C,C++,Java,Matlab,Mathematica}