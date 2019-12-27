# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils versionator

SLOT="0"
PV_STRING="$(get_version_component_range 4-6)"
MY_PV="$(get_version_component_range 1-3)"
MY_PN="idea"

if [[ "$(get_version_component_range 7)x" = "prex" ]]
then
	# upstream EAP
	KEYWORDS=""
	SRC_URI="
	custom-jdk? ( https://download.jetbrains.com/idea/${MY_PN}IU-${PV_STRING}.tar.gz -> ${MY_PN}IU-${PV_STRING}.tar.gz )
	!custom-jdk? ( https://download.jetbrains.com/idea/${MY_PN}IU-${PV_STRING}-no-jbr.tar.gz -> ${MY_PN}IU-${PV_STRING}-no-jbr.tar.gz )
	"
else
	# upstream stable
	KEYWORDS="~amd64 ~x86"
	SRC_URI="
	custom-jdk? ( https://download.jetbrains.com/idea/${MY_PN}IU-${MY_PV}.tar.gz -> ${MY_PN}IU-${PV_STRING}.tar.gz )
	!custom-jdk? ( https://download.jetbrains.com/idea/${MY_PN}IU-${MY_PV}-no-jbr.tar.gz -> ${MY_PN}IU-${PV_STRING}-no-jbr.tar.gz )
	"
fi

DESCRIPTION="A complete toolset for web, mobile and enterprise development"
HOMEPAGE="https://www.jetbrains.com/idea"

LICENSE="IDEA
	|| ( IDEA_Academic IDEA_Classroom IDEA_OpenSource IDEA_Personal )"
IUSE="-custom-jdk"

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
