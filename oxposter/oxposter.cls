\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oxposter}[12-6-22 Oxford-branded poster class by Simon Hulse]

\newif\ifmfbranding
\mfbrandingfalse
\newif\ifcentertitle
\centertitlefalse
\DeclareOption{mfbranding}{\mfbrandingtrue}
\DeclareOption{centertitle}{\centertitletrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax

\LoadClass[25pt,a0paper,innermargin=10mm,blockverticalspace=10mm,colspace=10mm]{tikzposter}
\tikzposterlatexaffectionproofoff

\definecolorstyle{ox} {
    \definecolor{oxblue}{HTML}{002E60}
    \definecolor{white}{HTML}{ffffff}
    \definecolor{black}{HTML}{000000}
}{
    % Background colors
    \colorlet{backgroundcolor}{white}
    \colorlet{framecolor}{oxblue}
    % Title colors
    \colorlet{titlefgcolor}{white}
    \colorlet{titlebgcolor}{oxblue}
    % Block colors
    \colorlet{blocktitlebgcolor}{oxblue}
    \colorlet{blocktitlefgcolor}{white}
    \colorlet{blockbodybgcolor}{white}
    \colorlet{blockbodyfgcolor}{black}
}

\definetitlestyle{ox}{
    width=\textwidth,%
    roundedcorners=0,%
    linewidth=0pt,%
    titletotopverticalspace=0pt,%
}{
    \begin{scope}[
        line width=\titlelinewidth,%
        rounded corners=\titleroundedcorners,%
    ]
        \draw[color=blocktitlebgcolor,fill=titlebgcolor]
            (\titleposleft,\titleposbottom) rectangle (\titleposright,\titlepostop);
        \node[anchor=east] at (TP@title.east) {
            \includegraphics[height=\dimexpr\titlepostop-\titleposbottom]
            {<OXLOGO>}
        };
        \ifmfbranding
            \node[anchor=west] at (TP@title.west) {
                \includegraphics[height=\dimexpr\titlepostop-\titleposbottom]
                {<MFLOGO>}
            };
        \fi
    \end{scope}
}

\ifmfbranding
    \settitle{
        \centering
        \parbox{0.65\linewidth}{%
            \centering
            \color{titlefgcolor}
            {\Huge \textbf{\@title} \par}
            \vspace*{0.8em} {\huge \textit{\@author} \par}
            \vspace*{0.8em} {\LARGE \@institute}
        }
    }
\else\ifcentertitle
    \settitle{
        \centering
        \parbox{0.65\linewidth}{%
            \centering
            \color{titlefgcolor}
            {\Huge \textbf{\@title} \par}
            \vspace*{0.8em} {\huge \textit{\@author} \par}
            \vspace*{0.8em} {\LARGE \@institute}
        }
    }
\else
    \settitle{
        \parbox{\dimexpr\linewidth-450pt}{%
            \centering
            \color{titlefgcolor}
            {\Huge \textbf{\@title} \par}
            \vspace*{0.8em} {\huge \textit{\@author} \par}
            \vspace*{0.8em} {\LARGE \@institute}
        }
    }
\fi
\fi


\defineblockstyle{ox}{
    titlewidthscale=1,%
    bodywidthscale=1,%
    titleleft,%
    linewidth=4pt,%
}{
    \draw[
        color=framecolor,%
        fill=blockbodybgcolor,%
        line width=\blocklinewidth,%
    ] (blockbody.south west) rectangle (blockbody.north east);
    \ifBlockHasTitle
    \draw[
        color=framecolor,%
        fill=blocktitlebgcolor,%
        line width=\blocklinewidth,%
    ] (blocktitle.south west) rectangle (blocktitle.north east);
    \fi
}

\definelayouttheme{oxposter}{
    \usecolorstyle{ox}
    \usebackgroundstyle{Default}
    \usetitlestyle{ox}
    \useblockstyle{ox}
    \useinnerblockstyle{Table}
    \usenotestyle{Corner}
}
\usetheme{oxposter}

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
