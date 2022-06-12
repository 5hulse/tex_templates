LaTeX templates with Oxford branding \& (optionally) MF group branding

Currently available:

* `oxslides` A class which inherits from `beamer`, for generating slideshows.
  See `examples/oxslides_example.pdf` for an example.

#  Setting Up

Simply running `install.py` with Python 3.8 or higher should set everything up
automatically. If the script fails, feel free to get in touch with me (Simon)
or raise an issue.

# Usage

**ALL OF THESE MUST BE COMPILED WITH** `xelatex`

If you want Foroozandeh group branding, declare the class with:
`documentclass[mfbranding]{oxslides}`. Otherwise, use:
`documentclass{oxslides}`.
