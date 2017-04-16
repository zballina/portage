# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit cmake-utils

DESCRIPTION="Openbox window manager configuration tool"
HOMEPAGE="http://lxqt.org/"

inherit git-r3
EGIT_REPO_URI="https://github.com/QtDesktop/${PN}.git"

LICENSE="GPL-2 LGPL-2.1+"
SLOT="0"

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
"
DEPEND="${RDEPEND}
	dev-qt/linguist-tools:5
	virtual/pkgconfig"
