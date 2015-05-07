capemgr: enable/disable capes on kernel cmdline:
------------

Comma delimited list of PART-NUMBER[:REV] of [enabled/disabled] capes

    beaglebone-capemgr.enable_partno=
    beaglebone-capemgr.disable_partno=

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

Serial:

    CONFIG_SERIAL_OMAP=y
    CONFIG_SERIAL_OMAP_CONSOLE=y

Testing:
------------

BB-BONE-SERL-03-00A1.dts:

    sudo /sbin/getty -L ttyO2 115200 vt102

BB-UART1-00A0.dts:

    sudo /sbin/getty -L ttyO1 115200 vt102
