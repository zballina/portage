# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils

MY_PN="bluegriffon"

DESCRIPTION="The next-generation Web Editor based on the rendering engine of Firefox"
HOMEPAGE="http://www.bluegriffon.org/"
SRC_URI="
        amd64? ( http://bluegriffon.org/freshmeat/${PV}/${MY_PN}-${PV}.Ubuntu16.04-x86_64.tar.bz2 )
        "
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	app-misc/mime-types
	x11-libs/libXt
	media-libs/libpng
	dev-libs/nss
	dev-util/desktop-file-utils
	x11-misc/shared-mime-info
	>=x11-libs/gtk+-2.2:2
	>=virtual/jpeg-62
"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${MY_PN}

src_install() {

	declare BLUEGRIFFON_HOME=/opt/${MY_PN}
	# Install icon and .desktop for menu entry
	# newicon "${S}"/chrome/icons/default/default48.png ${PN}.png

	make_desktop_entry /usr/bin/${PN} 'BlueGriffon (bin)' ${PN} "Development;Network"

	# Install bluegriffon in /opt
	dodir ${BLUEGRIFFON_HOME%/*}
	mv "${S}" "${D}"${BLUEGRIFFON_HOME} || die

	# Create /etc/revdep-rebuild/10bluegriffon-bin
	dodir /etc/revdep-rebuild
	cat <<-EOF >"${D}"/etc/revdep-rebuild/10${PN}
	SEARCH_DIRS_MASK="/opt/BlueGriffon"
	EOF

	dosym /opt/${MY_PN}/bluegriffon /usr/bin/${PN} || die "dosym failed"

	elog "If you use BlueGriffon in KDE, use System Settings > Common Appearance and Behaviour > Application Appearance > GTK"
	elog "and select any GTK theme other than Oyxgen, otherwise BlueGriffon will crash when you click on any pull-down menu."
}
