#!/bin/sh -e

DIR="$PWD"

check_dpkg () {
	LC_ALL=C dpkg --list | awk '{print $2}' | grep "^${pkg}" >/dev/null || deb_pkgs="${deb_pkgs}${pkg} "
}

dtc_git_build () {
	project="dtc"
	server="git://git.kernel.org/pub/scm/utils/dtc/dtc.git"

	if [ ! -d ${HOME}/git/ ] ; then
		mkdir -p ${HOME}/git/ || true
	fi

	if [ ! -f ${HOME}/git/${project}/.git/config ] ; then
		git clone ${server} ${HOME}/git/${project}/
	fi

	cd ${HOME}/git/${project}/
	make clean
	git checkout master -f
	git pull || true

	if [ ! "x${git_tag}" = "x" ] ; then
		test_for_branch=$(git branch --list ${git_tag}-build)
		if [ "x${test_for_branch}" != "x" ] ; then
			git branch ${git_tag}-build -D
		fi

		git checkout ${git_tag} -b ${git_tag}-build
	fi

	make clean
	make PREFIX=/usr/local/ CC=gcc CROSS_COMPILE= all
	echo "Installing into: /usr/local/bin/"
	sudo make PREFIX=/usr/local/ install
	sudo ln -sf /usr/local/bin/dtc /usr/bin/dtc
	echo "dtc: `/usr/bin/dtc --version`"
}

unset deb_pkgs
pkg="bison"
check_dpkg
pkg="build-essential"
check_dpkg
pkg="flex"
check_dpkg
pkg="git"
check_dpkg

if [ "${deb_pkgs}" ] ; then
	echo "Installing: ${deb_pkgs}"
	sudo apt-get update
	sudo apt-get -y install ${deb_pkgs}
	sudo apt-get clean
fi

git_tag="v1.4.7"
dtc_git_build
