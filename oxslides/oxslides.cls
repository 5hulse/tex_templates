\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oxslides}[10-6-22 Oxford-branded beamer class by Simon Hulse]

\LoadClass{beamer}
\setbeamertemplate{navigation symbols}{}

\setbeamersize{text margin left=15pt}
% --- FONT CONFIG --------------------------------------------------------
\RequirePackage{fontspec}
\RequirePackage[math-style=ISO,bold-style=ISO]{unicode-math}

\setsansfont{FiraSans}[
    Path           = ../fonts/FiraSans/,%
    Extension      = .ttf,%
    UprightFont    = *-Regular,%
    BoldFont       = *-SemiBold,%
    ItalicFont     = *-Italic,%
    BoldItalicFont = *-BoldItalic,%
]

\setmathfont{FiraMath-Regular}[
    Path           = ../fonts/,%
    Extension      = .otf,%
    Scale          = MatchLowercase,%
]

\setmonofont{FiraMono}[
    Path           = ../fonts/FiraMono/,%
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

\pgfdeclareimage[width=\paperwidth]{header}{./theme_figures/slideheader.pdf}

\def\email#1{\gdef\@email{#1}}


% --- Title slide format -------------------------------------------------
\setbeamertemplate{title page}
{
    \begin{picture}(0,0)
        \put(0,-120) {
            \begin{minipage}[b][4.5cm][t]{\textwidth}
                \centering
                {
                    \color{oxfordblue}
                    {\Huge\textbf{\inserttitle}\\[0.5cm]}
                    {\textit{\insertauthor}\\}
                    {\footnotesize\texttt{\@email}\\[0.2cm]}
                    {\insertdate\\[0.2cm]}
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
      \put(-5,0){\bfseries\normalsize\color{white}\insertframetitle}
    \put(-5,-10){\tiny\bfseries\color{white}\insertframesubtitle}
  \end{picture}
}
