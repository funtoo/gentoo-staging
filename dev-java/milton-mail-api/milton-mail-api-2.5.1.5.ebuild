# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

JAVA_PKG_IUSE="source doc"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Milton WebDav library"
HOMEPAGE="http://milton.io"
SRC_URI="http://milton.io/maven/io/milton/${PN}/${PV}/${P}-sources.jar"

LICENSE="Apache-2.0"
SLOT="2.5"
KEYWORDS="~amd64 ~x86"

IUSE=""

CDEPEND="
	dev-java/milton-api:${SLOT}
	dev-java/slf4j-api:0
	java-virtuals/javamail:0
"

RDEPEND="${CDEPEND}
	>=virtual/jre-1.5"

DEPEND="${CDEPEND}
	>=virtual/jdk-1.5"

JAVA_GENTOO_CLASSPATH="milton-api-${SLOT},javamail,slf4j-api"
