# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils eapi7-ver

DESCRIPTION="LXQt quick launcher"
HOMEPAGE="https://lxqt.org/"

MY_PV="$(ver_cut 1-2)*"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/lxqt/${PN}.git"
else
	SRC_URI="https://downloads.lxqt.org/downloads/${PN}/${PV}/${P}.tar.xz"
	KEYWORDS="amd64 ~arm ~arm64 ~x86"
fi

LICENSE="LGPL-2.1+"
SLOT="0"

RDEPEND="
	>=dev-cpp/muParser-2.2.3:=
	>=dev-libs/libqtxdg-3.0.0
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	kde-frameworks/kwindowsystem:5
	>=lxde-base/menu-cache-0.5.1
	=lxqt-base/liblxqt-${MY_PV}
	=lxqt-base/lxqt-globalkeys-${MY_PV}
	!lxqt-base/lxqt-common
"
DEPEND="${RDEPEND}
	dev-qt/linguist-tools:5
	>=dev-util/lxqt-build-tools-0.5.0
	virtual/pkgconfig
"

src_configure() {
	local mycmakeargs=(
		-DPULL_TRANSLATIONS=OFF
	)
	cmake-utils_src_configure
}

src_install(){
	cmake-utils_src_install
	doman man/*.1
}
