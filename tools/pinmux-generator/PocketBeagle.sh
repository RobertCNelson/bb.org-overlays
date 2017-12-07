#!/bin/bash

source $(dirname "$0")/lib/pinmux.sh

file="PocketBeagle"

echo "" > ${file}.dts
echo "" >${file}-pinmux.dts
echo "" >${file}-gpio.dts
echo "" >${file}_config-pin.txt

#PocketBeagle

msg="/************************/" ; echo_both
msg="/* P1 Header */" ; echo_both
msg="/************************/" ; echo_both
msg="" ; echo_both

msg="/* P1_01                VIN-AC */" ; echo_both ; msg="" ; echo_both
echo "P1_01_PIN=\"power\"" >>${file}_config-pin.txt
echo "P1_01_INFO=\"VIN-AC\"" >>${file}_config-pin.txt
echo "P1_01_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

default_mode="7" ; pcbpin="P1_02" ; ball="R5" ; find_ball

msg="/* P1_03 (ZCZ ball F15) usb1_vbus_out */" ; echo_both ; msg="" ; echo_both
echo "P1_03_PIN=\"system\"" >>${file}_config-pin.txt
echo "P1_03_INFO=\"usb1_vbus_out\"" >>${file}_config-pin.txt
echo "P1_03_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

default_mode="7" ; pcbpin="P1_04" ; ball="R6" ; find_ball

msg="/* P1_05 (ZCZ ball T18) usb1_vbus_in */" ; echo_both ; msg="" ; echo_both
echo "P1_05_PIN=\"system\"" >>${file}_config-pin.txt
echo "P1_05_INFO=\"usb1_vbus_in\"" >>${file}_config-pin.txt
echo "P1_05_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

default_mode="0" ; cp_default="spi_cs" ; pcbpin="P1_06" ; ball="A16" ; find_ball

msg="/* P1_07                VIN-USB      */" ; echo_both ; msg="" ; echo_both
echo "P1_07_PIN=\"system\"" >>${file}_config-pin.txt
echo "P1_07_INFO=\"VIN-USB\"" >>${file}_config-pin.txt
echo "P1_07_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

default_mode="0" ; cp_default="spi_sclk" ; pcbpin="P1_08" ; ball="A17" ; find_ball

msg="/* P1_09 (ZCZ ball R18) USB1-DN      */" ; echo_both ; msg="" ; echo_both
echo "P1_09_PIN=\"system\"" >>${file}_config-pin.txt
echo "P1_09_INFO=\"USB1-DN\"" >>${file}_config-pin.txt
echo "P1_09_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

default_mode="0" ; cp_default="spi" ;  pcbpin="P1_10" ; ball="B17" ; find_ball

msg="/* P1_11 (ZCZ ball R17) USB1-DP      */" ; echo_both ; msg="" ; echo_both
echo "P1_11_PIN=\"system\"" >>${file}_config-pin.txt
echo "P1_11_INFO=\"USB1-DP\"" >>${file}_config-pin.txt
echo "P1_11_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

default_mode="0" ; cp_default="spi" ; pcbpin="P1_12" ; ball="B16" ; find_ball

msg="/* P1_13 (ZCZ ball P17) USB1-ID      */" ; echo_both
echo "P1_13_PIN=\"system\"" >>${file}_config-pin.txt
echo "P1_13_INFO=\"USB1-ID\"" >>${file}_config-pin.txt
echo "P1_13_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

msg="/* P1_14                VOUT-3.3V    */" ; echo_both
echo "P1_14_PIN=\"power\"" >>${file}_config-pin.txt
echo "P1_14_INFO=\"VOUT-3.3V\"" >>${file}_config-pin.txt
echo "P1_14_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

msg="/* P1_15                GND          */" ; echo_both
echo "P1_15_PIN=\"gnd\"" >>${file}_config-pin.txt
echo "P1_15_INFO=\"GND\"" >>${file}_config-pin.txt
echo "P1_15_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

msg="/* P1_16                GND          */" ; echo_both
echo "P1_16_PIN=\"gnd\"" >>${file}_config-pin.txt
echo "P1_16_INFO=\"GND\"" >>${file}_config-pin.txt
echo "P1_16_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

msg="/* P1_17 (ZCZ ball A9)  VREFN        */" ; echo_both
echo "P1_17_PIN=\"power\"" >>${file}_config-pin.txt
echo "P1_17_INFO=\"VREFN\"" >>${file}_config-pin.txt
echo "P1_17_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

