capemgr: enable/disable capes on kernel cmdline:
------------

Comma delimited list of PART-NUMBER[:REV] of [enabled/disabled] capes

    beaglebone-capemgr.enable_partno=
    beaglebone-capemgr.disable_partno=

.config requirements:
------------

Serial:

    CONFIG_SERIAL_OMAP=y
    CONFIG_SERIAL_OMAP_CONSOLE=y

Testing:
------------

BB-BONE-SERL-03-00A1.dts:

    sudo /sbin/getty -L ttyO2 115200 vt102
