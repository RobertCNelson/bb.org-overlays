#!/bin/bash

source $(dirname "$0")/lib/pinmux.sh

file="BeagleBone_Black"

echo "" > ${file}.dts
echo "" >${file}-pinmux.dts
echo "" >${file}-gpio.dts

#BeagleBone Black
pcbpin="8_03" ; ball="R9" ; find_ball
pcbpin="8_04" ; ball="T9" ; find_ball
pcbpin="8_05" ; ball="R8" ; find_ball
pcbpin="8_06" ; ball="T8" ; find_ball
pcbpin="8_07" ; ball="R7" ; find_ball
pcbpin="8_08" ; ball="T7" ; find_ball
pcbpin="8_09" ; ball="T6" ; find_ball
pcbpin="8_10" ; ball="U6" ; find_ball
pcbpin="8_11" ; ball="R12" ; find_ball
pcbpin="8_12" ; ball="T12" ; find_ball
pcbpin="8_13" ; ball="T10" ; find_ball
pcbpin="8_14" ; ball="T11" ; find_ball
pcbpin="8_15" ; ball="U13" ; find_ball
pcbpin="8_16" ; ball="V13" ; find_ball
pcbpin="8_17" ; ball="U12" ; find_ball
pcbpin="8_18" ; ball="V12" ; find_ball
pcbpin="8_19" ; ball="U10" ; find_ball
pcbpin="8_20" ; ball="V9" ; find_ball
pcbpin="8_21" ; ball="U9" ; find_ball
pcbpin="8_22" ; ball="V8" ; find_ball
pcbpin="8_23" ; ball="U8" ; find_ball
pcbpin="8_24" ; ball="V7" ; find_ball
pcbpin="8_25" ; ball="U7" ; find_ball
pcbpin="8_26" ; ball="V6" ; find_ball
pcbpin="8_27" ; ball="U5" ; find_ball
pcbpin="8_28" ; ball="V5" ; find_ball
pcbpin="8_29" ; ball="R5" ; find_ball
pcbpin="8_30" ; ball="R6" ; find_ball
pcbpin="8_31" ; ball="V4" ; find_ball
pcbpin="8_32" ; ball="T5" ; find_ball
pcbpin="8_33" ; ball="V3" ; find_ball
pcbpin="8_34" ; ball="U4" ; find_ball
pcbpin="8_35" ; ball="V2" ; find_ball
pcbpin="8_36" ; ball="U3" ; find_ball
pcbpin="8_37" ; ball="U1" ; find_ball
pcbpin="8_38" ; ball="U2" ; find_ball
pcbpin="8_39" ; ball="T3" ; find_ball
pcbpin="8_40" ; ball="T4" ; find_ball
pcbpin="8_41" ; ball="T1" ; find_ball
pcbpin="8_42" ; ball="T2" ; find_ball
pcbpin="8_43" ; ball="R3" ; find_ball
pcbpin="8_44" ; ball="R4" ; find_ball
pcbpin="8_45" ; ball="R1" ; find_ball
pcbpin="8_46" ; ball="R2" ; find_ball

msg="/************************/" ; echo_both
msg="/* P9 Header */" ; echo_both
msg="/************************/" ; echo_both ; msg="" ; echo_both

msg="/* P9_01 GND */" ; echo_both
msg="/* P9_02 GND */" ; echo_both
msg="/* P9_03 3.3V */" ; echo_both
msg="/* P9_04 3.3V */" ; echo_both
msg="/* P9_05 VDD_5V */" ; echo_both
msg="/* P9_06 VDD_5V */" ; echo_both
msg="/* P9_07 SYS_5V */" ; echo_both
msg="/* P9_08 SYS_5V */" ; echo_both
msg="/* P9_09 PWR_BUT */" ; echo_both
msg="/* P9_10 (ZCZ ball A10) RESETn */" ; echo_both ; msg="" ; echo_both

pcbpin="9_11" ; ball="T17" ; find_ball
pcbpin="9_12" ; ball="U18" ; find_ball
pcbpin="9_13" ; ball="U17" ; find_ball
pcbpin="9_14" ; ball="U14" ; find_ball
pcbpin="9_15" ; ball="R13" ; find_ball
pcbpin="9_16" ; ball="T14" ; find_ball
pcbpin="9_17" ; ball="A16" ; find_ball
pcbpin="9_18" ; ball="B16" ; find_ball
pcbpin="9_21" ; ball="B17" ; find_ball
pcbpin="9_22" ; ball="A17" ; find_ball
pcbpin="9_23" ; ball="V14" ; find_ball
pcbpin="9_24" ; ball="D15" ; find_ball
pcbpin="9_25" ; ball="A14" ; find_ball
pcbpin="9_26" ; ball="D16" ; find_ball
pcbpin="9_27" ; ball="C13" ; find_ball
pcbpin="9_28" ; ball="C12" ; find_ball
pcbpin="9_29" ; ball="B13" ; find_ball
pcbpin="9_30" ; ball="D12" ; find_ball
pcbpin="9_31" ; ball="A13" ; find_ball
pcbpin="9_41" ; ball="D14" ; find_ball
pcbpin="9_91" ; ball="D13" ; find_ball
pcbpin="9_42" ; ball="C18" ; find_ball
pcbpin="9_92" ; ball="B12" ; find_ball

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
