# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils versionator

SLOT="0"
PV_STRING="$(get_version_component_range 3-3)"
MY_PV="$(get_version_component_range 1-2)"
MY_PN="update"

if [[ "$(get_version_component_range 7)x" = "prex" ]]
then
	# upstream EAP
	# https://download.jetbrains.com/upsource/upsource-2019.1.1578.zip?_ga=2.159324157.617262424.1577428759-519868573.1577428759
	KEYWORDS=""
	SRC_URI="https://download.jetbrains.com/upsource/${P}.zip"
else
	# upstream stable
	KEYWORDS="~amd64 ~x86"
	SRC_URI="https://download.jetbrains.com/upsource/${P}.zip"
fi

DESCRIPTION="Code review, team collaboration, project analytics"
HOMEPAGE="https://www.jetbrains.com/upsource"

LICENSE="IDEA
	|| ( IDEA_Academic IDEA_Classroom IDEA_OpenSource IDEA_Personal )"
IUSE=""

DEPEND="!dev-util/${PN}:14
	!dev-util/${PN}:15"
RDEPEND="${DEPEND}
	>=virtual/jdk-1.7:*"
S="${WORKDIR}/${MY_PN}-IU-${PV_STRING}"

QA_PREBUILT="opt/${PN}-${MY_PV}/*"

src_prepare() {
	eapply_user
}

src_install() {
	local dir="/opt/${PN}-${MY_PV}"

	insinto "${dir}"
	doins -r *
	fperms 755 "${dir}"/bin/{idea.sh,fsnotifier{,64}}

	if use custom-jdk; then
		if [[ -d jre ]]; then
		fperms 755 "${dir}"/jre/jre/bin/{java,jjs,keytool,orbd,pack200,policytool,rmid,rmiregistry,servertool,tnameserv,unpack200}
		fi
	fi

	make_wrapper "${PN}" "${dir}/bin/${MY_PN}.sh"
	newicon "bin/${MY_PN}.png" "${PN}.png"
	make_desktop_entry "${PN}" "IntelliJ Idea Ultimate" "${PN}" "Development;IDE;"

	mkdir -p "${D}/etc/sysctl.d/" || die
	echo "fs.inotify.max_user_watches = 524288" > "${D}/etc/sysctl.d/30-idea-inotify-watches.conf" || die
}
