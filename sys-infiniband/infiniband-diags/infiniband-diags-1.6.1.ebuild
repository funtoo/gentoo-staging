# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="4"

OFED_VER="3.5"
OFED_RC="1"
OFED_RC_VER="2"
OFED_SUFFIX="1"

inherit openib

DESCRIPTION="OpenIB diagnostic programs and scripts needed to diagnose an IB subnet"
KEYWORDS="~amd64 ~x86 ~amd64-linux"
IUSE=""

DEPEND="
	sys-infiniband/libibumad:${SLOT}
	sys-infiniband/libibmad:${SLOT}
	sys-infiniband/opensm:${SLOT}"
RDEPEND="${DEPEND}"
block_other_ofed_versions
