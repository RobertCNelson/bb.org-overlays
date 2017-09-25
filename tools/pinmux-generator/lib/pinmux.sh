#!/bin/bash

#cat AM335x.json | jq '.devicePins'
#cat AM335x.json | jq '.useCases'
#cat AM335x.json | jq '.packages .ID_0 .packagePin[202] .devicePinID'

echo_both () {
#	echo "$msg"
	echo "$msg" >> ${file}.dts
	echo "$msg" >> ${file}-pinmux.dts
}

echo_pinmux () {
	echo "/* P${pcbpin} (ZCZ ball ${found_ball}) ${PinID} */" >> ${file}-pinmux.dts
	echo "P${pcbpin}_pinmux {" >> ${file}-pinmux.dts
	echo "	compatible = \"bone-pinmux-helper\";" >> ${file}-pinmux.dts
	echo "	status = \"okay\";" >> ${file}-pinmux.dts
	list="\"default\", \"gpio\", \"gpio_pu\", \"gpio_pd\""
	cp_list="default gpio gpio_pu gpio_pd"
	if [ "x${got_spi_pin}" = "xenable" ] ; then
		list="${list}, \"spi\""
		cp_list="${cp_list} spi"
	fi
	if [ "x${got_uart_pin}" = "xenable" ] ; then
		list="${list}, \"uart\""
		cp_list="${cp_list} uart"
	fi
	if [ "x${got_can_pin}" = "xenable" ] ; then
		list="${list}, \"can\""
		cp_list="${cp_list} can"
	fi
	if [ "x${got_i2c_pin}" = "xenable" ] ; then
		list="${list}, \"i2c\""
		cp_list="${cp_list} i2c"
	fi
	if [ "x${got_qep_pin}" = "xenable" ] ; then
		list="${list}, \"qep\""
		cp_list="${cp_list} qep"
	fi
	if [ "x${got_pwm_pin}" = "xenable" ] ; then
		list="${list}, \"pwm\""
		cp_list="${cp_list} pwm"
	fi
	if [ "x${got_pru_uart_pin}" = "xenable" ] ; then
		list="${list}, \"pru_uart\""
		cp_list="${cp_list} pru_uart"
	fi
	if [ "x${got_timer_pin}" = "xenable" ] ; then
		list="${list}, \"timer\""
		cp_list="${cp_list} timer"
	fi
	if [ "x${got_pruout_pin}" = "xenable" ] ; then
		list="${list}, \"pruout\""
		cp_list="${cp_list} pruout"
	fi
	if [ "x${got_pruin_pin}" = "xenable" ] ; then
		list="${list}, \"pruin\""
		cp_list="${cp_list} pruin"
	fi

	echo "P${pcbpin}_PRU=\"${cp_pru_gpio_number}\"" >> ${file}_config-pin.txt
	echo "P${pcbpin}_GPIO=\"${cp_gpio_number}\"" >> ${file}_config-pin.txt
	echo "P${pcbpin}_PIN=\"gpio\"" >> ${file}_config-pin.txt
	echo "P${pcbpin}_PINMUX=\"${cp_list}\"" >> ${file}_config-pin.txt
	echo "P${pcbpin}_INFO=\"${PinID} ${cp_list}\"" >> ${file}_config-pin.txt
	echo "P${pcbpin}_CAPE=\"uboot\"" >> ${file}_config-pin.txt
	echo "" >> ${file}_config-pin.txt

	echo "	pinctrl-names = ${list};" >> ${file}-pinmux.dts
	echo "	pinctrl-0 = <&P${pcbpin}_default_pin>;" >> ${file}-pinmux.dts
	echo "	pinctrl-1 = <&P${pcbpin}_gpio_pin>;" >> ${file}-pinmux.dts
	echo "	pinctrl-2 = <&P${pcbpin}_gpio_pu_pin>;" >> ${file}-pinmux.dts
	echo "	pinctrl-3 = <&P${pcbpin}_gpio_pd_pin>;" >> ${file}-pinmux.dts
	index=4
	if [ "x${got_spi_pin}" = "xenable" ] ; then
		echo "	pinctrl-${index} = <&P${pcbpin}_spi_pin>;" >> ${file}-pinmux.dts
		index=$((index + 1))
	fi
	if [ "x${got_uart_pin}" = "xenable" ] ; then
		echo "	pinctrl-${index} = <&P${pcbpin}_uart_pin>;" >> ${file}-pinmux.dts
		index=$((index + 1))
	fi
	if [ "x${got_can_pin}" = "xenable" ] ; then
		echo "	pinctrl-${index} = <&P${pcbpin}_can_pin>;" >> ${file}-pinmux.dts
		index=$((index + 1))
	fi
	if [ "x${got_i2c_pin}" = "xenable" ] ; then
		echo "	pinctrl-${index} = <&P${pcbpin}_i2c_pin>;" >> ${file}-pinmux.dts
		index=$((index + 1))
	fi
	if [ "x${got_qep_pin}" = "xenable" ] ; then
		echo "	pinctrl-${index} = <&P${pcbpin}_qep_pin>;" >> ${file}-pinmux.dts
		index=$((index + 1))
	fi
	if [ "x${got_pwm_pin}" = "xenable" ] ; then
		echo "	pinctrl-${index} = <&P${pcbpin}_pwm_pin>;" >> ${file}-pinmux.dts
		index=$((index + 1))
	fi
	if [ "x${got_pru_uart_pin}" = "xenable" ] ; then
		echo "	pinctrl-${index} = <&P${pcbpin}_pru_uart_pin>;" >> ${file}-pinmux.dts
		index=$((index + 1))
	fi
#What do we have that uses timer?
#	if [ "x${got_timer_pin}" = "xenable" ] ; then
#		echo "	pinctrl-${index} = <&P${pcbpin}_timer_pin>;" >> ${file}-pinmux.dts
#		index=$((index + 1))
#	fi
	if [ "x${got_pruout_pin}" = "xenable" ] ; then
		echo "	pinctrl-${index} = <&P${pcbpin}_pruout_pin>;" >> ${file}-pinmux.dts
		index=$((index + 1))
	fi
	if [ "x${got_pruin_pin}" = "xenable" ] ; then
		echo "	pinctrl-${index} = <&P${pcbpin}_pruin_pin>;" >> ${file}-pinmux.dts
		index=$((index + 1))
	fi

	echo "};" >> ${file}-pinmux.dts
	echo "" >> ${file}-pinmux.dts
}

