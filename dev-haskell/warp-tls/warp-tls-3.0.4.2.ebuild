# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# ebuild generated by hackport 0.4.5.9999
#hackport: flags: +tls_1_1_3

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="HTTP over SSL/TLS support for Warp via the TLS package"
HOMEPAGE="http://github.com/yesodweb/wai"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/cprng-aes-0.5.0:=[profile?]
	>=dev-haskell/data-default-class-0.0.1:=[profile?]
	>=dev-haskell/network-2.2.1:=[profile?]
	dev-haskell/streaming-commons:=[profile?]
	>=dev-haskell/tls-1.2.16:=[profile?]
	>=dev-haskell/wai-3.0:=[profile?] <dev-haskell/wai-3.1:=[profile?]
	>=dev-haskell/warp-3.0.8:=[profile?] <dev-haskell/warp-3.1:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=tls_1_1_3
}
