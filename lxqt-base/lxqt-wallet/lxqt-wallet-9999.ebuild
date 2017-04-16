# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit cmake-utils

DESCRIPTION="LXQt about dialog"
HOMEPAGE="http://lxqt.org/"

inherit git-r3
MYPN=lxqt_wallet
EGIT_REPO_URI="https://github.com/mhogomchungu/${MYPN}.git"

LICENSE="GPL-2 LGPL-2.1+"
SLOT="0"

DEPEND="virtual/pkgconfig
	dev-libs/libgcrypt
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtwidgets:5
	dev-qt/linguist-tools:5
	app-crypt/libsecret
	kde-frameworks/kwallet
	kde-frameworks/knotifications
"
RDEPEND="${DEPEND}"

src_configure() {
        local mycmakeargs i y
        for i in clock colorpicker cpuload desktopswitch dom kbindicator mainmenu mount \
                networkmonitor quicklaunch screensaver sensors showdesktop statusnotifier \
                sysstat taskbar tray volume worldclock; do
                #Switch to ^^ when we switch to EAPI=6.
                #y=${i^^}
                y=$(tr '[:lower:]' '[:upper:]' <<< "${i}")
                mycmakeargs+=( $(cmake-utils_use ${i} ${y}_PLUGIN) )
        done

        if use volume; then
                mycmakeargs+=( $(cmake-utils_use alsa VOLUME_USE_ALSA)
                        $(cmake-utils_use pulseaudio VOLUME_USE_PULSEAUDIO) )
        fi

        cmake-utils_src_configure
}

