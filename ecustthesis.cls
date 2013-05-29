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
%   opening    -> 开题报告
%   no-params   -> 正式论文
%

%% ==== GLOBAL DEFINITIONS ===
%
%  Global var definition: \thesis@<var-name>, \thesis@type forexample
%  
\newif\iftranslation\translationfalse
\newif\ifopening\openingfalse
\newcommand\thesistype[1]{\def\thesis@type{#1}}
\thesistype{}

\iftranslation
\thesistype{（文献翻译）}
\fi

\ifopening
\thesistype{（开题报告）} 
\fi


%% ---- author meta data ----
\newcommand\class[1]{\def\author@class{#1}}
\newcommand\studentnumber[1]{\def\author@studentnumber{#1}}
\newcommand\college[1]{\def\author@college{#1}}
\newcommand\department[1]{\def\author@department{#1}}
\newcommand\major[1]{\def\author@major{#1}}
\newcommand\yearenrolled[1]{\def\author@yearenrolled{#1}}
\newcommand\mentor[1]{\def\author@mentor{#1}}


%% !==== NEED COMMENTS ====!
\DeclareOption{translation}{\translationtrue}
\DeclareOption{opening}{\openingtrue}

\ProcessOptions\relax

%% ---- require packages ----
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{chngcntr}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage[nooneline,center]{caption}
\RequirePackage{multirow}
\RequirePackage{titling}
\RequirePackage[numbers, super]{natbib}
\RequirePackage{ifthen}
\RequirePackage{verbatim}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage[pdfborder=001]{hyperref}

%  add support for bibtex and specific reference style
\bibliographystyle{GBT7714-2005NLang-UTF8}


%% ==== GLOBAL STYLES ====

%  default font for Western Characters
\setmainfont{Times New Roman}

%  geometry for page
\geometry{left=2.5cm,right=2.5cm,top=2.8cm,bottom=2.5cm,headsep=0.6cm}

%  thesis page style
\fancypagestyle{ecustthesis}{
  \fancyhead[L]{\zihao{5}{\@title \thesis@type }}
  \fancyhead[R]{\thepage}
  \fancyfoot[C]{}
}
\pagestyle{plain}
\pagenumbering{Roman}

\ifopening
\pagestyle{ecustthesis}
\pagenumbering{arabic}
\fi

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
    {\@bspretitle \@title \@bsposttitle}
    \maketitlehookb
    {\@bspreauthor \@author \@bspostauthor}
    \maketitlehookc
}

%% ---- Cover ----
%
\newcommand{\coveritem}[2]{
  \makebox[2.5cm]{{\bf\zihao{-2}#1}}\quad\underline{\makebox[7cm]{\zihao{-2}\kaishu #2}}
}
\newcommand{\makecover}{
  \begin{titlepage}
    
    \begin{picture}(0,0)(-75,94)
      \includegraphics[width=0.56\textwidth]{img/ecust_logo.png}
    \end{picture}

    \vspace*{120pt}

    \begin{center}
      {\zihao{0} \heiti \bf 毕业设计（论文）}
    \end{center}
    \vspace{60pt}
    
    \renewcommand{\arraystretch}{1.65}
    \centerline{
      \begin{tabular}{c}
	\coveritem{题\quad\quad目}{\@title}\\
	\coveritem{学\quad\quad院}{\author@college}\\
	\coveritem{系\quad\quad别}{\author@department}\\
	\coveritem{专\quad\quad业}{\author@major}\\
	\coveritem{年\quad\quad级}{\author@yearenrolled}\\
	\coveritem{学\quad\quad号}{\author@studentnumber}\\
	\coveritem{姓\quad\quad名}{\author}\\
	\coveritem{导\quad\quad师}{\author@mentor}
      \end{tabular}}

      \vspace{3.2cm}

      \centerline{\makebox[2.5cm]{\bf\zihao{-2}定稿日期：}\makebox[7cm]{\zihao{-2} \@date}}
    \end{titlepage}
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
    \def\thekeywords{{\heiti 关键词 }}
    \def\thesis@keywords{\chinesekeywords}}
{
    \def\theabstract{{\Large\bf Abstract}}
    \def\thekeywords{{\bf Keywords} }
    \def\thesis@keywords{\englishkeywords}}
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


%% ---- Refereces ----


%% ---- Acknowledge ----
%  add acknowledge at last
\newcommand\acknowledge{\section*{致谢}}

%  section numbering
% \counterwithout{section}{chapter}




%% ==== DEPRECATED ====
%
%  标题 NOTE WILL BE DEPRECATED
\newcommand{\ECUSTtitle}[1]{\def\ECUST@title{#1}}

\newcommand{\ECUSTabstract}{\noindent\heiti摘要\songti：}
\newcommand{\ECUSTkeywords}{\noindent\heiti关键词\songti：}

%  插入浮动表格
\newcommand{\ECUSTtable}[3]{
  \begin{table}[hbtp]
    \caption{#1}
    \centerline{#2}
    \label{#3}
  \end{table}
}

%  插入浮动图片
\newcommand\ECUSTfigure[4][]{
  \begin{figure}[hbtp]
    \centerline{\includegraphics[#1]{#2}}
    \caption{#3}
    \label{#4}
  \end{figure}
}
%% 页眉格式：
%    - 左上角是课题名，右上角是页码；页眉有下划线。
%% 页脚格式：
%    - 没有页脚
%\pagestyle{fancy}
%\fancyhead{}
%\fancyfoot{}
%\lhead{\zihao{5}\ECUST@title\ECUST@type}
%\rhead{\thepage}
