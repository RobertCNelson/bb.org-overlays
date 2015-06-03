Requirements:
------------

Kernel with CONFIG_BONE_CAPEMGR support:

    zcat /proc/config.gz | grep CONFIG_BONE_CAPEMGR
    CONFIG_BONE_CAPEMGR=y

Latest dtc version:

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

slots:
------------

directory:

    debian@beaglebone:~$ cat /sys/devices/platform/bone_capemgr/slots
     0: 54:P---L BeagleBone RS232 CAPE,00A1,Beagleboardtoys,BB-BONE-SERL-03
     1: 55:PF---
     2: 56:PF---
     3: 57:PF---

.config requirements:
------------

BeagleBone DVI-D CAPE (tilcd_tfp410):

    # CONFIG_OMAP2_DSS is not set

led:

    CONFIG_LEDS_GPIO=m

PWM Backlight:

    CONFIG_DRM_TILCDC=m
    CONFIG_BACKLIGHT_PWM=m

Serial:

    CONFIG_SERIAL_OMAP=y
    CONFIG_SERIAL_OMAP_CONSOLE=y

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
