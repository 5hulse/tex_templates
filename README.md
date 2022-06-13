LaTeX templates with Oxford branding \& (optionally) MF group branding

Currently available:

* `oxslides` A class which inherits from `beamer`, for generating slideshows.
  See `examples/oxslides_example.pdf`.
* `oxposter` A `tikzposter` style, for generating A0 posters. See
  `examples/oxposter_example.pdf`

#  Setting Up

Simply running `install.py` with Python 3.8 or higher should set everything up
automatically. If the script fails, feel free to get in touch with me (Simon)
or raise an issue.

# Usage

**ALL OF THESE MUST BE COMPILED WITH** `xelatex`

## `oxslides`

Basic setup:

```
% MF group branding
\documentclass[mfbranding]{oxslides}
% Only Oxford branding
% \documentclass{oxslides}

\title{TITLE}
\author{AUTHOR}
\email{EMAIL}
\date{DATE}

\begin{document}
    \begin{frame}
        \maketitle
    \end{frame}

    ...

\end{document}
```

## `oxposter`

Basic setup:

```
\documentclass[25pt,a0paper]{tikzposter} % Add any other options to `tikzposter` as desired.
\usepackage{oxposter}
\usetheme{oxposter}

\title{TITLE}
\author{AUTHOR}
\institute{INSTITUTE}

\begin{document}
    \maketitle
    ...
\end{document}
```
