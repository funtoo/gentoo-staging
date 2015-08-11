# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
GCONF_DEBUG="no"
GNOME_ORG_MODULE="NetworkManager-${PN##*-}"

inherit gnome2 user

DESCRIPTION="NetworkManager OpenConnect plugin"
HOMEPAGE="https://wiki.gnome.org/Projects/NetworkManager"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="gtk"

RDEPEND="
	app-crypt/libsecret
	>=net-misc/networkmanager-0.9.6:=
	>=dev-libs/glib-2.32:2
	>=dev-libs/dbus-glib-0.74
	dev-libs/libxml2:2
	>=net-misc/openconnect-3.02:=
	gtk? ( >=x11-libs/gtk+-3.4:3 )
"
DEPEND="${RDEPEND}
	sys-devel/gettext
	dev-util/intltool
	virtual/pkgconfig
"

src_prepare() {
	epatch_user
	gnome2_src_prepare
}

src_configure() {
	gnome2_src_configure \
		--disable-more-warnings \
		--disable-static \
		$(use_with gtk gnome) \
		$(use_with gtk authdlg)
}

pkg_postinst() {
	gnome2_pkg_postinst
	enewgroup nm-openconnect
	enewuser nm-openconnect -1 -1 -1 nm-openconnect
}
