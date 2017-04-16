# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="LXQT session manager"
HOMEPAGE="http://lxqt.org/"

inherit git-r3
EGIT_REPO_URI="https://github.com/lxde/${PN}.git"

LICENSE="GPL-2 LGPL-2.1+"
SLOT="0"

CDEPEND="
	>=dev-libs/libqtxdg-${PV}
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	dev-qt/qtxml:5
	kde-frameworks/kwindowsystem:5[X]
	~lxqt-base/liblxqt-${PV}
	x11-libs/libX11"
DEPEND="${CDEPEND}
	dev-qt/linguist-tools:5
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig"
RDEPEND="${CDEPEND}
	>=lxqt-base/lxqt-common-${PV}"

src_install(){
	cmake-utils_src_install
	doman lxqt-config-session/man/*.1 lxqt-session/man/*.1
}