echo_gpio () {
	echo "	P${pcbpin} {" >> ${file}-gpio.dts
	echo "		gpio-name = \"P${pcbpin}\";" >> ${file}-gpio.dts
	echo "		gpio = <&${gpio_pinmux} 0>;" >> ${file}-gpio.dts
	echo "		input;" >> ${file}-gpio.dts
	echo "		dir-changeable;" >> ${file}-gpio.dts
	echo "	};" >> ${file}-gpio.dts
	echo "">> ${file}-gpio.dts
}

get_json_pkg () {
	if [ -d ./tmp/ ] ; then
		rm -rf ./tmp/ || true
	fi
	wget http://downloads.ti.com/ccs/esd/pinmux/pinmux-4.0.1496-setup.run
	chmod +x pinmux-4.0.1496-setup.run
	mkdir tmp
	./pinmux-4.0.1496-setup.run --mode unattended --prefix ./tmp
	cp -v tmp/pinmux/deviceData/AM335x/AM335x.json ./
	rm -rf ./tmp/ || true
	rm -rf pinmux-4.0.1496-setup.run || true
	rm -rf pinmux_4.0.1496.log || true
}

get_name_mode () {
	#cat AM335x.json | jq '.pinCommonInfos .'${found_devicePinID}' .pinModeInfo['$number'] .signalName' | sed 's/\"//g' | sed 's/\[/_/g' | sed 's/\]//g' || true

	name=$(cat AM335x.json | jq '.pinCommonInfos .'${found_devicePinID}' .pinModeInfo['$number'] .signalName' | sed 's/\"//g' | sed 's/\[/_/g' | sed 's/\]//g' || true)
	mode=$(cat AM335x.json | jq '.pinCommonInfos .'${found_devicePinID}' .pinModeInfo['$number'] .mode' | sed 's/\"//g' || true)
	ioDir=$(cat AM335x.json | jq '.pinCommonInfos .'${found_devicePinID}' .pinModeInfo['$number'] .ioDir' | sed 's/\"//g' || true)
}

