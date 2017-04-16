# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit cmake-utils

DESCRIPTION="LXQt about dialog"
HOMEPAGE="http://lxqt.org/"

inherit git-r3
EGIT_REPO_URI="https://github.com/lxde/${PN}.git"

LICENSE="GPL-2 LGPL-2.1+"
SLOT="0"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtwidgets:5
	dev-qt/linguist-tools:5
	x11-misc/xdg-user-dirs
        >=media-libs/libcanberra-0.16
        >=media-sound/pulseaudio-3[glib]
	~lxqt-base/liblxqt-${PV}
	~dev-libs/libqtxdg-${PV}"

RDEPEND="${DEPEND}"
