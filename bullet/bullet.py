# bullet.py
# Simon Hulse
# simon.hulse@chem.ox.ac.uk
# Last Edited: Sat 11 Jun 2022 12:03:13 BST

import nmrespy as ne
import matplotlib.pyplot as plt
import numpy as np


def expand_limits(ax, scale=0.02):
    xlim = ax.get_xlim()
    xwidth = xlim[1] - xlim[0]
    ax.set_xlim(xlim[0] - scale * xwidth, xlim[1] + scale * xwidth)
    ylim = ax.get_ylim()
    ywidth = ylim[1] - ylim[0]
    ax.set_ylim(ylim[0] - scale * ywidth, ylim[1] + scale * ywidth)


def make_bullet(arr, pt, file_prefix=None):
    figdim = 0.15 / 12 * pt
    fig = plt.figure(figsize=(figdim, figdim), frameon=False)
    ax = fig.add_axes([0, 0, 1, 1], frameon=False)
    plt.axis("off")
    ax.plot(arr.real, color="#002e60", lw=0.07 * pt, solid_capstyle="round")
    expand_limits(ax)

    fname = f"{pt}pt_bullet.pdf"
    if file_prefix is not None:
        fname = f"{file_prefix}_{fname}"
    fig.savefig(fname)


if __name__ == "__main__":
    expinfo = ne.ExpInfo(1, 100., default_pts=256)
    fid_params = np.array([[1, 0, 1.7, 1]], dtype="float64")
    spec_params = np.array(
        [
            [1, 0, -25, 17],
            [2, 0, 0, 17],
            [1, 0, 25, 17],
        ]
    )
    fid = expinfo.make_fid(fid_params)
    spec = expinfo.make_fid(spec_params)
    spec[0] /= 2
    spec = ne.sig.ft(spec)
    for pt in (12, 25):
        make_bullet(fid, pt, "fid")
        make_bullet(spec, pt, "spec")
