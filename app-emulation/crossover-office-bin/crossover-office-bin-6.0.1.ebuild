# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker

DESCRIPTION="simplified/streamlined version of wine with commercial support"
HOMEPAGE="http://www.codeweavers.com/products/cxoffice/"
SRC_URI="install-crossover-standard-${PV}.sh"

LICENSE="CROSSOVER"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE="nas"
RESTRICT="bindist fetch strip"

RDEPEND="
	dev-util/desktop-file-utils
	sys-libs/glibc
	x11-libs/libXrandr[abi_x86_32(-)]
	x11-libs/libXi[abi_x86_32(-)]
	x11-libs/libXmu[abi_x86_32(-)]
	x11-libs/libXxf86dga[abi_x86_32(-)]
	x11-libs/libXxf86vm[abi_x86_32(-)]
	nas? ( media-libs/nas[abi_x86_32(-)] )
"

S=${WORKDIR}

pkg_nofetch() {
	einfo "Please visit ${HOMEPAGE}"
	einfo "and place ${A} in ${DISTDIR}"
}

src_unpack() {
	unpack_makeself # needed due to .sh extension; #415013
}

src_install() {
	dodir /opt/cxoffice
	cp -r * "${D}"/opt/cxoffice || die "cp failed"
	rm -r "${D}"/opt/cxoffice/setup.{sh,data}
	insinto /opt/cxoffice/etc
	doins support/templates/cxoffice.conf
}

pkg_postinst() {
	einfo "Run /opt/cxoffice/bin/cxsetup as normal user to create"
	einfo "bottles and install Windows applications."
}
