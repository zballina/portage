# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit cmake-utils

DESCRIPTION="LXQt system integration plugin for Qt"
HOMEPAGE="http://lxqt.org/"

inherit git-r3
EGIT_REPO_URI="https://github.com/lxde/${PN}.git"

LICENSE="LGPL-2.1+"
SLOT="0"

RDEPEND="
	dev-libs/libdbusmenu-qt[qt5]
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	~lxqt-base/liblxqt-${PV}
	x11-libs/libX11"
DEPEND="${RDEPEND}
	dev-qt/linguist-tools:5"
