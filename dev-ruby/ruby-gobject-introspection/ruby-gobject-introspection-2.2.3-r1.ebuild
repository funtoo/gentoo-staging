# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-gobject-introspection/ruby-gobject-introspection-2.2.3-r1.ebuild,v 1.2 2015/07/09 15:32:31 zlogene Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

inherit ruby-ng-gnome2

RUBY_S=ruby-gnome2-all-${PV}/gobject-introspection

DESCRIPTION="Ruby GObjectIntrosprction bindings"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

DEPEND+=" dev-libs/gobject-introspection"
RDEPEND+=" dev-libs/gobject-introspection"

ruby_add_rdepend ">=dev-ruby/ruby-glib2-${PV}"
