# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit cmake-utils

DESCRIPTION="NetworkManager tray icon -> simple front end (nm-applet)"
HOMEPAGE="http://lxqt.org/"

inherit git-r3
EGIT_REPO_URI="https://github.com/palinek/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
IUSE="+modemmanager"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtnetwork:5
	dev-qt/linguist-tools:5
	kde-frameworks/networkmanager-qt
	modemmanager? ( kde-frameworks/modemmanager-qt )
"
RDEPEND="${DEPEND}"
