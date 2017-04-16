# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

EGIT_REPO_URI="https://github.com/lxde/${PN}"
inherit cmake-utils git-r3

DESCRIPTION="A library for file management"
HOMEPAGE="http://pcmanfm.sourceforge.net/"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS=""

COMMON_DEPEND=">=dev-libs/glib-2.18:2
        dev-qt/qtcore:5
        dev-qt/qtwidgets:5
        dev-qt/qtx11extras:5
	dev-qt/linguist-tools:5
        ~lxqt-base/liblxqt-${PV}
	>=lxde-base/menu-cache-0.4
	>=x11-libs/libfm-1.2.0"
RDEPEND="${COMMON_DEPEND}"

DEPEND="${COMMON_DEPEND}"
