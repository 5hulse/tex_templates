LaTeX templates with Oxford branding \& (optionally) MF group branding

Currently available:

* `oxslides` A class which inherits from `beamer`, for generating slideshows.
  See `examples/oxslides_example.pdf`.
* `oxposter` A `tikzposter` style, for generating A0 posters. See
  `examples/oxposter_example.pdf`

#  Setting Up

```
simon@computer:~$ git clone https://github.com/foroozandehgroup/tex_templates.git
simon@computer:~$ cd tex_templates
simon@computer:~/tex_templates$ python3.8 install.py  # Python3.8 or higher needed.
```

# Usage

**ALL OF THESE MUST BE COMPILED WITH** `xelatex`

## `oxslides`

### Options

* `mfbranding` As well as the Oxford logo on the right of the slide header, the
  MF group logo will be placed on the left of the slide header.

### Basic setup

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

### Options

* `mfbranding` As well as the Oxford logo on the right of the title, the MF
  group logo will be place to the left of the title.
* `centertitle` If `mfbranding` is not given, by default the title will be
  slightly shifted from center. Including the `centertitle` option will center
  the title.

### Basic setup

The title can be a bit tricky to setup. I recommend you use the following
command:
```
\title{\parbox{0.8\linewidth}{\centering<YOUR TITLE HERE>}}
```

```
% MF Group branding
\documentclass[mfbranding]{oxposter}
% Only Oxford branding, title slightly displaced fto left of poster center.
% \documentclass{oxposter}
% Only Oxford branding, title is centered.
% \documentclass[centertitle]{oxposter}

\title{TITLE}
\author{AUTHOR}
\institute{INSTITUTE}

\begin{document}
    \maketitle
    ...
\end{document}
```
