\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oxslides}[10-6-22 Oxford-branded beamer class by Simon Hulse]

\LoadClass{beamer}
\setbeamertemplate{navigation symbols}{}
\setbeamersize{text margin left=15pt}

\newif\ifmfbranding
\mfbrandingfalse
\DeclareOption{mfbranding}{\mfbrandingtrue}
\ProcessOptions\relax

% --- FONT CONFIG --------------------------------------------------------
\RequirePackage{fontspec}
\RequirePackage[math-style=ISO,bold-style=ISO]{unicode-math}

\setmainfont{FiraSans}[
    Path           = <FIRASANS>,%
    Extension      = .ttf,%
    UprightFont    = *-Regular,%
    BoldFont       = *-SemiBold,%
    ItalicFont     = *-Italic,%
    BoldItalicFont = *-BoldItalic,%
]

\setsansfont{FiraSans}[
    Path           = <FIRASANS>,%
    Extension      = .ttf,%
    UprightFont    = *-Regular,%
    BoldFont       = *-SemiBold,%
    ItalicFont     = *-Italic,%
    BoldItalicFont = *-BoldItalic,%
]

\setmathfont{FiraMath-Regular}[
    Path           = <FONTPARENT>,%
    Extension      = .otf,%
    Scale          = MatchLowercase,%
]

\setmonofont{FiraMono}[
    Path           = <FIRAMONO>,%
    Extension      = .ttf,%
    Scale          = MatchLowercase,%
    UprightFont    = *-Regular,%
    BoldFont       = *-Bold,%
]

% --- Maths support ------------------------------------------------------
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
% I use this command quite a lot so thought I would include it by default
\DeclareMathOperator*{\argmin}{arg\,min}

% --- Colour -------------------------------------------------------------
\RequirePackage{xcolor}
\definecolor{oxfordblue}{HTML}{002e60}

\ifmfbranding
    \pgfdeclareimage[width=\paperwidth]{header}{<MF_SLIDEHEADER>}
    \newcommand{\headingshift}{43}
\else
    \pgfdeclareimage[width=\paperwidth]{header}{<SLIDEHEADER>}
    \newcommand{\headingshift}{0}
\fi


\def\email#1{\gdef\@email{#1}}

% --- Itemize configuration ----------------------------------------------
\usepackage{enumitem}
% FID bullet
\setlist[itemize,1]{
    leftmargin=20pt,%
    label={\smash{\raisebox{-0.1\height}{\includegraphics{<FID_BULLET>}}}},%
}
\setlist[itemize,2]{
    leftmargin=15pt,%
    label={\smash{\raisebox{-0.1\height}{\includegraphics{<SPEC_BULLET>}}}},%
}

% --- Title slide format -------------------------------------------------
\setbeamertemplate{title page}
{
    \begin{picture}(0,0)
        \put(0,-120) {
            \begin{minipage}[b][4.5cm][t]{\textwidth}
                \centering
                {
                    \color{oxfordblue}
                    {\Large\textbf{\inserttitle}\\[0.7cm]}
                    {\textit{\insertauthor}\\}
                    {\footnotesize\texttt{\@email}\\[0.3cm]}
                    {\insertdate\\[0.3cm]}
                }
            \end{minipage}
      }
  \end{picture}
}


% --- General slide format -----------------------------------------------

\setbeamertemplate{headline}
{
   \begin{picture}(0,0)
       \put(0,-30){\pgfuseimage{header}}
   \end{picture}
}

\setbeamertemplate{footline}
{
   \begin{picture}(0,0)
       \put(0, 5){
           \makebox(356.195,0){
               {\color{oxfordblue}\insertshortdate\hfill\insertshorttitle\hfill Slide \insertframenumber}
           }
       }
   \end{picture}
}

\setbeamertemplate{frametitle}
{
  \begin{picture}(0,0)
      \put(\numexpr\headingshift-5,0){\bfseries\normalsize\color{white}\insertframetitle}
      \put(\numexpr\headingshift-5,-10){\tiny\bfseries\color{white}\insertframesubtitle}
  \end{picture}
}
