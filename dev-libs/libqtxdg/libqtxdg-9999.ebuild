# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit cmake-utils virtualx

DESCRIPTION="A Qt implementation of XDG standards"
HOMEPAGE="http://lxqt.org/"

inherit git-r3
EGIT_REPO_URI="https://github.com/lxde/${PN}.git"

LICENSE="LGPL-2.1"
SLOT="0"
IUSE="test"

CDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
"
DEPEND="${CDEPEND}
	virtual/pkgconfig
	test? ( dev-qt/qttest:5 )
"
RDEPEND="${CDEPEND}
	x11-misc/xdg-utils
"

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTS=$(usex test)
	)
	cmake-utils_src_configure
}

src_test() {
	VIRTUALX_COMMAND="cmake-utils_src_test" virtualmake
}