find_ball () {
	echo "##################"
	echo "P${pcbpin}"
	#Use "ball" to get devicePinID & powerDomainID

	#cat AM335x.json | jq '.packages .ID_0 .packagePin[0]'
	#{
	#  "devicePinID": "ID_1690",
	#  "ball": "R13",
	#  "powerDomainID": "ID_1691"
	#}

	for number in {0..202}
	do
		compare=$(cat AM335x.json | jq '.packages .ID_0 .packagePin['$number'] .ball' | sed 's/\"//g' || true)
		if [ "x${compare}" = "x${ball}" ] ; then
			#echo "debug-${ball}-----------------------------------------"
			#cat AM335x.json | jq '.packages .ID_0 .packagePin['$number']'
			#echo "debug-${ball}-----------------------------------------"
			found_devicePinID=$(cat AM335x.json | jq '.packages .ID_0 .packagePin['$number'] .devicePinID' | sed 's/\"//g' || true)
			found_ball=$(cat AM335x.json | jq '.packages .ID_0 .packagePin['$number'] .ball' | sed 's/\"//g' || true)
			found_powerDomainID=$(cat AM335x.json | jq '.packages .ID_0 .packagePin['$number'] .powerDomainID' | sed 's/\"//g' || true)
			echo "devicePinID=${found_devicePinID},ball=${found_ball},powerDomainID=${found_powerDomainID}"
			break;
		fi
	done

	#Using devicePinID find name

	#cat AM335x.json | jq '.devicePins .ID_1985'
	#{
	#  "type": "DevicePin",
	#  "name": "lcd_hsync",
	#  "description": "",
	#  "devicePinType": "Default",
	#  "id": "ID_1985"
	#}

	#echo "debug-${ball}-----------------------------------------"
	#cat AM335x.json | jq '.devicePins .'${found_devicePinID}''
	#echo "debug-${ball}-----------------------------------------"
	PinID=$(cat AM335x.json | jq '.devicePins .'${found_devicePinID}' .name' | sed 's/\"//g' || true)
	echo "name=${PinID}"

	#Using devicePinID find controlRegisterOffset

	#cat AM335x.json | jq '.pinCommonInfos .ID_1985'
	#{
	#  "type": "PinCommonInfo",
	#  "devicePinID": "ID_1985",
	#  "controlRegisterOffset": "0x08e4",
	#  "pupdStateDuringHHV": "OFF",
	#  "pupdStateAfterHHV": "PD",

	#echo "debug-${ball}-----------------------------------------"
	#cat AM335x.json | jq '.pinCommonInfos .'${found_devicePinID}''
	#echo "debug-${ball}-----------------------------------------"
	cro=$(cat AM335x.json | jq '.pinCommonInfos .'${found_devicePinID}' .controlRegisterOffset' | sed 's/\"//g' || true)
	echo "controlRegisterOffset=${cro}"

	#  "pinModeInfo": [
	#    {
	#      "peripheralPinID": "ID_1986",
	#      "mode": "0",
	#      "interfaceName": "LCDC",
	#      "signalName": "lcd_hsync",
	#      "ioDir": "O"
	#    },
	#    {
	#      "peripheralPinID": "ID_1775",
	#      "mode": "1",
	#      "interfaceName": "GPMC",
	#      "signalName": "gpmc_a9",
	#      "ioDir": "O"
	#    },
	#    {
	#      "peripheralPinID": "ID_1715",
	#      "mode": "2",
	#      "interfaceName": "GPMC",
	#      "signalName": "gpmc_a2",
	#      "ioDir": "O"
	#    },
	#    {
	#      "peripheralPinID": "ID_1987",
	#      "mode": "3",
	#      "interfaceName": "ECAT_PRUSS1",
	#      "signalName": "pr1_edio_data_in3",
	#      "ioDir": "I"
	#    },
	#    {
	#      "peripheralPinID": "ID_1988",
	#      "mode": "4",
	#      "interfaceName": "ECAT_PRUSS1",
	#      "signalName": "pr1_edio_data_out3",
	#      "ioDir": "O"
	#    },
	#    {
	#      "peripheralPinID": "ID_1989",
	#      "mode": "5",
	#      "interfaceName": "PRU1_PRUSS1",
	#      "signalName": "pr1_pru1_pru_r30[9]",
	#      "ioDir": "O"
	#    },
	#    {
	#      "peripheralPinID": "ID_1990",
	#      "mode": "6",
	#      "interfaceName": "PRU1_PRUSS1",
	#      "signalName": "pr1_pru1_pru_r31[9]",
	#      "ioDir": "I"
	#    },
	#    {
	#      "peripheralPinID": "ID_1991",
	#      "mode": "7",
	#      "interfaceName": "GPIO2",
	#      "signalName": "gpio2[23]",
	#      "ioDir": "IO"
	#    }
	#  ]
	#}

unset gpio_name
unset pru_mode5_name
unset pru_mode6_name
unset spi_name
unset i2c_name
unset uart_name
unset pwm_name
unset uart0_pruss1_name
unset ecap0_pruss1_name
unset timer_name
unset eqep_name
unset dcan_name

	for number in {0..8}
	do
		cat AM335x.json | jq '.pinCommonInfos .'${found_devicePinID}' .pinModeInfo['$number'] .interfaceName'
		compare=$(cat AM335x.json | jq '.pinCommonInfos .'${found_devicePinID}' .pinModeInfo['$number'] .interfaceName' | sed 's/\"//g' || true)
		if [ "x${compare}" = "xGPIO0" ] || [ "x${compare}" = "xGPIO1" ] || [ "x${compare}" = "xGPIO2" ] || [ "x${compare}" = "xGPIO3" ]; then
			get_name_mode

			gpio_name=${name}
			gpio_mode=${mode}
			gpio_ioDir=${ioDir}
			gpio_pinmux=$(echo ${gpio_name} | sed 's/_/ /g')
			echo "P${pcbpin}:${ball}:${name}:${mode}:${ioDir}"
		fi
		if [ "x${compare}" = "xPRU0_PRUSS1" ] || [ "x${compare}" = "xPRU1_PRUSS1" ] ; then
			get_name_mode

			if [ "x${mode}" = "x5" ] ; then
				pru_mode5_name=${name}
				pru_mode5_mode=${mode}
				pru_mode5_ioDir=${ioDir}
				echo "P${pcbpin}:${ball}:${name}:${mode}:${ioDir}"
			fi

			if [ "x${mode}" = "x6" ] ; then
				pru_mode6_name=${name}
				pru_mode6_mode=${mode}
				pru_mode6_ioDir=${ioDir}
				echo "P${pcbpin}:${ball}:${name}:${mode}:${ioDir}"
			fi
		fi
		if [ "x${compare}" = "xSPI0" ] || [ "x${compare}" = "xSPI1" ]; then
			get_name_mode

			spi_name=${name}
			spi_mode=${mode}
			spi_ioDir=${ioDir}
			echo "P${pcbpin}:${ball}:${name}:${mode}:${ioDir}"
		fi
		if [ "x${compare}" = "xI2C1" ] || [ "x${compare}" = "xI2C2" ] ; then
			get_name_mode

			i2c_name=${name}
			i2c_mode=${mode}
			i2c_ioDir=${ioDir}
			echo "P${pcbpin}:${ball}:${name}:${mode}:${ioDir}"
		fi
		if [ "x${compare}" = "xUART0" ] || [ "x${compare}" = "xUART1" ] || [ "x${compare}" = "xUART2" ] || [ "x${compare}" = "xUART3" ]|| [ "x${compare}" = "xUART4" ] || [ "x${compare}" = "xUART5" ] ; then
			get_name_mode

			if [ "x${name}" = "xuart0_rxd" ] || [ "x${name}" = "xuart1_rxd" ] || [ "x${name}" = "xuart2_rxd" ] || [ "x${name}" = "xuart3_rxd" ] || [ "x${name}" = "xuart4_rxd" ] || [ "x${name}" = "xuart5_rxd" ] ; then
				uart_name=${name}
				uart_mode=${mode}
				uart_ioDir=${ioDir}
				echo "P${pcbpin}:${ball}:${name}:${mode}:${ioDir}"
			fi
			if [ "x${name}" = "xuart0_txd" ] || [ "x${name}" = "xuart1_txd" ] || [ "x${name}" = "xuart2_txd" ] || [ "x${name}" = "xuart3_txd" ] || [ "x${name}" = "xuart4_txd" ] || [ "x${name}" = "xuart5_txd" ] ; then
				uart_name=${name}
				uart_mode=${mode}
				uart_ioDir=${ioDir}
				echo "P${pcbpin}:${ball}:${name}:${mode}:${ioDir}"
			fi
		fi
		if [ "x${compare}" = "xDCAN1" ] ; then
			get_name_mode

			dcan_name=${name}
			dcan_mode=${mode}
			dcan_ioDir=${ioDir}
			echo "P${pcbpin}:${ball}:${name}:${mode}:${ioDir}"
		fi
		if [ "x${compare}" = "xeCAP0" ] || [ "x${compare}" = "xeHRPWM0" ] || [ "x${compare}" = "xeHRPWM1" ] || [ "x${compare}" = "xeHRPWM2" ] ; then
			get_name_mode

			pwm_name=${name}
			pwm_mode=${mode}
			pwm_ioDir=${ioDir}
			echo "P${pcbpin}:${ball}:${name}:${mode}:${ioDir}"
		fi
		if [ "x${compare}" = "xUART0_PRUSS1" ] ; then
			get_name_mode

			if [ "x${name}" = "xpr1_uart0_txd" ] || [ "x${name}" = "xpr1_uart0_rxd" ] ; then
				uart0_pruss1_name=${name}
				uart0_pruss1_mode=${mode}
				uart0_pruss1_ioDir=${ioDir}
				echo "P${pcbpin}:${ball}:${name}:${mode}:${ioDir}"
			fi
		fi
		if [ "x${compare}" = "xeCAP0_PRUSS1" ] ; then
			get_name_mode

			ecap0_pruss1_name=${name}
			ecap0_pruss1_mode=${mode}
			ecap0_pruss1_ioDir=${ioDir}
			echo "${ball}:${name}:${mode}:${ioDir}"
		fi
#What do we have that uses timer?
#		if [ "x${compare}" = "xTIMER4" ] || [ "x${compare}" = "xTIMER5" ] || [ "x${compare}" = "xTIMER6" ] || [ "x${compare}" = "xTIMER7" ] ; then
#			get_name_mode
#
#			timer_name=${name}
#			timer_mode=${mode}
#			timer_ioDir=${ioDir}
#			echo "P${pcbpin}:${ball}:${name}:${mode}:${ioDir}"
#		fi
		if [ "x${compare}" = "xeQEP0" ] || [ "x${compare}" = "xeQEP1" ] || [ "x${compare}" = "xeQEP2" ] ; then
			get_name_mode

			eqep_name=${name}
			eqep_mode=${mode}
			eqep_ioDir=${ioDir}
			echo "P${pcbpin}:${ball}:${name}:${mode}:${ioDir}"
		fi

	done

unset got_pruout_pin
unset got_pruin_pin
unset got_pwm_pin
unset got_spi_pin
unset got_uart_pin
unset got_qep_pin
unset got_can_pin
unset got_i2c_pin
unset got_pru_uart_pin
unset got_timer_pin

echo "/* P${pcbpin} (ZCZ ball ${found_ball}) ${PinID} */" >> ${file}.dts
if [ "x${default}" = "x" ] ; then
	echo "P${pcbpin}_default_pin: pinmux_P${pcbpin}_default_pin { pinctrl-single,pins = <" >> ${file}.dts
	echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE7) >; };	/* ${PinID}.${gpio_name} */" >> ${file}.dts
