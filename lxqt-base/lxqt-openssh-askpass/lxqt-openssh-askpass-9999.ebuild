# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit cmake-utils

DESCRIPTION="LXQt OpenSSH user password prompt tool"
HOMEPAGE="http://lxqt.org/"

inherit git-r3
EGIT_REPO_URI="https://github.com/lxde/${PN}.git"

LICENSE="LGPL-2.1+"
SLOT="0"

RDEPEND="
	>=dev-libs/libqtxdg-${PV}
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	dev-qt/qtxml:5
	~lxqt-base/liblxqt-${PV}
	x11-libs/libX11
"
DEPEND="${RDEPEND}
	dev-qt/linguist-tools:5
"

src_install(){
	cmake-utils_src_install
	doman man/*.1

	echo "SSH_ASKPASS='${EPREFIX}/usr/bin/lxqt-openssh-askpass'" >> "${T}/99${PN}" \
		|| die
	doenvd "${T}/99${PN}"
}
