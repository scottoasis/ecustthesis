\ProvidesClass{ecustthesis}[2013/05/09 ver. 1.05 SNAPSHOT]
% == ECUST bachelors thesis template, V1.05, last modified at 2013-05-14 == %
\NeedsTeXFormat{LaTeX2e}

%% ==== basic options ====
%  cs4size - default fontsize `xiao 4`
%  a4paper - page size A4
%  oneside - no difference for oadd and even pages
\LoadClass[cs4size,a4paper,oneside]{ctexbook}

%% ==== optional parameter for different templates ====
%  translation - 文献翻译
%  openning    - 开题报告
%  no-params   - 正式论文
%

%% ==== GLOBAL DEF ===
%
%  thesis type
\newcommand\thesistype[1]{\def\thesis@type{#1}}
\newif\iftranslation\translationfalse
\newif\ifopenning\openningfalse
\iftranslation \thesistype{（文献翻译）} \fi
\ifopenning \thesistype{（开题报告）} \fi

\DeclareOption{translation}{\translationtrue}
\DeclareOption{openning}{\openningtrue}
\ProcessOptions\relax

\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{chngcntr}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage[nooneline,center]{caption2}
\RequirePackage{multirow}
\RequirePackage{titling}
\RequirePackage[numbers]{natbib}
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



%% ==== caption for Fig, Tab and Equations ====
%  figure   - 图 (3-2) 
%  tablar   - 表 (3.2) 
%  equation - (3-2)
%
\@addtoreset{figure}{section}
\renewcommand{\thefigure}{
  \ifnum \c@section>\z@ \thesection-\fi\@arabic\c@figure}

\@addtoreset{table}{section}
\renewcommand{\thetable}{
  \ifnum \c@section>\z@ \thesection.\fi\@arabic\c@table}

\@addtoreset{equation}{section}
\renewcommand{\theequation}{
  \ifnum \c@section>\z@ \thesection-\fi\@arabic\c@equation}

%  figure and table delimination
\renewcommand{\captionlabeldelim}{~}
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
%  ==== Table-of-Contents =====
\titlecontents{section}[0pt]{}{\bf\zihao{4}\thecontentslabel~~}{}{\titlerule*[4pt]{.}\thecontentspage}
\titlecontents{subsection}[0pt]{\vspace*{0pt}}{\bf\thecontentslabel~~}{}{\titlerule*[4pt]{.}\thecontentspage}

%  ==== Titile =====
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

\renewcommand\maketitle{

}

%% ==== Cover ====
%
\newcommand{\cover}{
  \begin{titlepage}
    \begin{picture}(0,0)(75,230)
      \includegraphics{Figures/title.png}
    \end{picture}
    
    \vspace{9.5cm}

    \renewcommand{\arraystretch}{1.65}
    \centerline{
      \begin{tabular}{c}
	\coveritem{题\quad\quad目}{\cover@titlea}\\
	\coveritem{ }{\cover@titleb}\\
	\coveritem{学\quad\quad院}{\cover@academy}\\
	\coveritem{系\quad\quad别}{\cover@dept}\\
	\coveritem{专\quad\quad业}{\cover@major}\\
	\coveritem{年\quad\quad级}{\cover@grade}\\
	\coveritem{学\quad\quad号}{\cover@num}\\
	\coveritem{姓\quad\quad名}{\cover@name}\\
	\coveritem{导\quad\quad师}{\cover@mentor}
      \end{tabular}}

      \vspace{3.2cm}

      \centerline{\makebox[2.5cm]{\bf\zihao{-2}定稿日期：}\makebox[7cm]{\zihao{-2}\cover@date}}
    \end{titlepage}
}


%% ==== Abstract and Keywords ====
%  def keywords command
%  \keywords{<LANGUAGE>}{<KEYWORDS>}
\newcommand\keywords[2]{
  \ifthenelse{\equal{#1}{chinese}}{
    \newcommand\chinesekeywords{#2}}{
    \newcommand\englishkeywords{#2}}
}

%% ==== Abstract and Keywords style ====
%
%  style of thesis
%  摘要段前距为 102pt，`摘要`或`Abstract`居中，大小为小二号/Large
%  （注：模板终申明`摘要`二字应为小二号,然而实际模板中字号更接近二号字）
%  摘要正文结束后。空 12pt 然后开始关键字。`关键字`和关键字正文，
%  以及摘要正文的字体大小均为小四号（默认大小）。
\newenvironment{abstract}[1][0]{
  \ifthenelse{\equal{#1}{chinese}}{
    \newcommand\theabstract{{\zihao{2}\heiti 摘要}}
    \newcommand\thekeywords{{\heiti 关键词 }}
    \newcommand\@keywords{\chinesekeywords}}{
    \newcommand\theabstract{{\Large\bf Abstract}}
    \newcommand\thekeywords{{\bf Keywords} }
    \newcommand\@keywords{\englishkeywords}}
  \clearpage
  \vspace*{90pt}
  {\center \theabstract\\}\vspace{12pt}}{
  \vspace{12pt} \\
  \noindent
  \thekeywords ~ \@keywords
  \vspace{1.2em}
}

%  style for translation and openning
\ifopenning
\renewenvironment{abstract}{
  \noindent {\heiti 摘要：}}{\vspace{0.2em} \\
  \noindent {\heiti 关键词：}\@keywords \vspace{1.2em}
} \fi

%% ==== Sections ====
%  section, subsection styles
\CTEXsetup[number={},name={,},beforeskip={-25bp},afterskip={18bp},titleformat={\thispagestyle{fancy}\setcounter{section}{0}\normalfont\zihao{-2}\heiti}]{chapter}
\CTEXsetup[format={\centering\zihao{-2}\heiti},beforeskip={12bp},afterskip={18bp}]{section}
\CTEXsetup[format={\zihao{4}\songti},beforeskip={18bp},afterskip={18bp}]{subsection}
\CTEXsetup[format={\zihao{-4}}\heiti,beforeskip={18bp},afterskip={18bp}]{subsubsection}
\setcounter{secnumdepth}{4}

%  section numbering
\counterwithout{section}{chapter}




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


