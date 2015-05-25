# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/faraday_middleware-multi_json/faraday_middleware-multi_json-0.0.6.ebuild,v 1.1 2015/05/24 22:55:32 robbat2 Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_TEST="test"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"
inherit ruby-fakegem eutils

DESCRIPTION="Simple Faraday middleware that uses MultiJson to unobtrusively encode JSON requests and parse JSON responses"
HOMEPAGE="https://github.com/denro/faraday_middleware-multi_json"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend "
	dev-ruby/faraday_middleware
	dev-ruby/multi_json"

all_ruby_prepare() {
	# Remove bundler support.
	rm -f Gemfile || die
	sed -i -e '/[Bb]undler/d' Rakefile || die
}

each_ruby_prepare() {
	# Make sure the test scripts use the right ruby interpreter
	#sed -i -e 's:ruby:'${RUBY}':' script/* || die
	:
}
