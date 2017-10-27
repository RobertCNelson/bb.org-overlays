#!/bin/bash

#https://github.com/beagleboard/beaglebone-blue/blob/master/BeagleBone_Blue_sch.pdf

source $(dirname "$0")/lib/pinmux.sh

file="BeagleBone_Blue"

unset generate_timer

echo "" > ${file}.dts
echo "" >${file}-pinmux.dts
echo "" >${file}-gpio.dts
echo "" >${file}_config-pin.txt

#BeagleBone Blue

#E1
#EQEP_0A
cp_info_default="eqep0a_in" ; cp_default="qep" ; default="qep" ; pcbpin="E1_3" ; ball="B12" ; find_ball
#EQEP_0B
cp_info_default="eqep0b_in" ; cp_default="qep" ; default="qep" ; pcbpin="E1_4" ; ball="C13" ; find_ball

#E2
#EQEP_1A V2
cp_info_default="eqep1a_in" ; cp_default="qep" ; default="qep" ; pcbpin="E2_3" ; ball="V2" ; find_ball
#EQEP_1B V3
cp_info_default="eqep1b_in" ; cp_default="qep" ; default="qep" ; pcbpin="E2_4" ; ball="V3" ; find_ball

#E3
#EQEP_1A T12
cp_info_default="eqep2a_in" ; cp_default="qep" ; default="qep" ; pcbpin="E3_3" ; ball="T12" ; find_ball
#EQEP_1B R12
cp_info_default="eqep2b_in" ; cp_default="qep" ; default="qep" ; pcbpin="E3_4" ; ball="R12" ; find_ball

#E4
#pruin V13
cp_info_default="pruin" ; cp_default="pruin" ; default="pruin" ; pcbpin="E4_3" ; ball="V13" ; find_ball
#pruin U13
cp_info_default="pruin" ; cp_default="pruin" ; default="pruin" ; pcbpin="E4_4" ; ball="U13" ; find_ball

#UT0
#UART0_RX
cp_info_default="uart" ; cp_default="uart" ; default="UART" ; pcbpin="UT0_3" ; ball="E15" ; find_ball
#UART0_TX
cp_info_default="uart" ; cp_default="uart" ; default="UART" ; pcbpin="UT0_4" ; ball="E16" ; find_ball

#UT1
#UART1_RX
cp_info_default="uart" ; cp_default="uart" ; default="UART" ; pcbpin="UT1_3" ; ball="D16" ; find_ball
#UART1_TX
cp_info_default="uart" ; cp_default="uart" ; default="UART" ; pcbpin="UT1_4" ; ball="D15" ; find_ball

#UT5
#UART5_RX
cp_info_default="uart" ; cp_default="uart" ; default="UART" ; pcbpin="UT5_3" ; ball="U2" ; find_ball
#UART5_TX
cp_info_default="uart" ; cp_default="uart" ; default="UART" ; pcbpin="UT5_4" ; ball="U1" ; find_ball

#CAN has to be on...

#DSM2
#UART4_RX
cp_info_default="uart" ; cp_default="uart" ; default="UART" ; pcbpin="DSM2_3" ; ball="T17" ; find_ball

#i2c has to be on...

#GP0
pcbpin="GP0_3" ; ball="U16" ; find_ball
pcbpin="GP0_4" ; ball="V14" ; find_ball
pcbpin="GP0_5" ; ball="D13" ; find_ball
pcbpin="GP0_6" ; ball="C12" ; find_ball

#GP1
pcbpin="GP1_3" ; ball="J15" ; find_ball
pcbpin="GP1_4" ; ball="H17" ; find_ball
pcbpin="GP1_5" ; ball="R7" ; find_ball
pcbpin="GP1_6" ; ball="T7" ; find_ball

#ADC

#GPS
cp_info_default="uart" ; cp_default="uart" ; default="UART" ; pcbpin="GPS_3" ; ball="A17" ; find_ball
cp_info_default="uart" ; cp_default="uart" ; default="UART" ; pcbpin="GPS_4" ; ball="B17" ; find_ball

#SPI1
#SPI1_MOSI
cp_info_default="spi1_d1" ; cp_default="spi" ; default="SPI" ; pcbpin="SPI1_3" ; ball="D12" ; find_ball
#SPI1_MISO
cp_info_default="spi1_d0" ; cp_default="spi" ; default="SPI" ; pcbpin="SPI1_4" ; ball="B13" ; find_ball
#SPI1_SCK
cp_info_default="spi1_sclk" ; cp_default="spi_sclk" ; default="spi_sclk" ; pcbpin="SPI1_5" ; ball="A13" ; find_ball

#SPI1_SS1
cp_info_default="spi1_cs0" ; cp_default="spi_cs" ; default="spi_cs" ; pcbpin="S1.1_6" ; ball="H18" ; find_ball
#SPI1_SS2
cp_info_default="spi1_cs1" ; cp_default="spi_cs" ; default="spi_cs" ; pcbpin="S1.2_6" ; ball="C18" ; find_ball

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
