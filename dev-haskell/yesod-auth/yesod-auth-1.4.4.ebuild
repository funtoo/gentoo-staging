# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# ebuild generated by hackport 0.4.5.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Authentication for Yesod"
HOMEPAGE="http://www.yesodweb.com/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="+network-uri"

RDEPEND=">=dev-haskell/aeson-0.7:=[profile?]
	>=dev-haskell/authenticate-1.3:=[profile?]
	dev-haskell/base16-bytestring:=[profile?]
	dev-haskell/base64-bytestring:=[profile?]
	dev-haskell/binary:=[profile?]
	dev-haskell/blaze-builder:=[profile?]
	>=dev-haskell/blaze-html-0.5:=[profile?]
	>=dev-haskell/blaze-markup-0.5.1:=[profile?]
	dev-haskell/byteable:=[profile?]
	dev-haskell/conduit:=[profile?]
	dev-haskell/conduit-extra:=[profile?]
	dev-haskell/cryptohash:=[profile?]
	dev-haskell/data-default:=[profile?]
	>=dev-haskell/email-validate-1.0:=[profile?]
	dev-haskell/file-embed:=[profile?]
	dev-haskell/http-client:=[profile?]
	>=dev-haskell/http-conduit-1.5:=[profile?]
	dev-haskell/http-types:=[profile?]
	>=dev-haskell/lifted-base-0.1:=[profile?]
	>=dev-haskell/mime-mail-0.3:=[profile?]
	>=dev-haskell/persistent-2.1:=[profile?] <dev-haskell/persistent-2.2:=[profile?]
	>=dev-haskell/persistent-template-2.1:=[profile?] <dev-haskell/persistent-template-2.2:=[profile?]
	>=dev-haskell/random-1.0.0.2:=[profile?]
	dev-haskell/resourcet:=[profile?]
	dev-haskell/safe:=[profile?]
	dev-haskell/shakespeare:=[profile?]
	>=dev-haskell/text-0.7:=[profile?]
	>=dev-haskell/transformers-0.2.2:=[profile?]
	dev-haskell/unordered-containers:=[profile?]
	>=dev-haskell/wai-1.4:=[profile?]
	>=dev-haskell/yesod-core-1.4:=[profile?] <dev-haskell/yesod-core-1.5:=[profile?]
	>=dev-haskell/yesod-form-1.4:=[profile?] <dev-haskell/yesod-form-1.5:=[profile?]
	>=dev-haskell/yesod-persistent-1.4:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	network-uri? ( >=dev-haskell/network-uri-2.6:=[profile?] )
	!network-uri? ( <dev-haskell/network-2.6:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6.0
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag network-uri network-uri)
}
