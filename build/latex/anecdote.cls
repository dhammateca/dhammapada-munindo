% Anecdote Class
%
% A memoir-based documentclass
%
% https://github.com/profound-labs/anecdote
%
% (c) Gambhiro Bhikkhu, 2016
% gambhiro.bhikkhu.85@gmail.com
%
% LPPL LaTeX Pubic Project Licence
%

% ==============
% Identification
% ==============

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{anecdote}[2016/05/05 v0.10 A memoir-based documentclass.]

% ========================
% Preliminary Declarations
% ========================
\newif\ifwebversion
\webversionfalse

% =======
% Options
% =======

\RequirePackage{pgfopts}
\RequirePackage{calc}

\pgfkeys{
  /BOOK/.cd,
  babelLanguage/.default=british,
  babelLanguage/.store in=\BOOK@babelLanguage,
  webversion/.code=\webversiontrue,
}

% Pass all unknown options to memoir
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{memoir}
}

\ProcessPgfOptions{/BOOK}
\ProcessOptions\relax

% ======================
% All Other Declarations
% ======================

\LoadClass[11pt,twoside]{memoir}

% === Book Core ===

\RequirePackage[\BOOK@babelLanguage]{babel}
\RequirePackage{nag}
\RequirePackage{xparse}
\RequirePackage{soul}
\RequirePackage{textcomp}
% Default color model is 'natural' which keeps all colors in their model.
\RequirePackage{xcolor}
\RequirePackage{xcoffins}
\RequirePackage{graphicx}
% Add your \graphicspath declaration to your local style.
\RequirePackage{eso-pic}
\RequirePackage{ccicons}
\RequirePackage{multicol}
\RequirePackage{ifthen}
\RequirePackage{titletoc}
\RequirePackage{enumitem}
\RequirePackage{tikz}
\usetikzlibrary{positioning}

% === Define colors ===

\definecolor{textbody}{gray}{0.15}
\definecolor{footnoterule}{gray}{0.5}
\definecolor{chapternum}{gray}{0.8}
\definecolor{chaptertitle}{gray}{0.3}
\definecolor{chapterauthor}{gray}{0.3}
\definecolor{chapternote}{gray}{0.3}
\definecolor{section}{gray}{0.3}
\definecolor{tocleftside}{gray}{0.5}
\definecolor{tocleftsidepart}{gray}{0.2}
\definecolor{partname}{gray}{0.5}
\definecolor{parttitle}{gray}{0.5}
\definecolor{linkborder}{rgb}{0.4,0.4,1}% light blue
\definecolor{link}{rgb}{0.2,0.2,1}% not so light blue

% === Load fonts ===

% Dummy font commands to use system defaults instead of custom fonts

%\newcommand\crimsonRomanFont{}
\newcommand\crimsonRomanFontOldNum{}
\newcommand\gentiumFont{}
\newcommand\headerFont{}
%\newcommand\footFont{}
\newcommand\pageNumFont{}
\newcommand\partTitleFont{}
%\newcommand\chapterNameFont{}
%\newcommand\chapterTitleFont{}
%\newcommand\chapterNumberFont{}
\newcommand\chapterAuthorFont{}
\newcommand\chapterNoteFont{}
\newcommand\sectionFont{}
\newcommand\tocFont{}
\newcommand\tocFontOldNum{}

\RequirePackage{fontspec}
\defaultfontfeatures{ Ligatures={TeX}, Path = {./assets/fonts/}, }

% If -- dashes don't work for your font, try
% Renderer = Basic
% http://tex.stackexchange.com/questions/20580/how-to-enable-ligatures-for-emdash-endash-in-luatex

\setmainfont[
  SmallCapsFeatures = { LetterSpace = 0.2 },
  ItalicFont = Crimson-Italic.otf,
  BoldFont = Crimson-Semibold.otf,
  BoldItalicFont = Crimson-SemiboldItalic.otf,
  Numbers = OldStyle,
]{Crimson-Roman.otf}

\newfontfamily\crimsonRomanFont[
  SmallCapsFeatures = { LetterSpace = 0.2 },
  ItalicFont = Crimson-Italic.otf,
  BoldFont = Crimson-Semibold.otf,
  BoldItalicFont = Crimson-SemiboldItalic.otf,
  Numbers = OldStyle,
]{Crimson-Roman.otf}

\newfontfamily\alegreyaSansFont[
  SmallCapsFont = AlegreyaSansSC-Regular.otf,
  ItalicFont = AlegreyaSans-Italic.otf,
  BoldFont = AlegreyaSans-Bold.otf,
]{AlegreyaSans-Regular.otf}

