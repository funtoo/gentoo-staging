# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/coloredlogs/coloredlogs-1.0.ebuild,v 1.1 2015/05/29 11:13:37 jlec Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4} )

inherit distutils-r1

DESCRIPTION="Colored stream handler for the logging module"
HOMEPAGE="https://pypi.python.org/pypi/coloredlogs https://github.com/xolox/python-coloredlogs http://coloredlogs.readthedocs.org"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=">=dev-python/humanfriendly-1.24[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (	dev-python/verboselogs[${PYTHON_USEDEP}] )"

DOCS=( README.rst )

python_test() {
	esetup.py test
}