else
	if [ "x${default}" = "xI2C" ] ; then
		echo "P${pcbpin}_default_pin: pinmux_P${pcbpin}_default_pin { pinctrl-single,pins = <" >> ${file}.dts
		echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLUP | INPUT_EN | MUX_MODE${i2c_mode}) >; };	/* ${PinID}.${i2c_name} */" >> ${file}.dts
		unset default
	fi
	if [ "x${default}" = "xPWM" ] ; then
		echo "P${pcbpin}_default_pin: pinmux_P${pcbpin}_default_pin { pinctrl-single,pins = <" >> ${file}.dts
		echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE${pwm_mode}) >; };	/* ${PinID}.${pwm_name} */" >> ${file}.dts
		unset default
	fi
	if [ "x${default}" = "xSPI" ] ; then
		echo "P${pcbpin}_default_pin: pinmux_P${pcbpin}_default_pin { pinctrl-single,pins = <" >> ${file}.dts
		echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLUP | INPUT_EN | MUX_MODE${spi_mode}) >; };	/* ${PinID}.${spi_name} */" >> ${file}.dts
		unset default
	fi
	if [ "x${default}" = "xUART" ] ; then
		echo "P${pcbpin}_default_pin: pinmux_P${pcbpin}_default_pin { pinctrl-single,pins = <" >> ${file}.dts
		echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE${uart_mode}) >; };	/* ${PinID}.${uart_name} */" >> ${file}.dts
		unset default
	fi
