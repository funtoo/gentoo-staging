# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-multilib

DESCRIPTION="Open-source implementation of the Secure Real-time Transport Protocol (SRTP)"
HOMEPAGE="https://github.com/Haivision/srt"

if [[ ${PV} == *9999 ]] ; then
	EGIT_REPO_URI="https://github.com/Haivision/${PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/Haivision/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 -sparc ~x86 ~x86-fbsd ~ppc-macos ~x64-macos ~x86-macos"
fi

LICENSE="LGPL-2.1"
SLOT="0"
IUSE="gnutls libressl test"

BDEPEND="
	test? ( dev-cpp/gtest )
"
DEPEND="
	gnutls? ( net-libs/gnutls:=[${MULTILIB_USEDEP}] )
	!gnutls? (
		!libressl? ( dev-libs/openssl:0=[${MULTILIB_USEDEP}] )
		libressl? ( dev-libs/libressl:0=[${MULTILIB_USEDEP}] )
	)
"
RDEPEND="${DEPEND}"

RESTRICT="!test? ( test )"

DOCS=( README.md )

PATCHES=(
	"${FILESDIR}/${PN}-always-GNUInstallDirs.patch"
)

src_prepare() {
	cmake-utils_src_prepare
	sed -i -e "s:hcrypt_ut.c::" "${S}"/haicrypt/*.maf || die
	sed -i -e 's:DESTINATION lib:DESTINATION lib${LIB_SUFFIX}:' CMakeLists.txt || die
}

src_configure() {
	local mycmakeargs=(
		-DUSE_GNUTLS=$(usex gnutls)
		-DENABLE_UNITTESTS=$(usex test)
	)
	cmake-multilib_src_configure
}
