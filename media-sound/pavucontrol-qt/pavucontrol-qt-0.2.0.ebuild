# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit cmake-utils

DESCRIPTION="LXQt about dialog"
HOMEPAGE="http://lxqt.org/"

SRC_URI="https://github.com/lxde/${PN}/archive/${PV}.tar.gz"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

LICENSE="GPL-2 LGPL-2.1+"
SLOT="0"

DEPEND="dev-qt/qtcore:5
	dev-qt/qtwidgets:5
	dev-qt/linguist-tools:5
        >=media-libs/libcanberra-0.16
        >=media-sound/pulseaudio-3[glib]
	>=dev-util/lxqt-build-tools-0.2"
#	>=lxqt-base/liblxqt-0.11

RDEPEND="${DEPEND}"
