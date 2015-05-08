#!/bin/bash -e
#
# Copyright (c) 2015 Robert Nelson <robertcnelson@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

#Quick and dirty, this should be a standard makefile, we could plug into kernel.org...

if ! id | grep -q root; then
	echo "must be run as root"
	exit
fi

if [ ! -f /usr/share/initramfs-tools/hooks/dtbo ] ; then
	echo "Installing: bb-customizations..."
	apt-get update ; apt-get install bb-customizations
fi

update_initramfs () {
	if [ -f /boot/initrd.img-$(uname -r) ] ; then
		update-initramfs -u -k $(uname -r)
	else
		update-initramfs -c -k $(uname -r)
	fi
}

dtbo () {
	if [ -f ./src/${wfile}.dts ] ; then
		echo "Building: ${wfile}.dtbo"
		dtc -O dtb -o /lib/firmware/${wfile}.dtbo -b 0 -@ ./src/${wfile}.dts
	fi
}

#keep in order...
wfile="BB-BONE-SERL-03-00A1" ; dtbo
wfile="BB-UART1-00A0" ; dtbo
wfile="BB-UART2-00A0" ; dtbo
wfile="BB-UART4-00A0" ; dtbo
wfile="BB-UART5-00A0" ; dtbo

update_initramfs
#
