# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pympler/pympler-0.3.1.ebuild,v 1.14 2015/04/08 05:11:47 idella4 Exp $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3} )

inherit distutils-r1

MY_PN="Pympler"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Memory profiling for Python applications"
HOMEPAGE="http://code.google.com/p/pympler/ https://pypi.python.org/pypi/Pympler https://github.com/pympler/pympler"
SRC_URI="mirror://pypi/P/${MY_PN}/${MY_P}.tar.gz"

SLOT="0"
LICENSE="Apache-2.0"
KEYWORDS="alpha amd64 arm ia64 ppc ppc64 sparc x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="dev-python/bottle[${PYTHON_USEDEP}]"
DEPEND="test? ( ${RDEPEND} )"

S="${WORKDIR}"/${MY_P}

python_prepare_all() {
	rm pympler/util/bottle.py || die
	sed \
		-e '/import bottle/s:^.*$:import bottle:g' \
		-i pympler/web.py || die
	distutils-r1_python_prepare_all
}

python_test() {
	esetup.py try || die
}
