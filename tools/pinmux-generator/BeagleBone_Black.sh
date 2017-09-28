#!/bin/bash

source $(dirname "$0")/lib/pinmux.sh

file="BeagleBone_Black"

generate_timer="enable"

echo "" > ${file}.dts
echo "" >${file}-pinmux.dts
echo "" >${file}-gpio.dts

#BeagleBone Black

msg="/************************/" ; echo_both
msg="/* P8 Header */" ; echo_both
msg="/************************/" ; echo_both
msg="" ; echo_both
msg="/* P8_01 GND */" ; echo_both
msg="/* P8_02 GND */" ; echo_both
msg="" ; echo_both

default_name="emmc" ; pcbpin="8_03" ; ball="R9" ; find_ball
default_name="emmc" ; pcbpin="8_04" ; ball="T9" ; find_ball
default_name="emmc" ; pcbpin="8_05" ; ball="R8" ; find_ball
default_name="emmc" ; pcbpin="8_06" ; ball="T8" ; find_ball
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
default_name="emmc" ; pcbpin="8_20" ; ball="V9" ; find_ball
default_name="emmc" ; pcbpin="8_21" ; ball="U9" ; find_ball
default_name="emmc" ; pcbpin="8_22" ; ball="V8" ; find_ball
default_name="emmc" ; pcbpin="8_23" ; ball="U8" ; find_ball
default_name="emmc" ; pcbpin="8_24" ; ball="V7" ; find_ball
default_name="emmc" ; pcbpin="8_25" ; ball="U7" ; find_ball
pcbpin="8_26" ; ball="V6" ; find_ball
default_name="hdmi" ; pcbpin="8_27" ; ball="U5" ; find_ball
default_name="hdmi" ; pcbpin="8_28" ; ball="V5" ; find_ball
default_name="hdmi" ; pcbpin="8_29" ; ball="R5" ; find_ball
default_name="hdmi" ; pcbpin="8_30" ; ball="R6" ; find_ball
default_name="hdmi" ; pcbpin="8_31" ; ball="V4" ; find_ball
default_name="hdmi" ; pcbpin="8_32" ; ball="T5" ; find_ball
default_name="hdmi" ; pcbpin="8_33" ; ball="V3" ; find_ball
default_name="hdmi" ; pcbpin="8_34" ; ball="U4" ; find_ball
default_name="hdmi" ; pcbpin="8_35" ; ball="V2" ; find_ball
default_name="hdmi" ; pcbpin="8_36" ; ball="U3" ; find_ball
default_name="hdmi" ; pcbpin="8_37" ; ball="U1" ; find_ball
default_name="hdmi" ; pcbpin="8_38" ; ball="U2" ; find_ball
default_name="hdmi" ; pcbpin="8_39" ; ball="T3" ; find_ball
default_name="hdmi" ; pcbpin="8_40" ; ball="T4" ; find_ball
default_name="hdmi" ; pcbpin="8_41" ; ball="T1" ; find_ball
default_name="hdmi" ; pcbpin="8_42" ; ball="T2" ; find_ball
default_name="hdmi" ; pcbpin="8_43" ; ball="R3" ; find_ball
default_name="hdmi" ; pcbpin="8_44" ; ball="R4" ; find_ball
default_name="hdmi" ; pcbpin="8_45" ; ball="R1" ; find_ball
default_name="hdmi" ; pcbpin="8_46" ; ball="R2" ; find_ball

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

msg="/* Leave the cape I2C EEPROM bus alone */" ; echo_both
msg="/* P9_19 (ZCZ ball D17) I2C */" ; echo_both
msg="/* P9_20 (ZCZ ball D18) I2C */" ; echo_both ; msg="" ; echo_both

#default="I2C" ; pcbpin="9_19" ; ball="D17" ; find_ball
#default="I2C" ; pcbpin="9_20" ; ball="D18" ; find_ball

pcbpin="9_21" ; ball="B17" ; find_ball
pcbpin="9_22" ; ball="A17" ; find_ball
pcbpin="9_23" ; ball="V14" ; find_ball
pcbpin="9_24" ; ball="D15" ; find_ball
default_name="audio" ; pcbpin="9_25" ; ball="A14" ; find_ball
pcbpin="9_26" ; ball="D16" ; find_ball
pcbpin="9_27" ; ball="C13" ; find_ball
default_name="audio" ; pcbpin="9_28" ; ball="C12" ; find_ball
default_name="audio" ; pcbpin="9_29" ; ball="B13" ; find_ball
pcbpin="9_30" ; ball="D12" ; find_ball
default_name="audio" ; pcbpin="9_31" ; ball="A13" ; find_ball

msg="/* P9_32 VADC */" ; echo_both
msg="/* P9_33 (ZCZ ball C8) AIN4 */" ; echo_both
msg="/* P9_34 AGND */" ; echo_both
msg="/* P9_35 (ZCZ ball A8) AIN6 */" ; echo_both
msg="/* P9_36 (ZCZ ball B8) AIN5 */" ; echo_both
msg="/* P9_37 (ZCZ ball B7) AIN2 */" ; echo_both
msg="/* P9_38 (ZCZ ball A7) AIN3 */" ; echo_both
msg="/* P9_39 (ZCZ ball B6) AIN0 */" ; echo_both
msg="/* P9_40 (ZCZ ball C7) AIN1 */" ; echo_both ; msg="" ; echo_both

pcbpin="9_41" ; ball="D14" ; find_ball
msg="/* P9_41.1 */" ; echo_both
pcbpin="9_91" ; ball="D13" ; find_ball
pcbpin="9_42" ; ball="C18" ; find_ball
pcbpin="9_92" ; ball="B12" ; find_ball

msg="/* P9_43 GND */" ; echo_both
msg="/* P9_44 GND */" ; echo_both
msg="/* P9_45 GND */" ; echo_both
msg="/* P9_46 GND */" ; echo_both ; msg="" ; echo_both

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
