\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{anecdote-cover}[2016/11/30 v0.1.0 A class for creating book covers.]

\RequirePackage{pgfopts}
\RequirePackage{calc}

\newif\ifvarnishmask
\newif\ifshowframe

\newlength\BOOK@paperHeight
\newlength\BOOK@paperWidth
\newlength\BOOK@spineWidth
\newlength\onePageWidth

\pgfkeys{
  /BOOK/.is family, /BOOK,
  defaults/.style = {
    pageWidth = 6in,
    pageHeight = 9in,
    spineWidth = 10mm,
    varnishmask = false,
    showframe = false,
  },
  pageWidth/.code = {\setlength{\onePageWidth}{#1}},
  pageHeight/.code = {\setlength{\BOOK@paperHeight}{#1}},
  spineWidth/.code = {\setlength{\BOOK@spineWidth}{#1}},
  varnishmask/.is if = varnishmask,
  showframe/.is if = showframe,
}

% Pass all unknown options to memoir
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{memoir}
}

\ProcessPgfOptions{/BOOK}
\ProcessOptions\relax

\LoadClass[11pt,oneside,final]{memoir}

% === Class Core ===

\RequirePackage{xcolor}
\RequirePackage{eso-pic}
\RequirePackage{xcoffins}

\RequirePackage[final]{microtype}

\setlength{\BOOK@paperWidth}{2\onePageWidth+\BOOK@spineWidth}

\ifshowtrims
  \setlength{\stockheight}{\BOOK@paperHeight + 30mm}
  \setlength{\stockwidth}{\BOOK@paperWidth + 30mm}
  \setlength{\paperheight}{\BOOK@paperHeight}
  \setlength{\paperwidth}{\BOOK@paperWidth}
  \trimXmarks
  \trimLmarks
  \quarkmarks
  \settrims{0.5\stockheight - 0.5\paperheight}{0.5\stockwidth - 0.5\paperwidth}
  \settrimmedsize{\BOOK@paperHeight}{\BOOK@paperWidth}{*}
\else\relax
  \setstocksize{\BOOK@paperHeight}{\BOOK@paperWidth}
  \settrimmedsize{\stockheight}{\stockwidth}{*}
  \settrims{0pt}{0pt}
\fi

\setlrmarginsandblock{0pt}{0pt}{*}
\setulmarginsandblock{0pt}{0pt}{*}
\setheaderspaces{0pt}{*}{*}
\setheadfoot{0pt}{-10pt}

% This will also typeout values in pt (default)
\checkandfixthelayout
% It is useful to see layout values in mm too.
\settypeoutlayoutunit{mm}
\typeoutlayout

\midsloppy

\setlength{\parindent}{0pt}
\setlength{\parskip}{5pt}

\pagestyle{empty}

\newlength\BOOK@tmp@width
\newlength\BOOK@tmp@height

% #1 -- the commands to hold the place for
\newcommand\placeholder[1]{%
\ifvarnishmask%
\settowidth{\BOOK@tmp@width}{#1}%
\settototalheight{\BOOK@tmp@height}{#1}%
{\color{black}\rule{\BOOK@tmp@width}{\BOOK@tmp@height}}%
\else%
#1%
\fi%
}

\NewCoffin\pageWrap
\NewCoffin\coverFront
\NewCoffin\coverBack
\NewCoffin\coverSpine

\newcommand{\@t@pageWrapContent}{\mbox{}}
\newcommand{\@t@coverFrontContent}{\mbox{}}
\newcommand{\@t@coverBackContent}{\mbox{}}
\newcommand{\@t@coverSpineContent}{\mbox{}}

\newcommand{\SetPageWrap}[1]{\renewcommand{\@t@pageWrapContent}{#1}}
\newcommand{\SetCoverFront}[1]{\renewcommand{\@t@coverFrontContent}{#1}}
\newcommand{\SetCoverBack}[1]{\renewcommand{\@t@coverBackContent}{#1}}
\newcommand{\SetCoverSpine}[1]{\renewcommand{\@t@coverSpineContent}{#1}}

\newcommand\maybeFrame[1]{%
\ifshowframe%
  \frame{#1}%
\else  
  #1%
\fi}

\newcommand{\SetCoverCoffins}{%
\SetHorizontalCoffin\pageWrap{%
\begin{minipage}[b][\BOOK@paperHeight][t]{\BOOK@paperWidth}%
  \@t@pageWrapContent
\end{minipage}}

\SetHorizontalCoffin\coverFront{%
\maybeFrame{\begin{minipage}[b][\BOOK@paperHeight][t]{\onePageWidth}%
    \@t@coverFrontContent
\end{minipage}}}

\SetHorizontalCoffin\coverBack{%
\maybeFrame{\begin{minipage}[b][\BOOK@paperHeight][t]{\onePageWidth}%
    \@t@coverBackContent
\end{minipage}}}

\SetHorizontalCoffin\coverSpine{%
\maybeFrame{\begin{minipage}[b][\BOOK@spineWidth][c]{\BOOK@paperHeight}%
    \@t@coverSpineContent
\end{minipage}}}
}

\newcommand{\JoinCoverCoffins}{%
\RotateCoffin\coverSpine{-90}
\JoinCoffins*\pageWrap[l,t]\coverBack[l,t]
\JoinCoffins*\pageWrap[hc,t]\coverSpine[l,vc]
\JoinCoffins*\pageWrap[r,t]\coverFront[r,t]
}

\newcommand{\CoverPage}{%
  \mbox{}%
  \AddToShipoutPictureFG*{\put(0,0){\TypesetCoffin\pageWrap}}%
}

% End of anecdote-cover.cls
