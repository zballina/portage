# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="NetworkManager-l2tp"
MY_P="${MY_PN}-${PV}"

inherit eutils gnome.org autotools

DESCRIPTION="NetworkManager L2TP plugin"
HOMEPAGE="https://github.com/nm-l2tp/network-manager-l2tp"
SRC_URI="https://github.com/nm-l2tp/${MY_PN}/releases/download/${PV}/${MY_P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnome static-libs +strongswan"

RDEPEND="
	>=net-misc/networkmanager-1.2[ppp]
	dev-libs/dbus-glib
	net-dialup/ppp[eap-tls]
	net-dialup/xl2tpd
	>=dev-libs/glib-2.32
	strongswan? ( net-vpn/strongswan )
	!strongswan? ( net-vpn/libreswan )
	gnome? (
		x11-libs/gtk+:3
		gnome-base/libgnome-keyring
	)"

BDEPEND="${RDEPEND}
	sys-devel/gettext
	dev-util/intltool
	virtual/pkgconfig"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	eautoreconf
	eapply_user
}

src_configure() {
	local myeconfargs=(
		--prefix=/usr
		--localstatedir=/var
		--libexecdir=/usr/lib/NetworkManager
		--with-pppd-plugin-dir=/usr/lib64/pppd/2.4.7
		$(use_with gnome)
		$(use_enable static-libs static)
	)

	econf "${myeconfargs[@]}"
}
