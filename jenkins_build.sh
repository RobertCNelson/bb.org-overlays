#!/bin/bash


#git://git.kernel.org/pub/scm/utils/dtc/dtc.git

git_tag="v1.4.4"
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

test_for_branch=$(git branch --list ${git_tag}-build)
if [ "x${test_for_branch}" != "x" ] ; then
	git branch ${git_tag}-build -D
fi

git checkout ${git_tag} -b ${git_tag}-build

make clean
make CC=gcc CROSS_COMPILE= all
echo "dtc: `/var/lib/jenkins/git/dtc/dtc --version`"