\newfontfamily\alegreyaSansLightFont[
  SmallCapsFont = AlegreyaSansSC-Light.otf,
  ItalicFont = AlegreyaSans-LightItalic.otf,
]{AlegreyaSans-Light.otf}

\newfontfamily\alegreyaSansScFont[
  ItalicFont = AlegreyaSansSC-Italic.otf,
]{AlegreyaSansSC-Regular.otf}

\newfontfamily\alegreyaSansScLightFont[
  ItalicFont = AlegreyaSansSC-LightItalic.otf,
]{AlegreyaSansSC-Light.otf}

\newfontfamily\sanghaIconsFont{SanghaIcons-Regular.ttf}
\newcommand\SanghaIcons{\sanghaIconsFont}

\newcommand\footerFont\alegreyaSansLightFont

% chapter

\newcommand\chapterNameFont\alegreyaSansLightFont
\newcommand\chapterTitleFont\alegreyaSansLightFont
\newcommand\chapterNumberFont\alegreyaSansFont

% Some default font sizes, use \renewcommand to adjust

\newcommand{\chapterNameSize}
  {\@setfontsize\chapterNameSize{22}{24}}
\newcommand{\chapterNumberSize}{}
\newcommand{\chapterTitleSize}{}
\newcommand{\chapterAuthorSize}
  {\@setfontsize\chapterAuthorSize{12}{14}}
\newcommand{\chapterNoteSize}
  {\@setfontsize\chapterNoteSize{10}{13}}
\newcommand{\footerSize}
  {\@setfontsize\footerSize{9}{9}}
%\newcommand{\headerSize}
%  {\@setfontsize\headerSize{10}{10}}
\newcommand{\pageNumSize}
  {\@setfontsize\pageNumSize{10}{12}}

% section

%\newcommand\sectionFont\fontinSansFont

\newcommand{\sectionSize}
  {\@setfontsize\sectionSize{13}{15}}

% other sizes

\newcommand{\smaller}
  {\@setfontsize\smaller{9}{11}}

\newcommand{\copyrightsize}
  {\@setfontsize\copyrightsize{9}{11}}

% foreign language wrappers

%\newfontfamily\thaiFont{Kinnari.ttf}

