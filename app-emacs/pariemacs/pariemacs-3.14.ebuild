# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit elisp

DESCRIPTION="sci-mathematics/pari emacs mode"
HOMEPAGE="http://iml.univ-mrs.fr/~ramare/ServeurPerso/GP-PARI/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
SRC_URI="http://iml.univ-mrs.fr/~ramare/ServeurPerso/GP-PARI/latest-pari-distrib/${P}.tar.gz"

RDEPEND="sci-mathematics/pari"
DEPEND="${RDEPEND}"

S="${WORKDIR}"
SITEFILE="64${PN}-gentoo.el"
DOCS="README CHANGES"

src_prepare() {
	eapply "${FILESDIR}"/${P}-makefile.patch
	eapply_user
	cp /usr/share/doc/pari-*/pari.cfg.bz2 . || die "pari.cfg.bz2 not found"
	bunzip2 pari.cfg.bz2
}

src_compile() {
	make pari-conf.el
	make elc
}
