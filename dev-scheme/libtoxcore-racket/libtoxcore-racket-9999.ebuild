# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2

DESCRIPTION="Racket bindings for the Tox library."
HOMEPAGE="https://github.com/lehitoskin/libtoxcore-racket"
EGIT_REPO_URI="git://github.com/lehitoskin/libtoxcore-racket
	https://github.com/lehitoskin/libtoxcore-racket"
LICENSE="GPL-3"
SLOT="0"

RDEPEND=">=dev-scheme/racket-6.0.1[X]"

src_prepare() {
	epatch_user
}

src_compile() {
	emake
	raco make main.rkt
}

src_install() {
	emake DESTDIR="${D}/usr" install
	mkdir -pv "${D}/usr/share/racket/pkgs/libtoxcore-racket"
	cp -Rv * "${D}/usr/share/racket/pkgs/libtoxcore-racket/"
}

pkg_postinst() {
	raco link -i "/usr/share/racket/pkgs/libtoxcore-racket"
}

pkg_prerm() {
	raco link -ir "/usr/share/racket/pkgs/libtoxcore-racket"
}
