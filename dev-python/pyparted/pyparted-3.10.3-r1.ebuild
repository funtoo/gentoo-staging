# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pyparted/pyparted-3.10.3-r1.ebuild,v 1.7 2015/04/13 08:56:40 ago Exp $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_{3,4}} )
inherit distutils-r1

DESCRIPTION="Python bindings for sys-block/parted"
HOMEPAGE="https://github.com/dcantrell/pyparted/"
SRC_URI="${HOMEPAGE}archive/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="alpha amd64 hppa ~ia64 ppc ppc64 ~sparc x86"
IUSE="test"
REQUIRED_USE="
	test? ( python_targets_python2_7 )
"

RDEPEND="
	>=sys-block/parted-3.1
	dev-python/decorator[${PYTHON_USEDEP}]
"
DEPEND="
	${RDEPEND}
	test? ( dev-python/pychecker )
	virtual/pkgconfig
"

S=${WORKDIR}/${PN}-${P}

PATCHES=(
	"${FILESDIR}"/${P}-greater.patch
	"${FILESDIR}"/${P}-sbin-parted.patch
)

python_test() {
	if [[ ${EPYTHON} = python2* ]]; then
		emake test
	else
		einfo "Skipping ${EPYTHON}"
	fi
}
