#!/bin/bash

source $(dirname "$0")/lib/pinmux.sh

file="PocketBeagle"

echo "" > ${file}.dts
echo "" >${file}-pinmux.dts
echo "" >${file}-gpio.dts

#PocketBeagle
pcbpin="1_02" ; ball="R5" ; find_ball
pcbpin="1_04" ; ball="R6" ; find_ball
pcbpin="1_06" ; ball="A16" ; find_ball
pcbpin="1_08" ; ball="A17" ; find_ball
pcbpin="1_10" ; ball="B17" ; find_ball
pcbpin="1_12" ; ball="B16" ; find_ball
pcbpin="1_20" ; ball="D14" ; find_ball
pcbpin="1_26" ; ball="D18" ; find_ball
pcbpin="1_28" ; ball="D17" ; find_ball
pcbpin="1_29" ; ball="A14" ; find_ball
pcbpin="1_30" ; ball="E16" ; find_ball
pcbpin="1_31" ; ball="B12" ; find_ball
pcbpin="1_32" ; ball="E15" ; find_ball
pcbpin="1_33" ; ball="B13" ; find_ball
pcbpin="1_34" ; ball="T11" ; find_ball
pcbpin="1_35" ; ball="V5" ; find_ball
pcbpin="1_36" ; ball="A13" ; find_ball
msg="" ; echo_both
pcbpin="2_01" ; ball="U14" ; find_ball
pcbpin="2_02" ; ball="V17" ; find_ball
pcbpin="2_03" ; ball="T10" ; find_ball
pcbpin="2_04" ; ball="T16" ; find_ball
pcbpin="2_05" ; ball="T17" ; find_ball
pcbpin="2_06" ; ball="U16" ; find_ball
pcbpin="2_07" ; ball="U17" ; find_ball
pcbpin="2_08" ; ball="U18" ; find_ball
pcbpin="2_09" ; ball="D15" ; find_ball
pcbpin="2_10" ; ball="R14" ; find_ball
pcbpin="2_11" ; ball="D16" ; find_ball
pcbpin="2_17" ; ball="V12" ; find_ball
pcbpin="2_18" ; ball="U13" ; find_ball
pcbpin="2_19" ; ball="U12" ; find_ball
pcbpin="2_20" ; ball="T13" ; find_ball
pcbpin="2_22" ; ball="V13" ; find_ball
pcbpin="2_24" ; ball="R13" ; find_ball
pcbpin="2_25" ; ball="E17" ; find_ball
pcbpin="2_27" ; ball="E18" ; find_ball
pcbpin="2_28" ; ball="D13" ; find_ball
pcbpin="2_29" ; ball="C18" ; find_ball
pcbpin="2_30" ; ball="C12" ; find_ball
pcbpin="2_31" ; ball="A15" ; find_ball
pcbpin="2_32" ; ball="D12" ; find_ball
pcbpin="2_33" ; ball="R12" ; find_ball
pcbpin="2_34" ; ball="C13" ; find_ball
pcbpin="2_35" ; ball="U5" ; find_ball

cat ${file}-pinmux.dts >> ${file}.dts
cat ${file}-gpio.dts >> ${file}.dts
rm -rf ${file}-pinmux.dts || true
rm -rf ${file}-gpio.dts || true
