Build Status

 [![Build Status](http://gfnd.rcn-ee.org:8080/buildStatus/icon?job=beagleboard_overlays/master)](http://gfnd.rcn-ee.org:8080/job/beagleboard_overlays/job/master/)


Users:
------------

Install or Update bb-cape-overlays debian package (pre installed on: Debian Stretch/Buster & Ubuntu Bionic images)

    sudo apt update ; sudo apt install bb-cape-overlays

Supported Linux Kernels:
------------

Pre-built kernels: (there are multiple options avaiable)

    cd /opt/scripts/tools
    git pull

Supported Linux Kernels: v5.4.x:
------------

v5.4.x-ti:

    sudo /opt/scripts/tools/update_kernel.sh --lts-5_4 --ti-channel

v5.4.x-ti + Real Time:

    sudo /opt/scripts/tools/update_kernel.sh --lts-5_4 --ti-rt-channel

v5.4.x mainline:

    sudo /opt/scripts/tools/update_kernel.sh --lts-5_4 --bone-channel

v5.4.x mainline + Real Time:

    sudo /opt/scripts/tools/update_kernel.sh --lts-5_4 --bone-rt-channel

Supported Linux Kernels: v4.19.x:
------------

v4.19.x-ti:

    sudo /opt/scripts/tools/update_kernel.sh --lts-4_19 --ti-channel

v4.19.x-ti + Real Time:

    sudo /opt/scripts/tools/update_kernel.sh --lts-4_19 --ti-rt-channel

v4.19.x mainline:

    sudo /opt/scripts/tools/update_kernel.sh --lts-4_19 --bone-channel

v4.19.x mainline + Real Time:

    sudo /opt/scripts/tools/update_kernel.sh --lts-4_19 --bone-rt-channel

Supported Linux Kernels: v4.14.x:
------------

v4.14.x-ti:

    sudo /opt/scripts/tools/update_kernel.sh --lts-4_14 --ti-channel

v4.14.x-ti + Real Time:

    sudo /opt/scripts/tools/update_kernel.sh --lts-4_14 --ti-rt-channel

v4.14.x mainline:

    sudo /opt/scripts/tools/update_kernel.sh --lts-4_14 --bone-channel

v4.14.x mainline + Real Time:

    sudo /opt/scripts/tools/update_kernel.sh --lts-4_14 --bone-rt-channel

Developers:
------------

Step 1: Clone this repo:

    git clone https://github.com/beagleboard/bb.org-overlays
    cd ./bb.org-overlays

Step 2: Install *.dtbo:

    ./install.sh

Developers: Tested Versions of dtc: (dtc v1.4.7 is minimum required)
------------

    v1.4.7
    v1.5.0
    v1.5.1

U-Boot Overlays:
------------

https://elinux.org/Beagleboard:BeagleBoneBlack_Debian#U-Boot_Overlays

Legacy Branch: legacy-dtc-1.4.4
------------

Step 1: Clone this repo:

    git clone -b legacy-dtc-1.4.4 https://github.com/beagleboard/bb.org-overlays
    cd ./bb.org-overlays

Step 2: Install *.dtbo:

    ./install.sh

Cape Universal Overlays only in Legacy Branch: (these have been embedded into the base *.dtb tree for v4.14.x+ for a few years)

    bb-cape-universal.dtsi
    cape-univ-audio-00A0.dts
    cape-univ-emmc-00A0.dts
    cape-universal-00A0.dts
    cape-universala-00A0.dts
    cape-universalh-00A0.dts
    cape-universaln-00A0.dts
    cape-univ-hdmi-00A0.dts
    univ-all-00A0.dts
    univ-bbb-EVA-00A0.dts
    univ-bbb-EVx-00A0.dts
    univ-bbb-Exx-00A0.dts
    univ-bbb-xVA-00A0.dts
    univ-bbb-xVx-00A0.dts
    univ-bbb-xxx-00A0.dts
    univ-bbgw-00A0.dts
    univ-bbgw-EW-00A0.dts
    univ-bbgw-Ex-00A0.dts
    univ-bbgw-xW-00A0.dts
    univ-bbgw-xx-00A0.dts
    univ-emmc-00A0.dts
    univ-hdmi-00A0.dts
    univ-nhdmi-00A0.dts

v4.4.x: removed kernel overlays

    AM335X-PRU-RPROC-4-4-TI-00A0.dts
    AM335X-PRU-RPROC-4-4-TI-PRUCAPE-00A0.dts

v4.9.x: removed kernel overlays

    AM335X-PRU-RPROC-4-9-TI-00A0.dts
    AM335X-PRU-RPROC-4-9-TI-PRUCAPE-00A0.dts
