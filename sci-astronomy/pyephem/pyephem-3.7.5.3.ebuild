# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-astronomy/pyephem/pyephem-3.7.5.3.ebuild,v 1.5 2015/06/09 07:05:06 ago Exp $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Astronomical routines for the python programming language"
HOMEPAGE="http://rhodesmill.org/pyephem/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 ~ppc x86 ~amd64-linux ~x86-linux"
IUSE="doc test"

DEPEND="
	doc? ( dev-python/sphinx )"
RDEPEND=""

src_prepare() {
	# don't install rst files
	sed -i -e "s:'doc/\*\.rst',::" setup.py || die
	distutils-r1_src_prepare
}

src_compile() {
	distutils-r1_src_compile
	if use doc; then
		PYTHONPATH=. emake -C ephem/doc html
	fi
}

python_test() {
	if [[ ${PYTHON_ABI} == "2.7" ]]; then
		PYTHONPATH="$(ls -d ${BUILD_DIR}/lib*)" \
			${EPYTHON} -m unittest discover -s src/ephem
	else
		PYTHONPATH="$(ls -d ${BUILD_DIR}/lib*)" \
			unit2 discover -s src/ephem
	fi
}

src_install() {
	distutils-r1_src_install
	use doc && dohtml -r ephem/doc/_build/html/*

	delete_tests() {
		rm -r "${D}$(python_get_sitedir)/ephem/tests" || die
	}
	python_foreach_impl delete_tests
}
