# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/XML-Filter-BufferText/XML-Filter-BufferText-1.10.0-r1.ebuild,v 1.3 2015/04/03 10:50:52 dlan Exp $

EAPI=5

MODULE_AUTHOR=RBERJON
MODULE_VERSION=1.01
inherit perl-module

DESCRIPTION="Filter to put all characters() in one event"

SLOT="0"
KEYWORDS="alpha amd64 arm ~arm64 hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE=""

RDEPEND=">=dev-perl/XML-SAX-0.12"
DEPEND="${RDEPEND}"

SRC_TEST="do"
