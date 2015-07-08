Requirements:
------------

Kernel with CONFIG_BONE_CAPEMGR support:

    zcat /proc/config.gz | grep CONFIG_BONE_CAPEMGR
    CONFIG_BONE_CAPEMGR=y

Kernel update:

    cd /opt/scripts/tools
    git pull
    sudo ./update_kernel.sh --lts --bone-channel

Latest dtc version: (this is only for v4.1.x+ for v3.8.x dtbo's use the older version)

    dtc --version
    Version: DTC 1.4.1-g2341721b


Updating dtc:

    ./dtc-overlay.sh

Installing:
------------

    ./install.sh

capemgr: enable/disable capes on kernel cmdline:
------------

Comma delimited list of PART-NUMBER[:REV] of [enabled/disabled] capes

    bone_capemgr.enable_partno=
    bone_capemgr.disable_partno=


capemgr: enable/disable capes with slots:
------------

Slots:

    debian@beaglebone:~$ cat /sys/devices/platform/bone_capemgr/slots
     0: PF----  -1
     1: PF----  -1
     2: PF----  -1
     3: PF----  -1

Add Device:

    sudo sh -c "echo 'BB-UART1' > /sys/devices/platform/bone_capemgr/slots"
    
    [  255.828371] bone_capemgr bone_capemgr: part_number 'BB-UART1', version 'N/A'
    [  255.828436] bone_capemgr bone_capemgr: slot #4: override
    [  255.828468] bone_capemgr bone_capemgr: Using override eeprom data at slot 4
    [  255.828501] bone_capemgr bone_capemgr: slot #4: 'Override Board Name,00A0,Override Manuf,BB-UART1'
    [  255.855687] 48022000.serial: ttyS1 at MMIO 0x48022000 (irq = 181, base_baud = 3000000) is a 8250
    [  255.856691] bone_capemgr bone_capemgr: slot #4: dtbo 'BB-UART1-00A0.dtbo' loaded; overlay id #0
    
    debian@beaglebone:~$ cat /sys/devices/platform/bone_capemgr/slots
     0: PF----  -1
     1: PF----  -1
     2: PF----  -1
     3: PF----  -1
     4: P-O-L-   0 Override Board Name,00A0,Override Manuf,BB-UART1

Remove Device:

    sudo sh -c "echo '-4' > /sys/devices/platform/bone_capemgr/slots"
    
    [  787.808035] bone_capemgr bone_capemgr: Removed slot #4
    
    debian@beaglebone:~$ cat /sys/devices/platform/bone_capemgr/slots
     0: PF----  -1
     1: PF----  -1
     2: PF----  -1
     3: PF----  -1

.config requirements:
------------

BeagleBone DVI-D CAPE (tilcd_tfp410):

    # CONFIG_OMAP2_DSS is not set

led:

    CONFIG_LEDS_GPIO=m

PWM Backlight:

    CONFIG_DRM_TILCDC=m
    CONFIG_BACKLIGHT_PWM=m

SPI:

    CONFIG_SPI_OMAP24XX=m

BBB compatibility issues:
------------

Use blank overlay (HDMI & eMMC disabled) (/boot/uEnv.txt):

    dtb=am335x-boneblack-overlay.dtb

BB-BONE-DVID-01-00A3.dts

    Disable: HDMI & eMMC

BB-BONE-LCD3-01-00A2.dts

    Disable: HDMI

BB-BONE-LCD4-01-00A1.dts

    Disable: HDMI

BB-BONE-LCD7-01-00A3.dts

    Disable: HDMI

BB-UART5-00A0.dts:

    Disable: HDMI

Manually Loading Capes:
------------

example: BB-RTC-01-00A0.dts

    bone_capemgr.enable_partno=BB-RTC-01

example: BB-BONE-LCD7-01-00A3.dts

    bone_capemgr.enable_partno=BB-BONE-LCD7-01:00A3