fi

echo "P${pcbpin}_gpio_pin: pinmux_P${pcbpin}_gpio_pin { pinctrl-single,pins = <" >> ${file}.dts
echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT | INPUT_EN | MUX_MODE7) >; };	/* ${PinID}.${gpio_name} */" >> ${file}.dts
echo "P${pcbpin}_gpio_pu_pin: pinmux_P${pcbpin}_gpio_pu_pin { pinctrl-single,pins = <" >> ${file}.dts
echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLUP | INPUT_EN | MUX_MODE7) >; };	/* ${PinID}.${gpio_name} */" >> ${file}.dts
echo "P${pcbpin}_gpio_pd_pin: pinmux_P${pcbpin}_gpio_pd_pin { pinctrl-single,pins = <" >> ${file}.dts
echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE7) >; };	/* ${PinID}.${gpio_name} */" >> ${file}.dts

gpio_mul=$(echo ${gpio_name} | awk -F'_' '{print $1}' | awk -F'gpio' '{print $2}' || true)
gpio_add=$(echo ${gpio_name} | awk -F'_' '{print $2}' || true)
cp_gpio_number=$(echo "${gpio_mul} * 32" | bc)
cp_gpio_number=$(echo "${cp_gpio_number} + ${gpio_add}" | bc)
cp_pru_gpio_number=$(echo "${cp_gpio_number} + 32" | bc)

