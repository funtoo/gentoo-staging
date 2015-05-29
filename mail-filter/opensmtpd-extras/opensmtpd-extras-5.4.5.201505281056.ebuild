# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/mail-filter/opensmtpd-extras/opensmtpd-extras-5.4.5.201505281056.ebuild,v 1.2 2015/05/29 02:31:03 patrick Exp $

EAPI=5

inherit versionator eutils flag-o-matic

DESCRIPTION="Extra tables, filters, and various other addons for OpenSMTPD"
HOMEPAGE="https://github.com/OpenSMTPD/OpenSMTPD-extras"
SRC_URI="https://www.opensmtpd.org/archives/${PN}-$(get_version_component_range 4-).tar.gz"

LICENSE="ISC BSD BSD-1 BSD-2 BSD-4"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="
	filter-clamav
	filter-dkim-signer
	filter-dnsbl
	filter-lua
	filter-monkey
	filter-pause
	filter-perl
	filter-python
	filter-regex
	filter-spamassassin
	filter-stub
	filter-trace
	filter-void

	queue-null
	queue-python
	queue-ram
	queue-stub

	table-ldap
	table-mysql
	table-postgres
	table-redis
	table-socketmap
	table-passwd
	table-python
	table-sqlite
	table-stub

	scheduler-ram
	scheduler-stub
	scheduler-python
"

# Deps:
# mysql needs -lmysqlclient
# sqlite needs -lsqlite3
# redis needs -lhiredis
# postgres requires -lpq
# ldap uses internal library and requires no deps
# spamassassin uses internal library and requires no deps
# clamav uses internal library and requires no deps
# dnsbl needs -lasr
# python requires python, currently pegged at 2.7
# lua requires -llua5.2

DEPEND="mail-mta/opensmtpd dev-libs/libevent dev-libs/openssl
	filter-python? ( dev-lang/python:2.7 )
	filter-perl? ( dev-lang/perl )
	filter-lua? ( dev-lang/lua:5.2 )
	filter-dnsbl? ( net-libs/libasr )
	table-sqlite? ( dev-db/sqlite:3 )
	table-mysql? ( virtual/mysql )
	table-postgres? ( dev-db/postgresql )
	table-redis? ( dev-libs/hiredis )
	table-python? ( dev-lang/python:2.7 )
	scheduler-python? ( dev-lang/python:2.7 )
	queue-python? ( dev-lang/python:2.7 )
"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}-$(get_version_component_range 4-)

src_configure() {
	tc-export AR
	AR="$(which "$AR")" econf \
		--with-privsep-user=smtpd \
		--with-privsep-path=/var/empty \
		--sysconfdir=/etc/opensmtpd \
		$(for use in $IUSE; do use_with $use; done)
}
