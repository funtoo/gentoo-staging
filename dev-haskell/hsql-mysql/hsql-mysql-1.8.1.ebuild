# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

# ebuild generated by hackport 0.2.13

EAPI=4

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="MySQL driver for HSQL"
HOMEPAGE="http://hackage.haskell.org/package/hsql-mysql"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND=">=dev-haskell/hsql-1.8[profile?]
		>=dev-lang/ghc-6.10.1
		>=virtual/mysql-4.0"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"