msg="/* P1_18 (ZCZ ball B9)  VREFP        */" ; echo_both
echo "P1_18_PIN=\"power\"" >>${file}_config-pin.txt
echo "P1_18_INFO=\"VREFP\"" >>${file}_config-pin.txt
echo "P1_18_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

msg="/* P1_19 (ZCZ ball B6)  AIN0         */" ; echo_both ; msg="" ; echo_both
echo "P1_19_PIN=\"adc\"" >>${file}_config-pin.txt
echo "P1_19_INFO=\"AIN0\"" >>${file}_config-pin.txt
echo "P1_19_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

default_mode="7" ; pcbpin="P1_20" ; ball="D14" ; find_ball

exit

msg="/* P1_21 (ZCZ ball C7)  AIN1         */" ; echo_both
echo "P1_21_PIN=\"adc\"" >>${file}_config-pin.txt
echo "P1_21_INFO=\"AIN1\"" >>${file}_config-pin.txt
echo "P1_21_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

msg="/* P1_22                GND          */" ; echo_both
echo "P1_22_PIN=\"gnd\"" >>${file}_config-pin.txt
echo "P1_22_INFO=\"GND\"" >>${file}_config-pin.txt
echo "P1_22_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

msg="/* P1_23 (ZCZ ball B7)  AIN2         */" ; echo_both
echo "P1_23_PIN=\"adc\"" >>${file}_config-pin.txt
echo "P1_23_INFO=\"AIN2\"" >>${file}_config-pin.txt
echo "P1_23_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

msg="/* P1_24                VOUT-5V      */" ; echo_both
echo "P1_24_PIN=\"power\"" >>${file}_config-pin.txt
echo "P1_24_INFO=\"VOUT-5V\"" >>${file}_config-pin.txt
echo "P1_24_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

msg="/* P1_25 (ZCZ ball A7)  AIN3         */" ; echo_both ; msg="" ; echo_both
echo "P1_25_PIN=\"adc\"" >>${file}_config-pin.txt
echo "P1_25_INFO=\"AIN3\"" >>${file}_config-pin.txt
echo "P1_25_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

default_mode="3" ; cp_default="i2c" ; pcbpin="P1_26" ; ball="D18" ; find_ball

msg="/* P1_27 (ZCZ ball C8)  AIN4         */" ; echo_both ; msg="" ; echo_both
echo "P1_27_PIN=\"adc\"" >>${file}_config-pin.txt
echo "P1_27_INFO=\"AIN4\"" >>${file}_config-pin.txt
echo "P1_27_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

default_mode="3" ; cp_default="i2c" ; pcbpin="P1_28" ; ball="D17" ; find_ball

default_mode="7" ; pcbpin="P1_29" ; ball="A14" ; find_ball

default_mode="0" ; cp_default="uart" ;  pcbpin="P1_30" ; ball="E16" ; find_ball

default_mode="7" ; pcbpin="P1_31" ; ball="B12" ; find_ball

default_mode="0" ; cp_default="uart" ; pcbpin="P1_32" ; ball="E15" ; find_ball

exit

pcbpin="P1_33" ; ball="B13" ; find_ball
pcbpin="P1_34" ; ball="T11" ; find_ball
pcbpin="P1_35" ; ball="V5" ; find_ball

cp_info_default="ehrpwm0A" ; cp_default="pwm" ; default="PWM" ; pcbpin="P1_36" ; ball="A13" ; find_ball

msg="" ; echo_both

msg="/************************/" ; echo_both
msg="/* P2 Header */" ; echo_both
msg="/************************/" ; echo_both
msg="" ; echo_both

cp_info_default="ehrpwm1A" ; cp_default="pwm" ; default="PWM" ; pcbpin="P2_01" ; ball="U14" ; find_ball

pcbpin="P2_02" ; ball="V17" ; find_ball
pcbpin="P2_03" ; ball="T10" ; find_ball
pcbpin="P2_04" ; ball="T16" ; find_ball

cp_info_default="uart4_rxd" ; cp_default="uart" ; default="UART" ; pcbpin="P2_05" ; ball="T17" ; find_ball

pcbpin="P2_06" ; ball="U16" ; find_ball

cp_info_default="uart4_txd" ; cp_default="uart" ; default="UART" ; pcbpin="P2_07" ; ball="U17" ; find_ball

pcbpin="P2_08" ; ball="U18" ; find_ball

