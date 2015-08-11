# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# ebuild generated by hackport 0.4.4.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="An MPD client library"
HOMEPAGE="http://github.com/vimus/libmpd-haskell#readme"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/attoparsec-0.10.1:=[profile?] <dev-haskell/attoparsec-1:=[profile?]
	>=dev-haskell/data-default-0.4:=[profile?] <dev-haskell/data-default-1:=[profile?]
	>=dev-haskell/mtl-2.0:=[profile?] <dev-haskell/mtl-3:=[profile?]
	>=dev-haskell/network-2.1:=[profile?] <dev-haskell/network-3:=[profile?]
	>=dev-haskell/text-0.11:=[profile?] <dev-haskell/text-2:=[profile?]
	>=dev-haskell/utf8-string-0.3.1:=[profile?] <dev-haskell/utf8-string-1:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
	test? ( >=dev-haskell/hspec-1.3
		>=dev-haskell/quickcheck-2.1 )
"
