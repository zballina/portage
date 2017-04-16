# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit cmake-utils

DESCRIPTION="LXQt about dialog"
HOMEPAGE="http://lxqt.org/"

inherit git-r3
EGIT_REPO_URI="https://github.com/surlykke/${PN}.git"

LICENSE="GPL-2 LGPL-2.1+"
SLOT="0"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtwidgets:5
	x11-misc/lightdm[qt5]
"
RDEPEND="${DEPEND}"
