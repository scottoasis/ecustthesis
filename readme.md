EcustThesis
-----------

## Abstract

`EcustThesis` is a set of `LaTeX` templates for bachelor thesis in East
China University of Science and Technology (ECUST). It is design to
help you dealing with the format of your thesis. With the help of this
templates, you save your time on repeatingly formating your
papers. Currently, 3 templates are available: `Traslating`, `Openning`
and `Thesis`.


`EcustThesis` 是一份用于华东理工大学本科生毕业论文的 `LaTeX` 模板，
可以帮助论文作者更专注于论文内容，而将论文的排版交由程序自动处理。
目前 `EcustThesis` 包括了用于`文献翻译`、`开题报告`和`毕业论文`用途的模版，
使用者可以根据需要进行选择。


## Objectives

`EcustThesis` 的主要目标是为华东理工大学本科毕业生提供一套用于毕业设计的模板，
该模板的排版符合华东理工大学对本科生毕业论文的要求，且使用上接近 `LaTeX` 的
`article` 类，即使是 `LaTeX` 的初学者也能轻松上手。


## Current Progress

目前，`EcustThesis` 处于制作中，已经大致完成的有`文献翻译`和`开题报告`模板，
目前正在进行的工作：
1. 对现有模板进行修缮；
2. 修整、完善文档；
3. 针对模板细节的处理方式进行检讨。

### Versions

1.05 - __Current__ 添加了正式论文的封面和摘要部分。

1.01 - 修缮了文档。

1.00 - 项目初始版本。决定采用 `ctex`;合并了
      	[@raychenfj](https://github.com/raychenfj) 和
      	[@scottoasis](https://github.com/scottoasis) 的模板。



## How It Works

使用 `EcustThesis` 需要安装 `LaTeX` 环境。我们推荐您安装 `TeXLive 2013`，您可以在
[TeX Users Group](http://www.tug.org/texlive/) 下载到 `TeXLive`。
您也可以使用 `LaTeX` 的其他一些发行版本，比如 Windows 下常见的
[MikTeX](http://miktex.org) 或是曾经非常流行的 [CTeX](http://www.ctex.org)
等，然而我们更推荐您使用 `TeXLive`。

## Up and Running

首先您需要下载模板。您也可以通过下载
[zip](https://github.com/scottoasis/ecustthesis/archive/master.zip)
格式压缩包来获得 `EcustThesis`，然而通过 `git` 的方式更为简单，且更加方便更新。

    git clone https://github.com/scottoasis/ecustthesis.git

然后进入 `EcustThesis` 所在目录，

    cd ecustthesis

`EcustThesis` 中有一份 `sample.tex` 文件，这份样本是为了能让您更加了解如何使用
`EcustThesis` 而编写的。您可以通过编译和阅读这份样本来学习使用 `EcustThesis`。
编译样本。

    xelatex sample.tex

稍后您就可以在同一目录下看到一份 sample.pdf 文件，这就是样本的最终输出。

#### Notes For Using IDE

您可能希望使用一些集成了许多功能的编辑器来完成从编辑到输出 pdf 的所有工作，诸如 `WinEdt`
等都可以胜任此任务。您可以去其[官方网站](http://www.winedt.com/)了解具体信息。


### A Little Advanced Topics

在 `sample.tex` 中，我们提供了更多更详细的使用说明。您可以在 `sample.tex`
的基础上编写您的论文。


## Reference

[1] IShort: The Not So Short Introduction to LaTeX2e
[link](http://tobi.oetiker.ch/lshort/lshort.pdf)
[中文版](www.cfsm.cn/info/lshort-cn.pdf)

[2] The TeX Book (_FOR ADVANCED USERS ONLY_)
[link](pdfsizeopt.googlecode.com/files/texbook.pdf)

[3] Wikibooks [link](http://en.wikibooks.org/wiki/TeX)



## Licensing & Contributting

`EcustThesis` 是一个自由的开源项目，她遵循 `GNU Public License (GPL)`协议。
这意味着 `EcustThesis` 是自由、免费的，然而其开发者和维护者__无法__为您由于使用
`EcustThesis` 造成的损失承担责任。

> Copyright (c) 2013 `EcustThesis` team. You may not use this software
> except _in compliance with license_. You can obtain a copy of
> licence at [gnu.org](http://www.gnu.org/licenses/gpl.html). If you
> have any question, please feel free to contact us at
> [@ecustthesis](ecustthesis@gmail.com).

我们非常欢迎您加入 Ecustthesis 的开发和维护，您可以通过在 `github` 上 fork
Ecustthesis，或是给我们写[邮件](mailto://ecustthesis@gmail.com)提供您宝贵的意见。
请您帮助 Ecustthesis 成长，帮助[ECUST](http://www.ecust.edu.cn)，帮助开源社区。

