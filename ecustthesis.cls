\ProvidesClass{ecustthesis}[2013/05/09 ver. 1.05 SNAPSHOT]
% == 华东理工大学本科毕业论文格式模板 V1.05, last modified at 2013-05-09 == %
\NeedsTeXFormat{LaTeX2e}

%% ==== 模板基础设置 ====
%  cs4size - 默认（正文）字体大小为小四
%  a4paper - 大小为A4
%  oneside - 单面打印，不区分奇数页和偶数页
\LoadClass[cs4size,a4paper,oneside]{ctexbook}

%% ==== 模板可选参数，分别对应不同类型的模板 ====
%  translation - 文献翻译
%  openning    - 开题报告
%  no-params   - 正式论文
%
\newif\iftranslation\translationfalse
\newif\ifopenning\openningfalse
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

%  定义参考文献格式，使用 bibtex 进行参考文献的管理；
\bibliographystyle{GBT7714-2005NLang-UTF8}

%  定义论文标题的打印样式；
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

%% ==== 图表和公式编号格式 ====
%  图片 - 图 (3-2) 
%  表格 - 表 (3.2) 
%  公式 - (3-2)
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


%  定义图表标注的格式，字号为小五号，标号和标注之间用非断句空格符[non-breakable space](~)
%  分割；
\renewcommand{\captionlabeldelim}{~}
\renewcommand{\captionfont}{\bf\zihao{-5}}
\captionsetup{labelsep=quad}

%  定义页面布局
\geometry{left=2.5cm,right=2.5cm,top=2.8cm,bottom=2.5cm,headsep=0.6cm}

%  定义行间距为1.35倍，大致相当于 wrod 的1.5倍行距；
\renewcommand{\baselinestretch}{1.35}

%  定义段间距
\setlength{\parskip}{0pt}

%  定义参考文献条目间距
\setlength{\bibsep}{0pt}

%  定义列表条目间距
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=0pt,topsep=0pt}

%  定义标题
\newcommand{\ECUSTtitle}[1]{\def\ECUST@title{#1}}
\newcommand{\ECUSTtype}[1]{\def\ECUST@type{#1}}

%  定义摘要环境
\newenvironment{abstract}{
  \noindent
  {\heiti 摘要：}}{
  \vspace{0.2em} \\
  \noindent
  {\heiti 关键词：}\@keywords
  \vspace{1.2em}
}

%  定义
\newcommand\keywords[1]{
  \def\@keywords{#1} }

\newcommand{\ECUSTabstract}{\noindent\heiti摘要\songti：}
\newcommand{\ECUSTkeywords}{\noindent\heiti关键词\songti：}

%  插入浮动表格
\newcommand{\ECUSTtable}[3]{
  \begin{table}[hbtp]
    \caption{#1}
    \centerline{#2}
    \label{#3}
  \end{table}}

%  插入浮动图片
\newcommand\ECUSTfigure[4][]{
  \begin{figure}[hbtp]
    \centerline{\includegraphics[#1]{#2}}
    \caption{#3}
    \label{#4}
  \end{figure}
}

%  章节标题格式设置
\CTEXsetup[number={},name={,},beforeskip={-25bp},afterskip={18bp},titleformat={\thispagestyle{fancy}\setcounter{section}{0}\normalfont\zihao{-2}\heiti}]{chapter}
\CTEXsetup[format={\centering\zihao{-2}\heiti},beforeskip={12bp},afterskip={18bp}]{section}
\CTEXsetup[format={\zihao{4}\songti},beforeskip={18bp},afterskip={18bp}]{subsection}
\CTEXsetup[format={\zihao{-4}}\heiti,beforeskip={18bp},afterskip={18bp}]{subsubsection}
\setcounter{secnumdepth}{4}

%  节编号设置
\counterwithout{section}{chapter}

%  默认英文字体
\setmainfont{Times New Roman}

% 设置
\iftranslation \ECUSTtype{（文献翻译）} \fi
\ifopenning \ECUSTtype{（开题报告）} \fi

%% 页眉格式：
%    - 左上角是课题名，右上角是页码；页眉有下划线。
%% 页脚格式：
%    - 没有页脚
%\pagestyle{fancy}
%\fancyhead{}
%\fancyfoot{}
%\lhead{\zihao{5}\ECUST@title\ECUST@type}
%\rhead{\thepage}


