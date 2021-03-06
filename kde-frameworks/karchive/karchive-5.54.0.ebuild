# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit kde5

DESCRIPTION="Framework for reading, creation, and manipulation of various archive formats"
LICENSE="GPL-2 LGPL-2.1"
KEYWORDS="amd64 ~arm ~arm64 ~ppc64 x86"
IUSE="+bzip2 +lzma"

RDEPEND="
	sys-libs/zlib
	bzip2? ( app-arch/bzip2 )
	lzma? ( app-arch/xz-utils )
"
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package bzip2 BZip2)
		$(cmake-utils_use_find_package lzma LibLZMA)
	)

	kde5_src_configure
}
