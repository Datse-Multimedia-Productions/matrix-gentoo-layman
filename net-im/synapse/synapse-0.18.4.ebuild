# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Matrix synapse homeserver"
HOMEPAGE="http://matrix.org"
SRC_URI="https://github.com/matrix-org/synapse/archive/v0.18.4.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	if declare -p PATCHES | grep -q "^declare -a "; then
			[[ -n ${PATCHES[@]} ]] && eapply "${PATCHES[@]}"
	else
			[[ -n ${PATCHES} ]] && eapply ${PATCHES}
	fi
	eapply_user
}

src_install() {
	if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]]; then
			emake DESTDIR="${D}" install
	fi
	einstalldocs
}
