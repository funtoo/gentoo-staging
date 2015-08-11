# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# ebuild generated by hackport 0.3.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Specify Haskell project templates and generate files"
HOMEPAGE="https://github.com/fpco/haskell-ide"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/base64-bytestring:=[profile?]
	>=dev-haskell/conduit-1.0:=[profile?] <dev-haskell/conduit-1.2:=[profile?]
	dev-haskell/conduit-extra:=[profile?]
	>=dev-haskell/mtl-2.0:=[profile?]
	>=dev-haskell/resourcet-0.4.3:=[profile?]
	>=dev-haskell/system-fileio-0.3:=[profile?]
	>=dev-haskell/system-filepath-0.4:=[profile?]
	>=dev-haskell/text-0.11:=[profile?]
	>=dev-haskell/transformers-0.2:=[profile?]
	>=dev-lang/ghc-6.10.4:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	test? ( dev-haskell/conduit
		>=dev-haskell/hspec-1.3
		dev-haskell/quickcheck )
"
