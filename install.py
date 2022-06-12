# install.py
# Simon Hulse
# simon.hulse@chem.ox.ac.uk
# Last Edited: Mon 13 Jun 2022 00:28:55 BST

from distutils.dir_util import copy_tree
from pathlib import Path
import platform
from shutil import rmtree
import subprocess


texmfhome = Path(
    subprocess.run(
        ["kpsewhich", "-var-value=TEXMFHOME"],
        stdout=subprocess.PIPE,
        check=True,
    ).stdout.decode("utf-8").rstrip()
).resolve()

opsys = platform.system()
if opsys == "Linux":
    font_parent = Path("~/.fonts/").expanduser()
elif opsys == "Windows":
    font_parent = Path("~/AppData/Local/Microsoft/Windows/Fonts/").expanduser()

oxslides_dir = texmfhome / "tex/latex/local/oxslides"
oxslides_cls = oxslides_dir / "oxslides.cls"
themefigures_dir = oxslides_dir / "theme_figures"

if oxslides_dir.is_dir():
    rmtree(str(oxslides_dir))
copy_tree("oxslides", str(oxslides_dir))
copy_tree("fonts/", str(font_parent))


with open(oxslides_cls, "r") as fh:
    txt = fh.read()

replace_dict = {
    "<MF_SLIDEHEADER>": (themefigures_dir / "mf_slideheader.pdf").as_posix(),
    "<SLIDEHEADER>": (themefigures_dir / "slideheader.pdf").as_posix(),
    "<FID_BULLET>": (themefigures_dir / "fid_12pt_bullet.pdf").as_posix(),
    "<SPEC_BULLET>": (themefigures_dir / "spec_12pt_bullet.pdf").as_posix(),
    "<FIRASANS>": (font_parent / "FiraSans/").as_posix() + "/",
    "<FONTPARENT>": (font_parent).as_posix() + "/",
    "<FIRAMONO>": (font_parent / "FiraMono/").as_posix() + "/",
}
for key, value in replace_dict.items():
    txt = txt.replace(key, value)

with open(oxslides_cls, "w") as fh:
    fh.write(txt)
