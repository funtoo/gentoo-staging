# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-clutter/ruby-clutter-2.2.3-r1.ebuild,v 1.2 2015/07/09 15:33:00 zlogene Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

inherit ruby-ng-gnome2

DESCRIPTION="Ruby Clutter bindings"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RESTRICT="test"

RUBY_S=ruby-gnome2-all-${PV}/clutter

DEPEND+=" media-libs/clutter"
RDEPEND+=" media-libs/clutter"

ruby_add_bdepend ">=dev-ruby/ruby-glib2-${PV}"
ruby_add_rdepend ">=dev-ruby/ruby-cairo-gobject-${PV}
	>=dev-ruby/ruby-gobject-introspection-${PV}"

each_ruby_configure() {
	:
}

each_ruby_compile() {
	:
}

each_ruby_install() {
	each_fakegem_install
}
