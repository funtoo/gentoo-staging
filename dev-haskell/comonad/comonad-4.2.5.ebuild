# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# ebuild generated by hackport 0.4.3

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Comonads"
HOMEPAGE="http://github.com/ekmett/comonad/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="+containers +contravariant +distributive +test-doctests"

RDEPEND=">=dev-haskell/semigroups-0.8.3.1:=[profile?] <dev-haskell/semigroups-1:=[profile?]
	>=dev-haskell/tagged-0.1:=[profile?] <dev-haskell/tagged-1:=[profile?]
	>=dev-haskell/transformers-0.2:=[profile?] <dev-haskell/transformers-0.5:=[profile?]
	>=dev-haskell/transformers-compat-0.3:=[profile?] <dev-haskell/transformers-compat-1:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	contravariant? ( >=dev-haskell/contravariant-0.2.0.1:=[profile?] <dev-haskell/contravariant-2:=[profile?] )
	distributive? ( >=dev-haskell/distributive-0.2.2:=[profile?] <dev-haskell/distributive-1:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
	test? ( test-doctests? ( >=dev-haskell/doctest-0.9.10 ) )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag containers containers) \
		$(cabal_flag contravariant contravariant) \
		$(cabal_flag distributive distributive) \
		$(cabal_flag test-doctests test-doctests)
}
