Requirements:
------------

Kernel with CONFIG_BONE_CAPEMGR support:

    zcat /proc/config.gz | grep CONFIG_BONE_CAPEMGR
    CONFIG_BONE_CAPEMGR=y

Latest dtc version:

    dtc --version
    Version: DTC 1.4.1-g92616917


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

Serial:

    CONFIG_SERIAL_OMAP=y
    CONFIG_SERIAL_OMAP_CONSOLE=y

BBB compatibility issues:
------------

Use blank overlay (/boot/uEnv.txt):

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

Cape Testing:
------------

BB-BONE-SERL-03-00A1.dts:

    sudo /sbin/getty -L ttyO2 115200 vt102

BB-UART1-00A0.dts:

    sudo /sbin/getty -L ttyO1 115200 vt102

BB-UART2-00A0.dts:

    sudo /sbin/getty -L ttyO2 115200 vt102

BB-UART4-00A0.dts:

    sudo /sbin/getty -L ttyO4 115200 vt102

BB-UART5-00A0.dts:

    sudo /sbin/getty -L ttyO5 115200 vt102
