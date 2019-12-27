# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils versionator

SLOT="0"
MY_PN="DataGrip"

#https://download-cf.jetbrains.com/datagrip/datagrip-2019.1.4.tar.gz
#https://download.jetbrains.com/idea/ideaIU-2019.1.3-no-jbr.tar.gz
#https://download.jetbrains.com/idea/ideaIU-2019.1.3.tar.gz
# distinguish settings for official stable releases and EAP-version releases
KEYWORDS="~amd64"
SRC_URI="https://download.jetbrains.com/${PN}/${PN}-${PV}.tar.gz"

DESCRIPTION="A complete toolset for web, mobile and enterprise development"
HOMEPAGE="https://www.jetbrains.com/idea"

LICENSE="IDEA
	|| ( IDEA_Academic IDEA_Classroom IDEA_OpenSource IDEA_Personal )"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=virtual/jdk-1.7:*"
S="${WORKDIR}/${MY_PN}-${PV}"

src_prepare() {
	eapply_user
#	if ! use amd64; then
#		rm -r plugins/tfsIntegration/lib/native/linux/x86_64 || die
#	fi
#	if ! use arm; then
#		rm bin/fsnotifier-arm || die
#		rm -r plugins/tfsIntegration/lib/native/linux/arm || die
#	fi
#	if ! use ppc; then
#		rm -r plugins/tfsIntegration/lib/native/linux/ppc || die
#	fi
#	if ! use x86; then
#		rm -r plugins/tfsIntegration/lib/native/linux/x86 || die
#	fi
#	rm -r plugins/tfsIntegration/lib/native/solaris || die
#	rm -r plugins/tfsIntegration/lib/native/hpux || die
}

src_install() {
	local dir="/opt/${PN}-${PV}"

	insinto "${dir}"
	doins -r *
	fperms 755 "${dir}"/bin/{datagrip.sh,fsnotifier{,64}}

	make_wrapper "${PN}" "${dir}/bin/${PN}.sh"
	newicon "bin/${PN}.png" "${PN}.png"
	make_desktop_entry "${PN}" "Datagrip" "${PN}" "Development;IDE;"

	# recommended by: https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
	mkdir -p "${D}/etc/sysctl.d/" || die
	echo "fs.inotify.max_user_watches = 524288" > "${D}/etc/sysctl.d/30-idea-inotify-watches.conf" || die
}
