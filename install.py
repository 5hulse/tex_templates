# install.py
# Simon Hulse
# simon.hulse@chem.ox.ac.uk
# Last Edited: Sun 12 Jun 2022 13:27:31 BST

from distutils.dir_util import copy_tree
from pathlib import Path
from shutil import rmtree
import subprocess


texmfhome = Path(
    subprocess.run(
        ["kpsewhich", "-var-value=TEXMFHOME"],
        stdout=subprocess.PIPE,
        check=True,
    ).stdout.decode("utf-8").rstrip("\n")
).resolve()

oxslides_dst = texmfhome / "tex/latex/local/oxslides"
if oxslides_dst.is_dir():
    rmtree(str(oxslides_dst))
copy_tree("oxslides", str(oxslides_dst))

with open(oxslides_dst / "oxslides.cls", "r") as fh:
    txt = fh.read()
txt = txt.replace("theme_figures", str(oxslides_dst / "theme_figures"))
with open(oxslides_dst / "oxslides.cls", "w") as fh:
    fh.write(txt)