if [ ! "x${spi_name}" = "x" ] ; then
	echo "P${pcbpin}_spi_pin: pinmux_P${pcbpin}_spi_pin { pinctrl-single,pins = <" >> ${file}.dts
	echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLUP | INPUT_EN | MUX_MODE${spi_mode}) >; };	/* ${PinID}.${spi_name} */" >> ${file}.dts
	got_spi_pin="enable"
fi

if [ ! "x${i2c_name}" = "x" ] ; then
	echo "P${pcbpin}_i2c_pin: pinmux_P${pcbpin}_i2c_pin { pinctrl-single,pins = <" >> ${file}.dts
	echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLUP | INPUT_EN | MUX_MODE${i2c_mode}) >; };	/* ${PinID}.${i2c_name} */" >> ${file}.dts
	got_i2c_pin="enable"
fi

if [ ! "x${uart_name}" = "x" ] ; then
	echo "P${pcbpin}_uart_pin: pinmux_P${pcbpin}_uart_pin { pinctrl-single,pins = <" >> ${file}.dts
	echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE${uart_mode}) >; };	/* ${PinID}.${uart_name} */" >> ${file}.dts
	got_uart_pin="enable"
fi

if [ ! "x${dcan_name}" = "x" ] ; then
	echo "P${pcbpin}_can_pin: pinmux_P${pcbpin}_can_pin { pinctrl-single,pins = <" >> ${file}.dts
	echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLUP | INPUT_EN | MUX_MODE${dcan_mode}) >; };	/* ${PinID}.${dcan_name} */" >> ${file}.dts
	got_can_pin="enable"