cp_info_default="I2C1_SCL" ; cp_default="i2c" ; default="I2C" ; pcbpin="P2_09" ; ball="D15" ; find_ball

pcbpin="P2_10" ; ball="R14" ; find_ball

cp_info_default="I2C1_SDA" ; cp_default="i2c" ; default="I2C" ; pcbpin="P2_11" ; ball="D16" ; find_ball

msg="/* P2_12                POWER_BUTTON */" ; echo_both
echo "P2_12_PIN=\"system\"" >>${file}_config-pin.txt
echo "P2_12_INFO=\"POWER_BUTTON\"" >>${file}_config-pin.txt
echo "P2_12_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

msg="/* P2_13                VOUT-5V */" ; echo_both
echo "P2_13_PIN=\"power\"" >>${file}_config-pin.txt
echo "P2_13_INFO=\"VOUT-5V\"" >>${file}_config-pin.txt
echo "P2_13_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

msg="/* P2_14                BAT-VIN */" ; echo_both
echo "P2_14_PIN=\"power\"" >>${file}_config-pin.txt
echo "P2_14_INFO=\"BAT-VIN\"" >>${file}_config-pin.txt
echo "P2_14_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

msg="/* P2_15                GND */" ; echo_both
echo "P2_15_PIN=\"gnd\"" >>${file}_config-pin.txt
echo "P2_15_INFO=\"GND\"" >>${file}_config-pin.txt
echo "P2_15_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

msg="/* P2_16                BAT-TEMP */" ; echo_both ; msg="" ; echo_both
echo "P2_16_PIN=\"power\"" >>${file}_config-pin.txt
echo "P2_16_INFO=\"BAT-TEMP\"" >>${file}_config-pin.txt
echo "P2_16_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

pcbpin="P2_17" ; ball="V12" ; find_ball
pcbpin="P2_18" ; ball="U13" ; find_ball
pcbpin="P2_19" ; ball="U12" ; find_ball
pcbpin="P2_20" ; ball="T13" ; find_ball

msg="/* P2_21                GND */" ; echo_both ; msg="" ; echo_both
echo "P2_21_PIN=\"gnd\"" >>${file}_config-pin.txt
echo "P2_21_INFO=\"GND\"" >>${file}_config-pin.txt
echo "P2_21_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

pcbpin="P2_22" ; ball="V13" ; find_ball

msg="/* P2_23                VOUT-3.3V */" ; echo_both ; msg="" ; echo_both
echo "P2_23_PIN=\"power\"" >>${file}_config-pin.txt
echo "P2_23_INFO=\"VOUT-3.3V\"" >>${file}_config-pin.txt
echo "P2_23_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

pcbpin="P2_24" ; ball="T12" ; find_ball

cp_info_default="spi1_d1" ; cp_default="spi" ; default="SPI" ; pcbpin="P2_25" ; ball="E17" ; find_ball

msg="/* P2_26                RESET# */" ; echo_both ; msg="" ; echo_both
echo "P2_26_PIN=\"system\"" >>${file}_config-pin.txt
echo "P2_26_INFO=\"RESET#\"" >>${file}_config-pin.txt
echo "P2_26_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

cp_info_default="spi1_d0" ; cp_default="spi" ; default="SPI" ; pcbpin="P2_27" ; ball="E18" ; find_ball

pcbpin="P2_28" ; ball="D13" ; find_ball

cp_info_default="spi1_sclk" ; cp_default="spi_sclk" ; default="spi_sclk" ; pcbpin="P2_29" ; ball="C18" ; find_ball

pcbpin="P2_30" ; ball="C12" ; find_ball

cp_info_default="spi1_cs1" ; cp_default="spi_cs" ; default="spi_cs" ; pcbpin="P2_31" ; ball="A15" ; find_ball

pcbpin="P2_32" ; ball="D12" ; find_ball
pcbpin="P2_33" ; ball="R12" ; find_ball
pcbpin="P2_34" ; ball="C13" ; find_ball
pcbpin="P2_35" ; ball="U5" ; find_ball

msg="/* P2_36 (ZCZ ball C9)  AIN7         */" ; echo_both ; msg="" ; echo_both
echo "P2_36_PIN=\"adc\"" >>${file}_config-pin.txt
echo "P2_36_INFO=\"AIN7\"" >>${file}_config-pin.txt
echo "P2_36_CAPE=\"\"" >>${file}_config-pin.txt
echo "" >>${file}_config-pin.txt

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
