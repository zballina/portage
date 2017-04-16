# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit cmake-utils

DESCRIPTION="LXQt common resources"
HOMEPAGE="http://lxqt.org/"

inherit git-r3
EGIT_REPO_URI="https://github.com/lxde/${PN}.git"

LICENSE="LGPL-2.1+"
SLOT="0"

DEPEND=">=lxqt-base/liblxqt-${PV}"
RDEPEND="${DEPEND}"
PDEPEND=">=lxqt-base/lxqt-session-${PV}"

src_install() {
	cmake-utils_src_install
	dodir "/etc/X11/Sessions"
	dosym  "/usr/bin/startlxqt" "/etc/X11/Sessions/lxqt"
}
