# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

MY_PN="XStatic-Patternfly-Bootstrap-Treeview"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="XStatic-Patternfly-Bootstrap-Treeview package"
HOMEPAGE="https://pypi.org/project/XStatic-Patternfly-Bootstrap-Treeview"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-python/xstatic[${PYTHON_USEDEP}]"

DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_P}"

python_install() {
	distutils-r1_python_install
	find "${ED}" -name '*.pth' -delete || die
}
