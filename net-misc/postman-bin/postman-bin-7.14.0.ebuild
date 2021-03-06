# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit desktop

DESCRIPTION="Supercharge your API workflow"
HOMEPAGE="https://www.getpostman.com/"
SRC_URI="https://dl.pstmn.io/download/version/${PV}/linux64 -> ${P}.tar.gz"

KEYWORDS="~amd64"
LICENSE="MPL-2.0"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

RESTRICT="strip mirror"

S="${WORKDIR}/Postman/app"

src_install() {
  insinto /opt/${P}
  doins -r *

  exeinto /opt/${P}
  doexe Postman
  doexe _Postman

  dosym /opt/${P}/Postman /usr/bin/${P}

  newicon -s 128 ${S}/resources/app/assets/icon.png postman.png

  make_desktop_entry "${P}" "Postman" "/usr/share/icons/hicolor/128x128/apps/postman.png" "Development"
}