fi

if [ ! "x${uart0_pruss1_name}" = "x" ] ; then
	echo "P${pcbpin}_pru_uart_pin: pinmux_P${pcbpin}_pru_uart_pin { pinctrl-single,pins = <" >> ${file}.dts
	echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLUP | INPUT_EN | MUX_MODE${uart0_pruss1_mode}) >; };	/* ${PinID}.${uart0_pruss1_name} */" >> ${file}.dts
	got_pru_uart_pin="enable"
fi

#What do we have that uses timer?
#if [ ! "x${timer_name}" = "x" ] ; then
#	echo "P${pcbpin}_timer_pin: pinmux_P${pcbpin}_timer_pin { pinctrl-single,pins = <" >> ${file}.dts
#	echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLUP | INPUT_EN | MUX_MODE${timer_mode}) >; };	/* ${PinID}.${timer_name} */" >> ${file}.dts
#	got_timer_pin="enable"
#fi

if [ ! "x${pru_mode5_name}" = "x" ] ; then
	if [ "x${pru_mode5_ioDir}" = "xO" ] ; then
		echo "P${pcbpin}_pruout_pin: pinmux_P${pcbpin}_pruout_pin { pinctrl-single,pins = <" >> ${file}.dts
		echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE${pru_mode5_mode}) >; };	/* ${PinID}.${pru_mode5_name} */" >> ${file}.dts
		got_pruout_pin="enable"
	else
		echo "P${pcbpin}_pruin_pin: pinmux_P${pcbpin}_pruin_pin { pinctrl-single,pins = <" >> ${file}.dts
		echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE${pru_mode5_mode}) >; };	/* ${PinID}.${pru_mode5_name} */" >> ${file}.dts
		got_pruin_pin="enable"
	fi
fi

if [ ! "x${pru_mode6_name}" = "x" ] ; then
	if [ "x${pru_mode6_ioDir}" = "xO" ] ; then
		echo "P${pcbpin}_pruout_pin: pinmux_P${pcbpin}_pruout_pin { pinctrl-single,pins = <" >> ${file}.dts
		echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE${pru_mode6_mode}) >; };	/* ${PinID}.${pru_mode6_name} */" >> ${file}.dts
		got_pruout_pin="enable"
	else
		echo "P${pcbpin}_pruin_pin: pinmux_P${pcbpin}_pruin_pin { pinctrl-single,pins = <" >> ${file}.dts
		echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE${pru_mode6_mode}) >; };	/* ${PinID}.${pru_mode6_name} */" >> ${file}.dts
		got_pruin_pin="enable"
	fi
