# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Text-VimColor/Text-VimColor-0.26.ebuild,v 1.1 2015/05/27 22:36:20 monsieurp Exp $

EAPI=5

MODULE_VERSION=0.26
MODULE_AUTHOR="RWSTAUNER"

inherit perl-module

DESCRIPTION="Syntax highlighting using vim"
HOMEPAGE="https://github.com/rwstauner/Text-VimColor"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="app-editors/vim"
DEPEND="${RDEPEND}
	dev-perl/Test-File-ShareDir
	dev-perl/File-ShareDir
	dev-perl/Class-Tiny
	dev-perl/Path-Tiny
	test? (
		dev-perl/Test-Pod-Coverage
		dev-perl/Pod-Coverage
		dev-perl/Path-Class
		dev-perl/Test-Pod
	)"

SRC_TEST="do"
