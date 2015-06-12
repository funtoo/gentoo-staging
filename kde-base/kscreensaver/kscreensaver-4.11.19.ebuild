# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kscreensaver/kscreensaver-4.11.19.ebuild,v 1.2 2015/06/12 17:15:48 zlogene Exp $

EAPI=5

KMNAME="kde-workspace"
inherit kde4-meta

DESCRIPTION="KDE screensaver framework"
KEYWORDS="amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

RDEPEND="
	$(add_kdebase_dep kcheckpass)
	x11-libs/libX11
"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/${PN}-4.5.95-nsfw.patch"
)
