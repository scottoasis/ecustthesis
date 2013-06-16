\ProvidesClass{ecustthesis}[2013/05/09 ver. 1.05 SNAPSHOT]
% == ECUST bachelors thesis template, V1.05, last modified at 2013-05-14 == %
\NeedsTeXFormat{LaTeX2e}
\LoadClass[cs4size,a4paper,oneside]{ctexart}
%
%% ---- Use This Template ----
%  \documentclass[<optional parameter>]{ecustthesis}
%
%  optional parameter for different templates
%   translation -> 文献翻译
%   opening     -> 开题报告
%   no-params   -> 正式论文
%

%% ==== GLOBAL DEFINITIONS ===
%
%  Global var definition: \thesis@<var-name>, \thesis@type forexample
%  

%% declear a class option for this template,
%  so that you can use it with options such as:
%  \documentclass[opening]{ecustthesis}
%
\newif\iftranslation
\newif\ifopening\openingfalse

\DeclareOption{translation}{\translationtrue}
\DeclareOption{opening}{\openingtrue}


%% ---- author meta data ----
\newcommand\class[1]{\def\author@class{#1}}
\newcommand\studentnumber[1]{\def\author@studentnumber{#1}}
\newcommand\college[1]{\def\author@college{#1}}
\newcommand\department[1]{\def\author@department{#1}}
\newcommand\major[1]{\def\author@major{#1}}
\newcommand\yearenrolled[1]{\def\author@yearenrolled{#1}}
\newcommand\mentor[1]{\def\author@mentor{#1}}

\ifopening
\def\thesistype{（开题报告）}
\else
\def\thesistype{}
\fi

\ProcessOptions\relax

\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{chngcntr}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage[nooneline,center]{caption}
\RequirePackage{subcaption}
\RequirePackage{multirow}
\RequirePackage{titling}
\RequirePackage[numbers, super, square, compress]{natbib}
\RequirePackage{ifthen}
\RequirePackage{verbatim}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage[pdfborder=001]{hyperref}
\RequirePackage{enumitem}

%  add support for bibtex and specific reference style
% \bibliographystyle{GBT7714-2005NLang-UTF8}


%% ==== GLOBAL STYLES ====

%  default font for Western Characters
\setmainfont{Times New Roman}

%  geometry for page
\geometry{left=2.5cm,right=2.5cm,top=2.8cm,bottom=2.5cm,headsep=0.6cm}

%  thesis page style
\fancypagestyle{ecustthesis}{
  \fancyhead[L]{\zihao{5}{\@title \thesistype }}
  \fancyhead[R]{\zihao{-5}\thepage}
  \fancyfoot[C]{}
}

\ifopening
\pagestyle{ecustthesis}
\pagenumbering{arabic}
\else \iftranslation
\pagestyle{ecustthesis}
\pagenumbering{arabic}
\else
\pagestyle{plain}
\renewcommand\thepage{\zihao{5}{\Roman{page}}}
\fi \fi

%% ---- caption for Fig, Tab and Equations ----
%  figure   - 图 (3-2) 
%  tablar   - 表 (3.2) 
%  equation - (3-2)
%
\makeatletter
\@addtoreset{figure}{section}
\renewcommand{\thefigure}{
  \ifnum \c@section>\z@ \thesection -\fi\@arabic\c@figure}

\@addtoreset{table}{section}
\renewcommand{\thetable}{
  \ifnum \c@section>\z@ \thesection .\fi\@arabic\c@table}

\@addtoreset{equation}{section}
\renewcommand{\theequation}{
  \ifnum \c@section>\z@ \thesection -\fi\@arabic\c@equation}


%% ==== citation styles ====
% uper-scrinpt citations


%  figure and table delimination
\renewcommand{\captionfont}{\bf\zihao{-5}}
\captionsetup{labelsep=quad}


%  set default line-spread to 1.35 times, which is close to 1.5 times in word.
\renewcommand{\baselinestretch}{1.35}

%  set gap between paragraphes, items and ref items
\setlength{\parskip}{0pt}
\setlength{\bibsep}{0pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=0pt,topsep=0pt}




%% ==== SPECIFIC STYLES ====
%
%  ---- Table-of-contents style -----
\titlecontents{section}[0pt]{\vspace{0.8em}}
              {\heiti \zihao{4}\thecontentslabel~~}{}
              {\titlerule*[4pt]{.} \thecontentspage \vspace{0.4em}}
\titlecontents{subsection}[0pt]{\vspace*{0pt}}
              {\heiti \thecontentslabel~~}{}
              {\titlerule*[4pt]{.}\thecontentspage}
\setcounter{tocdepth}{2}              

%  ---- Titile -----
\pretitle{\centering\vskip -50bp\zihao{-2}\heiti}
\posttitle{\par\vskip 0pt}
\preauthor{\centering\vskip 18bp\zihao{4}\heiti}
\postauthor{\par\vskip 18pt}
\predate{\vskip 0pt}
\postdate{\vskip -20bp}

\renewcommand\maketitle{
   \maketitlehooka
    {\@bspretitle \LARGE \@title \@bsposttitle}
    \maketitlehookb
    {\@bspreauthor \@author \@bspostauthor}
    \maketitlehookc
}


%% ---- Abstract and Keywords ----
%
%  def keywords command
%  \keywords{<LANGUAGE>}{<KEYWORDS>}
\newcommand\keywords[2]{
  \ifthenelse{\equal{#1}{english}}{
    \def\englishkeywords{#2}}
{
    \def\chinesekeywords{#2}} 
}

\ifopening 
  \renewcommand\keywords[1]{
    \def\thekeywords{#1} }
\fi

%% ---- Abstract and Keywords style ----
%
%  style of thesis
%  摘要段前距为 102pt，`摘要`或`Abstract`居中，大小为小二号/Large
%  （注：模板终申明`摘要`二字应为小二号,然而实际模板中字号更接近二号字）
%  摘要正文结束后。空 12pt 然后开始关键字。`关键字`和关键字正文，
%  以及摘要正文的字体大小均为小四号（默认大小）。
\renewenvironment{abstract}[1][0]{
  \ifthenelse{\equal{#1}{chinese}}{
    \def\theabstract{{\zihao{2}\heiti 摘要}}
    \def\thekeywords{{\heiti 关键词：}}
    \def\thesis@keywords{\chinesekeywords}}
{
    \def\theabstract{{\Large\bf Abstract}}
    \def\thekeywords{{\bf Keywords:} }
    \def\thesis@keywords{\englishkeywords }}
  \clearpage
  \vspace*{90pt}
  {\center \theabstract\\}\vspace{12pt}}{
  \vspace{12pt} \\
  \noindent
  \thekeywords ~ \thesis@keywords
  \vspace{1.2em}
}

%  style for translation and opening
\ifopening
\renewenvironment{abstract}{
  \noindent {\heiti 摘要：}}{
  \vspace{0.2em} \\
  \noindent {\heiti 关键词：}\thekeywords \vspace{1.2em}
} \fi

%% ---- Sections ----
%  section, subsection styles
% \CTEXsetup[number={},name={,},beforeskip={-25bp},afterskip={18bp}, titleformat={\thispagestyle{fancy}\setcounter{section}{0}\normalfont\zihao{-2}\heiti}]{chapter}
\newcommand\sectionbreak{
  \clearpage
  \ifnum \c@section=1
  \pagestyle{ecustthesis}
  \pagenumbering{arabic}
  \fi }

\ifopening \renewcommand\sectionbreak{} \fi
\CTEXsetup[format={\centering\zihao{-2}\heiti},beforeskip={12bp},afterskip={18bp}]{section}
\CTEXsetup[format={\zihao{4}\songti},beforeskip={18bp},afterskip={18bp}]{subsection}
\CTEXsetup[format={\zihao{-4}}\heiti,beforeskip={18bp},afterskip={18bp}]{subsubsection}
\setcounter{secnumdepth}{4}


%% ---- enumrate and itemize ---- %
\renewcommand{\theenumi}{(\arabic{enumi})}
\setitemize[1]{itemsep=1.2ex}

%% ---- Refereces ----
\newcommand\addreftoc{
  \clearpage
\addcontentsline{toc}{section}{\bf\zihao{4} 参考文献}
}


%% ---- Acknowledge ----
%  add acknowledge at last
\newcommand\acknowledge{
\section*{致谢}
\addcontentsline{toc}{section}{\bf\zihao{4} 致谢}}

%  section numbering
% \counterwithout{section}{chapter}
