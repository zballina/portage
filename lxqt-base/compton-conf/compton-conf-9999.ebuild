# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit cmake-utils

DESCRIPTION="GUI configuration tool for compton X composite manager"
HOMEPAGE="http://lxqt.org/"

inherit git-r3
EGIT_REPO_URI="https://github.com/lxde/${PN}.git"

LICENSE="GPL-2 LGPL-2.1+"
SLOT="0"

IUSE="qt4 +qt5"

DEPEND="
	dev-libs/libconfig
	qt4? ( 
		dev-qt/qtgui:4 
		dev-qt/qtdbus:4
		dev-qt/qtcore:4 )
        qt5? ( 
		dev-qt/qtcore:5
		dev-qt/qtdbus:5
		dev-qt/qtwidgets:5
		dev-qt/linguist-tools:5 )
"
RDEPEND="${DEPEND}"

REQUIRED_USE="
	qt4? ( !qt5 )
        qt5? ( !qt4 )
"
