% 华东理工大学本科毕业论文格式模板 V1.00 %
\ProvidesClass{ecustthesis}
\NeedsTeXFormat{LaTeX2e}

%% 模板基础设置：
%  cs4size - 默认（正文）字体大小为小四
%  a4paper - 大小为A4
%  oneside - 单面打印，不分奇数页和偶数页
\LoadClass[cs4size,a4paper,oneside]{ctexbook}

%% 模板可选参数，分别对应不同类型的模板：
%  translation - 文献翻译
%  openning    - 开题报告
\newif\iftranslation\translationfalse
\newif\ifopenning\openningfalse
\newif\ifthesis\thesisfalse
\DeclareOption{translation}{\translationtrue}
\DeclareOption{openning}{\openningtrue}
\DeclareOption{thesis}{\thesistrue}

\ProcessOptions\relax

\RequirePackage{geometry}
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

%参考文献格式
\bibliographystyle{GBT7714-2005NLang-UTF8}

\titlecontents{section}[0pt]{}{\bf\zihao{4}\thecontentslabel~~}{}{\titlerule*[4pt]{.}\thecontentspage}
\titlecontents{subsection}[0pt]{\vspace*{0pt}}{\bf\thecontentslabel~~}{}{\titlerule*[4pt]{.}\thecontentspage}

%论文标题
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

%% 图表和公式编号格式：
%  图片 - 图 (3-2) 说明文字
%  表格 - 表 (3.2) 说明文字
%  公式 - (3-2)
\@addtoreset{figure}{section}
\renewcommand{\thefigure}{
  \ifnum\c@section>\z@\thesection-\fi\@arabic\c@figure}

\@addtoreset{table}{section}
\renewcommand{\thetable}{
  \ifnum\c@section>\z@\thesection.\fi\@arabic\c@table}

\@addtoreset{equation}{section}
\renewcommand{\theequation}{
  \ifnum\c@section>\z@\thesection-\fi\@arabic\c@equation}

%图表标题格式
\renewcommand{\captionlabeldelim}{~}
\renewcommand{\captionfont}{\bf\zihao{-5}}
\captionsetup{labelsep=quad}

%页面布局
\geometry{left=2.5cm,right=2.5cm,top=2.8cm,bottom=2.5cm,headsep=0.6cm}

%行间距
\renewcommand{\baselinestretch}{1.35}

%段间距
\setlength{\parskip}{0pt}

%参考文献条目间距
\setlength{\bibsep}{0pt}

%无序列表条目间距
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=0pt,topsep=0pt}

%有序列表条目间距
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=0pt,topsep=0pt}
%有序列表编号
\renewcommand\labelenumi{(\arabic{enumi})~}

%自定义宏
\newcommand{\ECUSTtitle}[1]{\def\ECUST@title{#1}}
%ECUST@title默认值
\ECUSTtitle{\@title}
\newcommand{\ECUSTtype}[1]{\def\ECUST@type{#1}}
%% 定义摘要环境：
\newcommand{\ECUSTabstract}{\noindent\heiti摘要\songti：}
\newcommand{\ECUSTkeywords}{\noindent\heiti关键词\songti：}

%插入浮动表格
\newcommand{\ECUSTtable}[3]{
  \begin{table}[hbtp]
    \caption{#1}
    \centerline{#2}
    \label{#3}
  \end{table}
}

%插入浮动图片
\newcommand\ECUSTfigure[4][]{
  \begin{figure}[hbtp]
    \centerline{\includegraphics[#1]{#2}}
    \caption{#3}
    \label{#4}
  \end{figure}
}

%章节标题格式设置
\CTEXsetup[number={},name={,},beforeskip={-25bp},afterskip={18bp},titleformat={\setcounter{section}{0}\normalfont\zihao{-2}\heiti}]{chapter}

\ifthesis
\CTEXsetup[format={\clearpage\centering\zihao{-2}\heiti},beforeskip={12bp},afterskip={18bp}]{section}
\else
\CTEXsetup[format={\centering\zihao{-2}\heiti},beforeskip={12bp},afterskip={18bp}]{section}
\fi

\CTEXsetup[format={\zihao{4}\songti},beforeskip={18bp},afterskip={18bp}]{subsection}
\CTEXsetup[format={\zihao{-4}}\heiti,beforeskip={18bp},afterskip={18bp}]{subsubsection}
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{2}

%节编号设置
\counterwithout{section}{chapter}

%默认英文字体
\setmainfont{Times New Roman}

%% 设置
\iftranslation \ECUSTtype{（文献翻译）} \fi
\ifopenning \ECUSTtype{（开题报告）} \fi
\ifthesis \ECUSTtype{(毕业论文)} \fi

%% 页眉格式：
%    - 左上角是课题名，右上角是页码；页眉有下划线。
%% 页脚格式：
%    - 没有页脚
\newpagestyle{ecuststyle}{
  \mainmatter
  \sethead{\zihao{5}\ECUST@title\ECUST@type}{}{\thepage}
  \headrule
}

\newcommand{\coveritem}[2]{
  \makebox[2.5cm]{{\bf\zihao{-2}#1}}\quad\underline{\makebox[7cm]{\zihao{-2}\kaishu#2}}
}

\newcommand{\titlea}[1]{\def\cover@titlea{#1}}
\newcommand{\titleb}[1]{\def\cover@titleb{#1}}
\newcommand{\academy}[1]{\def\cover@academy{#1}}
\newcommand{\department}[1]{\def\cover@dept{#1}}
\newcommand{\major}[1]{\def\cover@major{#1}}
\newcommand{\grade}[1]{\def\cover@grade{#1}}
\newcommand{\num}[1]{\def\cover@num{#1}}
\newcommand{\name}[1]{\def\cover@name{#1}}
\newcommand{\mentor}[1]{\def\cover@mentor{#1}}
\newcommand{\finaldate}[1]{\def\cover@date{#1}}

\newpagestyle{ecustfrontstyle}{
  \frontmatter
  \pagenumbering{Roman}
  \setfoot{}{\thepage}{}
}


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

\newenvironment{abstract}[1]{
  \clearpage

  \vspace*{83pt}

  \newcommand{\@keywords}{#1}
  \begin{center}
    {\zihao{-2}\heiti摘要}
  \end{center}
  \par
}{
  \par
  \begin{description}
    \item[关键词：]\@keywords
    \end{description}
}

\newenvironment{enabstract}[1]{
  \clearpage

  \vspace*{83pt}

  \newcommand{\@keywords}{#1}
  \begin{center}
    {\zihao{-2}Abstract}
  \end{center}
  \par
}{
  \par
  \begin{description}
    \item[Keywords:]\@keywords
    \end{description}
    \par
}
