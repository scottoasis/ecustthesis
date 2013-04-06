%华东理工大学本科毕业论文格式模板 V1.00%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ecustthsis}

%基于ctexbook类
\LoadClass[cs4size,a4paper,oneside]{ctexbook}

%模板可选参数
\newif\iftranslation\translationfalse
\newif\ifopenning\openningfalse
\DeclareOption{translation}{\translationtrue}
\DeclareOption{openning}{\openningtrue}
\ProcessOptions\relax

%引用宏包
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

%参考文献格式
\bibliographystyle{GBT7714-2005NLang-UTF8}

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

%图表编号格式
\@addtoreset{figure}{section}
\renewcommand{\thefigure}{
  \ifnum \c@section>\z@ \thesection-\fi\@arabic\c@figure}

\@addtoreset{table}{section}
\renewcommand{\thetable}{
  \ifnum \c@section>\z@ \thesection.\fi\@arabic\c@table}

\@addtoreset{equation}{section}
\renewcommand{\theequation}{
  \ifnum \c@section>\z@ \thesection-\fi\@arabic\c@equation}

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

%自定义宏
\newcommand{\ECUSTtitle}[1]{\def\ECUST@title{#1}}
\newcommand{\ECUSTtype}[1]{\def\ECUST@type{#1}}
\newcommand{\ECUSTabstract}{\noindent\heiti摘要\songti：}
\newcommand{\ECUSTkeywords}{\noindent\heiti关键词\songti：}

%插入浮动表格
\newcommand{\ECUSTtable}[3]{
  \begin{table}[hbtp]
    \caption{#1}
    \centerline{#2}
    \label{#3}
  \end{table}}

%插入浮动图片
\newcommand\ECUSTfigure[4][]{
  \begin{figure}[hbtp]
    \centerline{\includegraphics[#1]{#2}}
    \caption{#3}
    \label{#4}
  \end{figure}
}

%章节标题格式设置
\CTEXsetup[number={},name={,},beforeskip={-25bp},afterskip={18bp},titleformat={\thispagestyle{fancy}\setcounter{section}{0}\normalfont\zihao{-2}\heiti}]{chapter}
\CTEXsetup[format={\centering\zihao{-2}\heiti},beforeskip={12bp},afterskip={18bp}]{section}
\CTEXsetup[format={\zihao{4}\songti},beforeskip={18bp},afterskip={18bp}]{subsection}
\CTEXsetup[format={\zihao{-4}}\heiti,beforeskip={18bp},afterskip={18bp}]{subsubsection}
\setcounter{secnumdepth}{4}

%节编号设置
\counterwithout{section}{chapter}

%默认英文字体
\setmainfont{Times New Roman}

\iftranslation
\ECUSTtype{（文献翻译）}
\fi
\ifopenning
\ECUSTtype{（开题报告）}
\fi


%页眉页脚
\pagestyle{fancy}
\fancyhead{}
\fancyfoot{}
\lhead{\zihao{5}\ECUST@title\ECUST@type}
\rhead{\thepage}
