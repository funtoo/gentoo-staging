# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Python Command-line Application Tools"
HOMEPAGE="https://github.com/kennethreitz/clint"
SRC_URI="https://github.com/kennethreitz/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="doc examples test"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
"
RDEPEND="dev-python/args[${PYTHON_USEDEP}]"

python_compile_all() {
	use doc && emake -C docs html
}

python_test() {
	py.test || die "Tests failed under ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )
	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples
	fi

	distutils-r1_python_install_all
}
