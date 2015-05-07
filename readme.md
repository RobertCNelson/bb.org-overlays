.config requirements:
------------

Serial:

    CONFIG_SERIAL_OMAP=y
    CONFIG_SERIAL_OMAP_CONSOLE=y

Testing:
------------

BB-BONE-SERL-03-00A1.dts:

    sudo /sbin/getty -L ttyO2 115200 vt102
