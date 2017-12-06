#!/bin/bash

source $(dirname "$0")/lib/pinmux.sh

file="BeagleBone_Black_i2c_can"

echo "" > ${file}.dts
echo "" >${file}-pinmux.dts
echo "" >${file}-gpio.dts
echo "" >${file}_config-pin.txt

#BeagleBone Black

default_mode="3" ; cp_default="i2c" ; pcbpin="P9_19" ; ball="D17" ; find_ball
default_mode="3" ; cp_default="i2c" ; pcbpin="P9_20" ; ball="D18" ; find_ball

msg="" ; echo_both

cat ${file}-pinmux.dts >> ${file}.dts

echo "cape-universal {" >> ${file}.dts
echo "	compatible = \"gpio-of-helper\";" >> ${file}.dts
echo "	status = \"okay\";" >> ${file}.dts
echo "	pinctrl-names = \"default\";" >> ${file}.dts
echo "	pinctrl-0 = <>;" >> ${file}.dts

cat ${file}-gpio.dts >> ${file}.dts

echo "};" >> ${file}.dts

rm -rf ${file}-pinmux.dts || true
rm -rf ${file}-gpio.dts || true