%\newcommand*\thai[1]{{\thaiFont #1}}

% other fonts

%\newcommand\questionAnswerFont\fontinSansFont

% === microtype ===

\RequirePackage[final,babel=true]{microtype}

% \SetTracking family=x works by name ("Glacial Indifference") or the automatic
% lookup name ("GlacialIndifference"), but not by \newfontfamily commands
% (such as \chapterTitleFont)

% Tracking for uppercase section heading
\SetTracking[spacing={400,100,}]{encoding=*, family={Crimson-Roman.otf}}{20}
\SetTracking[spacing={350,100,}]{encoding=*, family={AlegreyaSans-Light.otf}}{40}
\SetTracking[spacing={250,100,}]{encoding=*, family={AlegreyaSansSC-Regular.otf}}{1}
\SetTracking[spacing={250,100,}]{encoding=*, family={AlegreyaSansSC-Light.otf}}{1}

% === hyperref ===

\RequirePackage{hyperref}

\ifwebversion
% Web version: colored link text
\hypersetup{
  unicode=true,
  colorlinks=true,
  linkcolor=link,
  citecolor=link,
  filecolor=link,
  urlcolor=link
}
\else
% Print version: link colors to text color, so that it doesn't
% interfere with printing, but can still test is link targets work.
\hypersetup{
  colorlinks=true,
  unicode=true,
  linkcolor=textbody,
  citecolor=textbody,
  filecolor=textbody,
  urlcolor=textbody
}
\fi

\RequirePackage[
  open,
  openlevel=2
]{bookmark}

% === penalties and hyphenation ===

% Start with memoir's more allowing penalties
\midsloppy

\renewcommand\britishhyphenmins{{3}{3}}

% The lastparline or the parfillskip solution is overkill in many
% places. It is optimal for larger paragraphs, but creates too much
% strech in every other case, particulary not in the main text, such as
% the TOC and so on.
%
% It can be useful with a limited scope, but for general application it
% becomes more of a problem to check where it has gone too far in
% adjusting line breaks.

% lastparline:
%   ``Ensures that the last line of a paragraph is at least as long as the
%   double value of \parindent. When LuaTEX is used, the solution provided
%   by Patrick Gundlach is used. With other rendering engines, it is the
%   native solution provided by Enrico Gregorio that serves as an
%   implementation.''
% http://tex.stackexchange.com/questions/28357/ensure-minimal-length-of-last-line/

% Load with draft option to visualize inserted nobreaks.
% \RequirePackage[lastparline]{impnattypo}

% Alternatively, egreg's native solution:
% http://tex.stackexchange.com/a/28358/831
%\setlength{\parfillskip}{0pt plus\dimexpr\textwidth-2\parindent}

% Last line at least 20% of textwidth
%\parfillskip 0pt plus 0.8\textwidth

\RequirePackage[defaultlines=2,all]{nowidow}

% Penalties

% Use a bit less hyphenation to avoid many successive hyphens, at the expense of
% a bit more streching.
\hyphenpenalty=700% default = 50

\exhyphenpenalty=50
\doublehyphendemerits=900
%\finalhyphendemerits=5000% default = 5000

% It is more effective to \mbox{...} the words to avoid hyphenation.
% penalty for page break after a hyphenated line
\brokenpenalty=990% default = 100

% === common hyphenation exceptions and corrections ===

\hyphenation{season wisdom develop-ment respon-sible pheno-mena
philo-sophical munindo amaravati thai-land}

%\hyphenation{accur-ately argu-men-ta-tive attach Ayu-dhaya becomes
%ben-e-fi-cial capa-bil-ity car-ry car-ry-ing cere-monies cere-mony
%ces-sa-tion chal-lenge chal-leng-ing clas-si-fi-ca-tion
%clas-si-fi-ca-tions clas-si-fied com-mu-nity con-di-tion
%con-di-tioned con-struc-tions con-tem-plate con-tem-plat-ing
%con-tem-pla-tion cul-ti-vate cul-ti-vates cul-ti-vat-ing
%cul-ti-vation def-i-ni-tion de-ter-mine de-ter-mined dhamma dhammas
%dis-cern-ment dis-con-tent dis-cur-sive dying em-pha-size
%enlight-ened equa-nim-ity es-pe-cial-ly estab-lish exist-ence
%ex-pe-ri-ence hap-pen-ing having ig-no-rance immedi-ately
%im-per-ma-nent in-nu-mer-a-ble in-se-cu-ri-ty in-spir-ing
%in-struct-ed in-ves-ti-gate in-ves-ti-ga-tion iso-late iso-lat-ed
%Keuan lay-peo-ple ma-te-ri-al mat-u-ra-tion medi-tate medi-ta-tion
%medi-ta-tive mental mon-as-teries mon-as-tery Nana-chat or-dain
%or-dain-ed or-di-na-tion orig-inate oth-er-wise pene-trat-ing
%per-son-al per-son-al-ity phe-nom-e-na phe-nom-e-non po-si-tion
%pow-er pow-ers pre-vi-ous pro-lif-er-ate pro-lif-er-ating
%pro-lif-er-a-tions puthu-jjana quest-ion rec-i-ta-tion
%sat-is-fac-tory sen-sa-tion sen-sa-tions sim-i-lar suf-fer-ing
%sup-po-si-tion syn-on-y-mous tem-per-a-ment tem-per-a-ments tong-rat
%tran-scend tran-scend-ent tran-scends un-con-di-tioned under-stand
%under-stood un-hap-pi-ness un-sat-is-fac-tori-ness un-sat-is-fac-tory
%ven-er-able wea-ri-ness what-ev-er when-ever wher-ever whole-hearted
%whole-heart-edly wrong-do-ing}

% === soul settings ===

\sodef\soTocChapter{}{.1em}{.5em plus.1em}{.1em plus.1em minus.1em}
\sodef\soSection{}{.07em}{.4em plus.1em}{.1em plus.1em minus.1em}
% Use \textls letterspacing (for uppercase chapter titles for example)
% with microtype instead, because soul swallows
% accented characters at the end of words.

% === Custom commands and environments ===

\newcommand\dividerRule{%
{\centering\bigskip
{\color[gray]{0.6}\rule{0.6\linewidth}{0.2pt}}
\par\bigskip}%
}

\newcommand\emptysheet{%
  \cleardoublepage
  \thispagestyle{empty}\mbox{}\newpage
  \thispagestyle{empty}\mbox{}\newpage
}

\newcommand\emptydoublepage\emptysheet

\newcommand\emptypage{%
  \clearpage
  \thispagestyle{empty}\mbox{}\newpage
}

\newcommand*{\subtitle}[1]{\def\@thesubtitle{#1}}
\newcommand*{\editionInfo}[1]{\def\@theEditionInfo{#1}}
\newcommand*{\printedByInfo}[1]{\def\@thePrintedByInfo{#1}}
\newcommand*{\publisher}[1]{\def\@thePublisher{#1}}
\newcommand*{\ISBN}[1]{\def\@theISBN{#1}}

\newcommand\thesubtitle{\@thesubtitle}
\newcommand\theEditionInfo{\@theEditionInfo}
\newcommand\thePrintedByInfo{\@thePrintedByInfo}
\newcommand\thePublisher{\@thePublisher}
\newcommand\theISBN{\@theISBN}

\newsavebox{\quotepagebox}
\newenvironment{quotepage}[1]
  {\begin{lrbox}{\quotepagebox}\begin{minipage}{#1}
   \setlength{\parskip}{0.6\baselineskip}
   \setlength{\parindent}{0pt}}
  {\end{minipage}\end{lrbox}%
   \begin{tikzpicture}[remember picture,overlay]
   \node at (current page.center) {\usebox{\quotepagebox}};
   \end{tikzpicture}}

\newenvironment{packeditemize}%
{\begin{itemize}[
  itemindent=0pt,
  leftmargin=15pt,
  rightmargin=0pt,
  itemsep=4pt,
  topsep=0pt,
  parsep=0pt,
  partopsep=0pt,
]%
}{\end{itemize}}

\newcommand\speakerName[1]{%
  % The hangindent only works with alternating speakers.
  %\par\hangindent=1pc%
  {\color[gray]{0.25}\crimsonRomanFont\scshape\MakeLowercase{#1}}\quad}

\newlength\qw
\setlength\qw{17pt}% same as parindent for smallpage

\newcommand{\question}[1]{%
  \smallskip%
  \par\noindent\hangindent=\qw%
  \ifthenelse{\equal{#1}{}}{\textit{Q:}\space}{\textit{#1:}\space}%
}

\newcommand{\questionBi}[2]{%
  \smallskip%
  \par\noindent\hangindent=\qw%
  \textit{Q: #1}
  \smallskip%
  \par\noindent\hangindent=\qw%
  \textit{Q: #2}
}

\newcommand{\answer}[1]{%
  \smallskip%
  \par\noindent%
  \ifthenelse{\equal{#1}{}}{\textit{A:}\space}{\textit{#1:}\space}%
}

\newcommand{\QA}[1]{%
  {\questionAnswerFont\color[gray]{0.4} #1}\space
}

% If class option webVersion is used, show content in a paper sized
% minipage, empty page otherwise.
% Redefine \color{webcoverbg} to change page background color.
\newcommand\webcover[1]{%
\thispagestyle{empty}\mbox{}
\ifwebversion
\AddToShipoutPictureFG*{\put(0,0){%
\begin{minipage}[b][\paperheight][c]{\paperwidth}%
#1
\end{minipage}}}
\fi
\clearpage
}

\newcommand\photoFullBleed[1]{%
  \AddToShipoutPictureFG*{%
    \put(\LenToUnit{-3mm},\LenToUnit{-3mm}){%
      \includegraphics[height={\paperheight + 6mm}]{#1}%
    }%
  }%
}

\newcommand\photoSideBleed[1]{%
  \AddToShipoutPictureFG*{%
    \put(\LenToUnit{-3mm},\LenToUnit{0mm}){%
      \begin{minipage}[b][\paperheight][c]{\paperwidth + 6mm}%
        \includegraphics[width={\paperwidth + 6mm}]{#1}%
      \end{minipage}%
    }%
  }%
}

% glossary as item list

\newcommand*{\labelFmt}[2]{\normalfont\textbf{#1}, \textit{#2}.}

\newenvironment{glossarydescription}%
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\glossaryDescriptionlabel}}%
               {\endlist}
\newcommand*{\glossaryDescriptionlabel}[1]{%
  \hspace\labelsep
  \labelFmt #1%
}

% === Renewing package macros ===

\renewcommand*{\thechapter}{\@Roman\c@chapter}

\addtodef{\mainmatter}{}{%
  \addtocontents{toc}{\addvspace{18pt}}%
  \setcounter{chapter}{0}%
}

\addtodef{\appendix}{}{%
  \addtocontents{toc}{\addvspace{18pt}}%
  \bookmarksetup{startatroot}%
}

\addtodef{\backmatter}{}{%
  \addtocontents{toc}{\addvspace{18pt}}%
  \bookmarksetup{startatroot}%
}

\renewenvironment{quote}%
{\small
\list{}{\rightmargin\leftmargin}%
\item[]}%
{\endlist}

\newcommand\quoteref[1]{%
\par
{\footnotesize #1}
\par
}

\renewcommand\footnoterule{%
  \vspace*{\baselineskip}%
  \kern-3\p@
  {\color{footnoterule}\hrule height 0.25pt width \columnwidth}
  \kern2.6\p@}

\renewcommand*{\notesname}{Notes}
\renewcommand*{\notedivision}{\chapter{\notesname}}
%\renewcommand*{\notedivision}{\section*{\notesname}}
\renewcommand*{\pagenotesubhead}[3]{}
\renewcommand*{\notenumintext}[1]{\textsuperscript{\thinspace [#1]}}
\renewcommand{\prenoteinnotes}{\par\noindent\hangindent=17pt}
\renewcommand{\postnoteinnotes}{\par\vspace*{0.5\baselineskip}}

% === Page styles ===

\nouppercaseheads

% define page styles with names about "what it does"

\newcommand{\sepline}{%
  \hspace{6pt}%
  \raisebox{-0.3\baselineskip}{\rule{0.2pt}{1.2\baselineskip}}%
  \hspace{6pt}%
}

\newcommand{\sepdot}{%
  \hspace*{6pt}%
  $\cdot$%
  \hspace*{6pt}%
}

\makepagestyle{topbottomcentered}
\makeevenhead{topbottomcentered}{}{\textit{\rightmark}}{}
\makeevenfoot{topbottomcentered}{}{\thepage}{}
\makeoddhead{topbottomcentered}{}{\textit{\leftmark}}{}
\makeoddfoot{topbottomcentered}{}{\thepage}{}

\makepagestyle{bottomcorner}
\makeevenhead{bottomcorner}{}{}{}
\makeevenfoot{bottomcorner}{%
  \footerFont\footerSize%
  \thepage \sepline \leftmark%
}{}{}
\makeoddhead{bottomcorner}{}{}{}
\makeoddfoot{bottomcorner}{}{}{%
  \footerFont\footerSize%
  \rightmark \sepline \thepage%
}

\makepagestyle{bottomcenter}
\makeevenhead{bottomcenter}{}{}{}
\makeevenfoot{bottomcenter}{}{%
  \footerFont\footerSize%
  \thepage%
}{}
\makeoddhead{bottomcenter}{}{}{}
\makeoddfoot{bottomcenter}{}{%
  \footerFont\footerSize%
  \thepage%
}{}

% alias the pagestyles into semantic names, "where it is used"

\aliaspagestyle{normalpage}{bottomcenter}
\aliaspagestyle{chapter}{bottomcenter}
\aliaspagestyle{part}{empty}
\aliaspagestyle{afterpart}{empty}

\pagestyle{normalpage}

% === TOC settings ===

\maxtocdepth{section}

% Fixes Undefined control sequence error for \@chapapp@head
\renewcommand\chapternumberline[1]{\numberline{#1}}
\renewcommand\partnumberline[1]{\numberline{#1}}

% Fixes Missing number error when chapter number is not numeric, as in
% Appendix A
\let\ttll@appendix\ttll@chapter

\newcommand*\l@chapternote{\@nodottedtocline{0}{6pc}{1pc}{1pc}}

\def\@nodottedtocline#1#2#3#4#5#6{%
  \ifnum #1>\c@tocdepth \else
    %\vskip \z@ \@plus.2\p@
    \vspace*{-3pt}
    {\footnotesize\itshape\crimsonRomanFont
     \leftskip #2\relax
     \rightskip \@tocrmarg
     \advance\rightskip #3\relax
     \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #4\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#5}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{\,}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalsize\normalfont}%
     \par}%
  \fi}

\def\tocChapterNote#1{%
    \addcontentsline{toc}{chapternote}{%
    \noexpand\numberline{}#1}%
}

% Format:
% \titlecontents{ section }[ left ]
% { above-code }
% { numbered-entry-format }
% { numberless-entry-format }
% { filler-page-format }
% [ below-code ]

% the right TOC margin
\contentsmargin{0pt}

\newlength\tocLeftWidth
\setlength\tocLeftWidth{3.5pc}

% FIXME: the first Part heading in the TOC will also add that 20pt
% vspace. How to add it only before a Part that follows a Chapter?

\titlecontents{part}[\tocLeftWidth]
{\addvspace{20pt}%
\normalsize\tocFont}%
{%
  \contentsmargin{0pt}%
  \makebox[0pt][r]{%
  {\color{tocleftsidepart}\partname~\thecontentslabel}%
  \hspace*{0.5em}$\cdot$\hspace*{0.5em}}%
}
{\contentsmargin{0pt}}
{\hfill\normalsize\tocFont\thecontentspage}
[\addvspace{5pt}]

\titlecontents{chapter}[\tocLeftWidth]
{\normalsize\tocFont}%
{%
  \contentsmargin{0pt}%
  \makebox[0pt][r]{%
    {\color{tocleftside}%
    \tocFontOldNum\thecontentslabel}%
    \hspace*{0.5em}$\cdot$\hspace*{0.5em}%
  }%
}
{\contentsmargin{0pt}%
\itshape}
{\enspace\hfill\normalsize\tocFont\thecontentspage}
[\addvspace{5pt}]

\titlecontents{appendix}[\tocLeftWidth]
{\normalsize\tocFont}%
{%
  \contentsmargin{0pt}%
  \makebox[0pt][r]{%
    {\color{tocleftside}%
    \tocFontOldNum\thecontentslabel}%
    \hspace*{0.5em}$\cdot$\hspace*{0.5em}%
  }%
}
{\contentsmargin{0pt}%
\itshape}
{\hfill\normalsize\tocFont\thecontentspage}

\titlecontents{section}[\tocLeftWidth]
{\addvspace{-2pt}%
\small\tocFont}
{\contentslabel[\thecontentslabel]{\tocLeftWidth}}
{}
{\hfill\normalsize\tocFont\thecontentspage}

\titlecontents*{subsection}[\tocLeftWidth]
{\addvspace{-1pt}%
\small\tocFont}
{}
{}
{\ --- \thecontentspage}
[ \textbullet\ ][]

% === Book styles ===

% === Part styles ===

\newif\ifthisparthastitle
\thisparthastitletrue

\newif\ifthisparthasnote
\thisparthasnotefalse

\newcommand*{\thePartNote}{}
\newcommand*{\partNote}[1]{%
  \thisparthasnotetrue%
  \renewcommand*\thePartNote{#1}%
}

\renewcommand{\partnamefont}{\Huge\partTitleFont\color{partname}}
\renewcommand{\partnumfont}{\Huge\partTitleFont\color{partname}}
\renewcommand{\parttitlefont}{\large\partTitleFont\color{parttitle}\MakeUppercase}
\renewcommand*{\midpartskip}{\par\vskip 10pt}%

% FIXME: Currently, if there isn't a part title, we have to do
% \part{\space} to still create the part line in the TOC and the
% bookmark index.
%
% It would be better if the index had ``Part One'', and the TOC would
% handle it better too.

\long\def\@part[#1]#2{%
  \M@gettitle{#1}%
  \phantomsection
  \ifnum \c@secnumdepth >-2\relax
  \refstepcounter{part}%
  \addcontentsline{toc}{part}%
  {\protect\partnumberline{\thepart}#1}%
  \mempartinfo{\thepart}{#1}{#2}%
  \else
  \addcontentsline{toc}{part}{#1}%
  \mempartinfo{}{#1}{#2}%
  \fi
  \partmark{#1}%
  {%
    \raggedright
    \hspace*{\chapterTitleLeftSkip}%
    \begin{minipage}{\linewidth - \chapterTitleLeftSkip}
      \raggedright
      \interlinepenalty \@M
      \parskip\z@
      \ifthisparthasnote
        \thePartNote
        \par
        \global\thisparthasnotefalse
        \midpartskip
      \fi
      \normalfont
      \ifnum \c@secnumdepth >-2\relax
        \resizebox{2.8cm}{!}{\printpartname \partnamenum \printpartnum}
        \par\vskip 20pt
      \fi
      \ifthisparthastitle
        \printparttitle{#2}
      \else
        \global\thisparthastitletrue
      \fi
      \par%
    \end{minipage}%
    \par%
  }%
\@endpart}

% === Chapter styles ===

\setsecnumdepth{chapter}

% define chapter styles with "fantasy" names

\newif\ifchapterauthor
\chapterauthorfalse

\newcommand*{\theChapterAuthor}{}
\newcommand*{\chapterAuthor}[1]{%
  \chapterauthortrue%
  \renewcommand*{\theChapterAuthor}{#1}%
}

\newcommand\chapterAuthorFmt[1]{%
  \chapterAuthorFont\chapterAuthorSize\color{chapterauthor}%
  #1%
}

\newif\ifchapternote
\chapternotefalse

\newcommand\chapterNoteFmt[1]{%
  \chapterNoteFont\chapterNoteSize\color{chapternote}%
  \itshape #1%
}

\newcommand*{\theChapterNote}{}
\newcommand*{\chapterNote}[1]{%
  \chapternotetrue%
  \renewcommand*\theChapterNote{#1}%
}

\newif\ifchapterfootnote
\chapterfootnotefalse

\newcommand*{\theChapterFootnoteMark}{}
\newcommand*{\theChapterFootnoteText}{}
\newcommand*{\chapterFootnote}[2][\footnotemark]{%
  \chapterfootnotetrue%
  \renewcommand*\theChapterFootnoteMark{#1}%
  \renewcommand*\theChapterFootnoteText{\footnotetext{#2}}%
}

\newlength\chapterTitleLeftSkip
\setlength{\chapterTitleLeftSkip}{17pt}

\makechapterstyle{lowtitle}{
  \chapterstyle{default}
  \setlength{\beforechapskip}{30mm}
  \setlength{\chapterTitleLeftSkip}{0.2\linewidth}
  \renewcommand\printchaptername{}
  \renewcommand\chapternamenum{}
  \renewcommand\chapnumfont{\chapterNumberFont\chapterNumberSize\bfseries}
  \renewcommand\printchapternum{%
    \chapnumfont\color{chapternum}%
    \hspace*{\chapterTitleLeftSkip}\thechapter%
  }
  \setlength{\midchapskip}{18pt}% ~ chapter number size
  \renewcommand\afterchapternum{\par\nobreak\vskip \midchapskip}
  \renewcommand\printchapternonum{}
  \renewcommand\chaptitlefont{\chapterTitleFont\chapterTitleSize}
  \renewcommand*\printchaptertitle[1]{%
    \raggedright\hspace*{\chapterTitleLeftSkip}%
    \parbox{\linewidth - \chapterTitleLeftSkip}{%
      \raggedright\chaptitlefont\color{chaptertitle}%
      \textls*{\MakeUppercase{##1}}%
      \ifchapterfootnote%
        \hspace*{2pt}\theChapterFootnoteMark%
      \fi%
      \ifchapterauthor%
        \vskip 0.5\onelineskip%
        \chapterAuthorFmt{\theChapterAuthor}%
        \global\chapterauthorfalse%
      \fi%
      \ifchapternote%
        \vskip 0.5\onelineskip%
        \chapterNoteFmt{\theChapterNote}%
        \global\chapternotefalse%
      \fi%
    }%
    \ifchapterfootnote%
      \theChapterFootnoteText%
      \global\chapterfootnotefalse%
    \fi%
  }
  \setlength{\afterchapskip}{18pt}% ~ 2 * chapter title size
  \renewcommand\afterchaptertitle{\par\nobreak\vskip \afterchapskip}%
}

\makechapterstyle{hightitle}{
  \chapterstyle{lowtitle}
  % See Figure 6.1 in memoir manual, p.83
  \setlength{\beforechapskip}{12pt - \topskip}
}

\makechapterstyle{bellatrix}{%
  \chapterstyle{default}
  \setlength{\beforechapskip}{40mm}
  \setlength{\chapindent}{0.5in}
  \setlength{\midchapskip}{-2pt}
  \setlength{\afterchapskip}{32pt}
  \renewcommand\chapnumfont{%
    \chapterNumberFont%
    \chapterNumberSize%
    \color{chapternum}%
    \itshape%
  }
  \renewcommand\chapnamefont{\chapnumfont}
  \renewcommand\chaptitlefont{%
    \chapterTitleFont%
    \chapterTitleSize%
    \color{chaptertitle}%
    \upshape%
  }
  \renewcommand\afterchapternum{\par\nobreak\vspace*{\midchapskip}}
  \renewcommand\printchaptername{\hspace*{\chapindent}\chapnamefont \@chapapp}
  \renewcommand\chapternamenum{\space}
  \renewcommand\printchapternum{\chapnumfont \numtoName{\c@chapter}}
  \renewcommand\printchapternonum{\vspace*{-47pt}}
  \renewcommand*\printchaptertitle[1]{%
    \begin{adjustwidth}{\chapindent}{}
      \raggedright%
      {\chaptitlefont\textls{\MakeUppercase{##1}}}%
      \ifchapterfootnote%
        \hspace*{0.8mm}\theChapterFootnoteMark%
      \fi%
      \ifchapterauthor%
        \vskip 0.5\onelineskip%
        \chapterAuthorFmt{\theChapterAuthor}%
        \global\chapterauthorfalse%
      \fi%
      \ifchapternote%
        \vskip 0.5\onelineskip%
        \chapterNoteFmt{\theChapterNote}%
        \global\chapternotefalse%
      \fi%
    \end{adjustwidth}%
    \ifchapterfootnote%
      \theChapterFootnoteText%
      \global\chapterfootnotefalse%
    \fi%
  }
}

% Commands to assign the chapter styles to book parts. Use \renewcommand
% to adjust.

\newcommand\frontmatterChapterStyle{\chapterstyle{hightitle}}
\newcommand\mainmatterChapterStyle{\chapterstyle{lowtitle}}
\newcommand\appendixChapterStyle{\chapterstyle{hightitle}}
\newcommand\backmatterChapterStyle{\chapterstyle{hightitle}}

% append them to the macros
\addtodef{\frontmatter}{}{\frontmatterChapterStyle}
\addtodef{\mainmatter}{}{\mainmatterChapterStyle}
\addtodef{\appendix}{}{\appendixChapterStyle}
\addtodef{\backmatter}{}{\backmatterChapterStyle}

% === Section styles ===

% TODO: could use \makeheadstyles to keep bundle different chapter and
% section style together. See memoir manual '6.9 Predefined heading
% styles'.

\raggedbottomsection

\setbeforesecskip{-3.5ex \@plus -1ex \@minus -.2ex}
\setaftersecskip{2.3ex \@plus .2ex}

\newcommand\sectionFmt[1]{%
  \sectionFont\sectionSize\color{section}%
  \memRTLraggedright%
  \itshape #1%
}
\setsecheadstyle{\sectionFmt}

\setsubsecheadstyle{%
  \sectionFont\large\itshape\memRTLraggedright%
}
\setsubsubsecheadstyle{%
  \sectionFont\normalsize\itshape\memRTLraggedright%
}


% === Page geometry and layout ===

% Symbols used:
% P = page proportion (h/w)
% T = textblock proportion (d/m)
% w = paper width
% h = paper height
% m = text width
% d = text height

% Tall Small Page page size
%
% TODO A x B page
% P = 1.618 (Golden section)
% TODO T = ? 1.568181

\newlength\BOOK@paperHeight
\newlength\BOOK@paperWidth
\setlength{\BOOK@paperHeight}{155mm}
\setlength{\BOOK@paperWidth}{96mm}% 1.618

% === normalsize ===

\def\BOOK@apt{11}
\def\BOOK@bpt{14.5}% 1.3em

\renewcommand{\normalsize}{%
  \@setfontsize\normalsize\BOOK@apt\BOOK@bpt
  \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
  \belowdisplayskip \abovedisplayskip
  \color{textbody}
  \let\@listi\@listI}
\normalsize

\def\BOOK@readingFontSizePt{10.5}
\def\BOOK@readingLineHeightPt{13.5}

\newcommand{\readingsize}{%
  \@setfontsize\readingsize\BOOK@readingFontSizePt\BOOK@readingLineHeightPt
  \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
  \belowdisplayskip \abovedisplayskip
  \color{textbody}
  \let\@listi\@listI}

\def\longLine{All states of being are determined by the heart.}% 48 chars
\newlength\longLineWidth
%\setlength{\longLineWidth}{\widthof{\normalsize \longLine}}
%\typeout{Long line: \longLine}
%\typeout{Long line width at \BOOK@apt pt: \the\longLineWidth}
%% Long line width at 11pt: 198.15039pt, 69.9mm

\setlength{\longLineWidth}{70mm}

% === indentations ===

\setlength{\vgap}{1.5em}
\setlength{\vindent}{\vgap}
\setlength{\vleftmargin}{2em}

\setlength{\parskip}{0pt}
\setlength{\parindent}{15pt}

% === setup page layout ===

\ifshowtrims
  \stockaiv% use A4 paper size to show trims
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

\settypeblocksize{1.618\longLineWidth + 2\baselineskip}{\longLineWidth}{*}
\setlrmargins{15mm}{*}{*}
\setulmargins{30pt}{*}{*}
\setheadfoot{0pt}{20pt}

% This will also typeout values in pt (default)
\checkandfixthelayout
% It is useful to see layout values in mm too.
\settypeoutlayoutunit{mm}
\typeoutlayout

% === Packages to be loaded LAST ===

\RequirePackage[perpage,multiple,stable]{footmisc}

%% =================
%% PDF/X-3:2002 info
%% =================

% \pdfobjcompresslevel=0%
% \pdfminorversion=3%
% \pdfinfo{
%   /Title (\thetitle)
%   /Author (\theauthor)
%   /Subject (buddhism)
%   /Keywords (buddhism)
%   /GTS_PDFXVersion (PDF/X-3:2002)
% }%
% \pdfpageattr{
% /MediaBox [0 0 369.00000 594.00000]
% /BleedBox [0.00000 0.00000 369.00000 594.00000]
% /CropBox [0 0 369.00000 594.00000]
% /TrimBox [0.00000 0.00000 369.00000 594.00000]
% }
% \pdfcatalog{
%   /PageMode /UseNone
%   /OutputIntents [ <<
%     /Info (none)
%     /Type /OutputIntent
%     /S /GTS_PDFX
%     /OutputConditionIdentifier (Blurb.com)
%     /RegistryName (http://www.color.org/)
%   >> ]
% }%

%% ==============

