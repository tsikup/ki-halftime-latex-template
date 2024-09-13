% Variables to set
\newcommand{\halftimedate}{Date}
\newcommand{\halftimelocation}{Location}
\newcommand{\studentname}{Name Surname} % Name of student
\newcommand{\studentpostfix}{Postfix} % Education or any other postfix of student
\newcommand{\department}{Department} % Department name
\newcommand{\university}{Karolinska Institutet} % University name
\newcommand{\phdtitle}{PhD project title} % Title of PhD project
\newcommand{\supervisor}{Name Surname}
\newcommand{\supervisortitle}{Prof. MD PhD}
\def\cosupervisors{
{Name Surname, Prof. MD PhD},
{Name Surname, Prof. MD PhD}
}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kihalftimedefaultfonts}[2024/09/11 Half-time report class]

\LoadClass{article}
\RequirePackage{titlesec}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{fontspec}
\RequirePackage{lastpage}
\RequirePackage{tocloft}
\RequirePackage{tikz}
\RequirePackage{etoolbox}
\RequirePackage{newclude}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\RequirePackage{ifplatform}
\RequirePackage{cleveref}

% document size
\geometry{
 a4paper,
 % total={170mm,257mm},
 left=40mm,
 top=30mm,
 right=32mm,
 bottom=20mm,
 headsep=13mm,
}

\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black
}

% Font size
\newcommand{\headersize}{\fontsize{10}{11}\selectfont}
\newcommand{\tocsize}{\fontsize{11}{12}\selectfont}
\newcommand{\titlesize}{\fontsize{20}{22}\selectfont}
\newcommand{\normaltitlessize}{\fontsize{16}{25}\selectfont}
\newcommand{\mediumtitlessize}{\fontsize{14}{25}\selectfont}
\newcommand{\smalltitlessize}{\fontsize{12}{13}\selectfont}
\newcommand{\largesectionsize}{\fontsize{20}{22}\selectfont}
\newcommand{\sectionsize}{\fontsize{16}{18}\selectfont}
\newcommand{\subsectionsize}{\fontsize{14}{15}\selectfont}
\newcommand{\subsubsectionsize}{\fontsize{12}{13}\selectfont}
\newcommand{\tocsectionsize}{\fontsize{12}{13}\selectfont}
\renewcommand{\normalsize}{\fontsize{12}{13}\selectfont}


% Title page
\renewcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \let\newpage\relax%
  % \null\vfil
  \vspace{3cm}
  \vskip 60\p@
  \begin{flushleft}%
    {\titlesize\sffamily\selectfont \textbf{\@title} \par}%
    \vskip 3em%
    {\normaltitlessize\sffamily\selectfont \textit{Doctoral student:} \par}
    {\normaltitlessize\sffamily\selectfont \studentname, \studentpostfix \par}
    {\mediumtitlessize\sffamily\selectfont \department, \university \par}
    \vskip 3em%
    {\normaltitlessize\sffamily\selectfont \textit{Title of doctoral project:} \par}
    {\normaltitlessize\sffamily\selectfont \phdtitle \par}
    \vskip 7em%
    {\smalltitlessize\sffamily\selectfont \textit{Principle supervisor:} \supervisor, \supervisortitle \par}
    \foreach \x in \cosupervisors
    {
       {\smalltitlessize\sffamily\selectfont \textit{Co-supervisor:} \detokenize\expandafter{\x} \par}
    }
    \vskip 2em%
    {\smalltitlessize Date of half-time review: \halftimedate \par}
    {\smalltitlessize Location: \halftimelocation \par}
  \end{flushleft}\par
  \@thanks
  \vfil
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \setcounter{page}{-1}
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  }


% Title formatting
\titleformat{\section}{\normalfont\Large\bfseries}{\thesection}{1em}{}

% TOC upper case
\AtBeginDocument{%
  \let\mtcontentsname\contentsname
  \renewcommand\contentsname{\sectionsize\normalfont\sffamily\MakeUppercase\mtcontentsname}
}
\renewcommand{\cftsecfont}{\sffamily}
\renewcommand{\cftsecfont}{\tocsize\sffamily\tocsectionsize} %

% Header and footer
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{
\sffamily
\color{gray}
\headersize
Half-time report, \studentname
}
\fancyhead[R]{
\sffamily
\color{gray}
\headersize
\thepage \space (\pageref{LastPage})
}

% Sections
\newcommand*{\mysection}[1]{%
  \section*{#1}%
  \addcontentsline{toc}{section}{#1}
}

\renewcommand\section{%
  \@startsection{section}{1}
                {\z@}%
                {-3.5ex \@plus -1ex \@minus -.2ex}%
                {2.3ex \@plus.2ex}%
                {\sffamily\sectionsize\bfseries}% 11pt
}

\renewcommand\subsection{%
  \@startsection{subsection}{1}
                {\z@}%
                {-3.5ex \@plus -1ex \@minus -.2ex}%
                {2.3ex \@plus.2ex}%
                {\sffamily\subsectionsize\bfseries}% 11pt
}

\renewcommand\subsubsection{%
  \@startsection{subsubsection}{1}
                {\z@}%
                {-3.5ex \@plus -1ex \@minus -.2ex}%
                {2.3ex \@plus.2ex}%
                {\sffamily\subsubsectionsize\bfseries}% 11pt
}

\newcommand\mylargesection{%
  \@startsection{section}{1}
                {\z@}%
                {-3.5ex \@plus -1ex \@minus -.2ex}%
                {2.3ex \@plus.2ex}%
                {\sffamily\largesectionsize\bfseries}% 11pt
}


% Abbreviations itemize
\newlist{abbreviations}{itemize}{1}
\setlist[abbreviations,1]{leftmargin=0pt, label={}, itemsep=1pt}

\newlist{outcomes}{itemize}{1}
\setlist[outcomes,1]{leftmargin=1.4cm, label=\textbullet, itemsep=1pt}
\setlist[outcomes,2]{label=\textopenbullet, itemsep=1pt}
\setlist[outcomes,3]{label=$\blacktriangleright$, itemsep=1pt}
\setlist[outcomes,4]{label=$\smalltriangleright$, itemsep=1pt}


\endinput