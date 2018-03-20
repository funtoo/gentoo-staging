# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )
inherit distutils-r1

DESCRIPTION="Powerful, accurate, and easy-to-use Python library for colorspace conversions"
HOMEPAGE="http://colorspacious.readthedocs.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~ppc ppc64 x86"
IUSE="test"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	app-arch/unzip
	test? ( dev-python/nose[${PYTHON_USEDEP}] )"

python_test () {
	nosetests --all-modules || die "Tests fail with ${EPYTHON}"
}
