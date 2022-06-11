LaTeX templates with Oxford branding \& (optionally) MF group branding

See `oxslides/oxslides_example.pdf` for an example.

**ALL OF THESE MUST BE COMPILED WITH** `xelatex`

# `oxslides`

##  Setting Up

The way to get this to work with the least faff will be to dump the template,
theme figures and fonts into the directory that you are going to make your
presentation in. This can be done as follows (on a UNIX system, I assume
Windows will work similarly via `cmd`/Powershell):

1. Clone this repo: `$ git clone https://github.com/foroozandehgroup/tex_templates.git`
2. Establish the parent directory that will contain the directory for your
   presentation. For example this could be something like
   `/home/simon/Documents/presentations`.
3. Copy the `oxslides` and `fonts` directories to the parent directory:
   `$ cp -r tex_templates/oxslides text_templates/fonts /home/simon/Documents/presentations/`
4. Go to the parent directory: `$ cd /home/simon/Documents/presentations/`
5. Rename the `oxslides` directory as the desired name of your presentation
   folder. For example: `$ mv oxslides 220610_project_update`
6. Move into the presentation directory: `cd 220610_project_update`
7. Rename `oxslides_example.tex`: `mv oxslides_example.tex 220610_project_update.tex`
8. Make the presentation by editing the `.tex` file!

## Usage

If you want MF group branding, declare the class with:
`documentclass[mfbranding]{oxslides}`. Otherwise, use:
`documentclass{oxslides}`.
