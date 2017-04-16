# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit rpm

DESCRIPTION="Advanced cross-platform Google Drive client"
HOMEPAGE="https://www.insynchq.com/"
MAGIC="36089"
MAIN_INSTALLER_STRING="http://s.insynchq.com/builds/insync-${PV}.${MAGIC}-fc21"
SRC_URI="
	x86?      ( ${MAIN_INSTALLER_STRING}.i686.rpm )
	amd64?    ( ${MAIN_INSTALLER_STRING}.x86_64.rpm )"

SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
DEPEND="<dev-libs/libevent-2.1"
RDEPEND="${DEPEND}"

src_unpack() {
	rpm_src_unpack ${A}
	mkdir -p "${S}" # Without this src_prepare fails
}

src_install() {
	cp -pPR "${WORKDIR}"/{usr,etc} "${D}"/ || die "Installation failed"

	echo "SEARCH_DIRS_MASK=\"/usr/lib*/insync\"" > "${T}/70${PN}" || die
	insinto "/etc/revdep-rebuild" && doins "${T}/70${PN}" || die
}

pkg_postinst() {
	elog "To automatically start insync add 'insync start' to your session"
	elog "startup scripts. GNOME users can also choose to enable"
	elog "the insync extension via gnome-tweak-tool."
}
