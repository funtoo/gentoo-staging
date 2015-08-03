# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-gtksourceview3/ruby-gtksourceview3-2.2.3.ebuild,v 1.6 2015/08/03 13:49:20 ago Exp $

EAPI=5
USE_RUBY="ruby19 ruby20"

inherit ruby-ng-gnome2

DESCRIPTION="Ruby Gtk3 bindings"
KEYWORDS="amd64 ~ppc x86"
IUSE=""

DEPEND+=" x11-libs/gtksourceview:3.0"
RDEPEND+=" x11-libs/gtksourceview:3.0"

ruby_add_bdepend ">=dev-ruby/ruby-glib2-${PV}"
ruby_add_rdepend ">=dev-ruby/ruby-gtk3-${PV}"
