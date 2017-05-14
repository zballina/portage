# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit eutils versionator

SLOT="$(get_major_version)"
MY_PV="$(get_version_component_range 4-6)"
MY_PN="PhpStorm-EAP"
MY_PN_W="PhpStorm"
MY_PV_W="$(get_version_component_range 1-3)"
MY_PN_OPT="phpstorm"

DESCRIPTION="JavaScript IDE for client- and server-side development with Node.js"
HOMEPAGE="https://www.jetbrains.com/phpstorm"
SRC_URI="https://download.jetbrains.com/webide/${MY_PN}-$(get_version_component_range 1-3).tar.gz"

# https://download.jetbrains.com/webide/PhpStorm-2017.1.3.tar.gz
# https://download.jetbrains.com/webide/PhpStorm-2017.1.3.tar.gz
LICENSE="PhpStorm PhpStorm_Academic PhpStorm_Classroom PhpStorm_OpenSource PhpStorm_personal"
IUSE=""
KEYWORDS="~amd64 ~x86"

RDEPEND=">=virtual/jdk-1.7"
S="${WORKDIR}/${MY_PN_W}-${MY_PV_W}"

src_install() {
	local dir="/opt/${PN}"

	insinto "${dir}"
	doins -r .
	fperms 755 ${dir}/bin/{${MY_PN_OPT}.sh,fsnotifier{,64}}

	make_wrapper "${MY_PN_OPT}" "${dir}/bin/${MY_PN_OPT}.sh"
}