fi

if [ ! "x${pwm_name}" = "x" ] ; then
	echo "P${pcbpin}_pwm_pin: pinmux_P${pcbpin}_pwm_pin { pinctrl-single,pins = <" >> ${file}.dts
	echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE${pwm_mode}) >; };	/* ${PinID}.${pwm_name} */" >> ${file}.dts
	got_pwm_pin="enable"
fi

if [ ! "x${ecap0_pruss1_name}" = "x" ] ; then
	echo "P${pcbpin}_pru_ecap_pin: pinmux_P${pcbpin}_pru_ecap_pin { pinctrl-single,pins = <" >> ${file}.dts
	echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE${ecap0_pruss1_mode}) >; };	/* ${PinID}.${ecap0_pruss1_name} */" >> ${file}.dts
fi

if [ ! "x${eqep_name}" = "x" ] ; then
	echo "P${pcbpin}_qep_pin: pinmux_P${pcbpin}_qep_pin { pinctrl-single,pins = <" >> ${file}.dts
	echo "	AM33XX_IOPAD(${cro}, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE${eqep_mode}) >; };	/* ${PinID}.${eqep_name} */" >> ${file}.dts
	got_qep_pin="enable"
fi

echo "" >> ${file}.dts
echo_pinmux
echo_gpio

#0x05 = 0000 0101
#0x26 = 0010 0110
#0x27 = 0010 0111
#0x2F = 0010 1111
#0x30 = 0011 0000
#0x32 = 0011 0010
#0x37 = 0011 0111

#0x05 : PIN_OUTPUT_PULLDOWN | MUX_MODE5
#0x24 : PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE4
#0x26 : PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE6
#0x27 : PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE7
#0x2F : PIN_OUTPUT | INPUT_EN | MUX_MODE7
#0x30 : PIN_OUTPUT_PULLUP | INPUT_EN | MUX_MODE0
#0x32 : PIN_OUTPUT_PULLUP | INPUT_EN | MUX_MODE2
#0x37 : PIN_OUTPUT_PULLUP | INPUT_EN | MUX_MODE7

#			P9_17_default_pin: pinmux_P9_17_default_pin {
#				pinctrl-single,pins = <0x15c  0x37>; };	/* Mode 7, Pull-Up, RxActive */
#			P9_17_gpio_pin: pinmux_P9_17_gpio_pin {
#				pinctrl-single,pins = <0x15c  0x2F>; };	/* Mode 7, RxActive */
#			P9_17_gpio_pu_pin: pinmux_P9_17_gpio_pu_pin {
#				pinctrl-single,pins = <0x15c  0x37>; };	/* Mode 7, Pull-Up, RxActive */
#			P9_17_gpio_pd_pin: pinmux_P9_17_gpio_pd_pin {
#				pinctrl-single,pins = <0x15c  0x27>; };	/* Mode 7, Pull-Down, RxActive */
#			P9_17_spi_pin: pinmux_P9_17_spi_pin {
#				pinctrl-single,pins = <0x15c  0x30>; };	/* Mode 0, Pull-Up, RxActive */
#			P9_17_i2c_pin: pinmux_P9_17_i2c_pin {
#				pinctrl-single,pins = <0x15c  0x32>; };	/* Mode 2, Pull-Up, RxActive */
#			P9_17_pwm_pin: pinmux_P9_17_pwm_pin {
#				pinctrl-single,pins = <0x15c  0x33>; };	/* Mode 3, Pull-Up, RxActive */
#			P9_17_pru_uart_pin: pinmux_P9_17_pru_uart_pin {
#				pinctrl-single,pins = <0x15c  0x34>; };	/* Mode 4, Pull-Up, RxActive */

	echo "##################"
}

if [ ! -f AM335x.json ] ; then
	get_json_pkg
fi
