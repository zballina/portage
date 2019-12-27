# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils versionator

DESCRIPTION="Fast & powerful, cross platform .NET IDE"
HOMEPAGE="http://www.jetbrains.com/rider"
SRC_URI="http://download.jetbrains.com/${PN}/JetBrains.Rider-$(get_version_component_range 1-2).tar.gz"

LICENSE="Rider Rider_Academic Rider_Classroom Rider_OpenSource Rider_personal"
# This package cannot be slotted for now, bug #592636
SLOT="$(get_major_version)"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="splitdebug" #656858

RDEPEND=">=virtual/jdk-1.7"

S="${WORKDIR}/JetBrains Rider-$(get_version_component_range 1-2)"

src_install() {
	insinto "/opt/${PN}"
	doins -r .
	fperms 755 /opt/${PN}/bin/{${PN}.sh,fsnotifier{,64}}
	chmod +x lib/ReSharperHost/runtime.sh

	make_wrapper "${PN}" "/opt/${PN}/bin/${PN}.sh"
	newicon "bin/${PN}.svg" "${PN}.svg"
	make_desktop_entry "${PN}" "${PN}" "${PN}" "Development;IDE;"
}
