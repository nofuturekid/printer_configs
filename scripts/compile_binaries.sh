#!/bin/bash

compile_duet_3_6hc() {
    echo "Compiling firmware for Duet 3 6HC"
    cp -f /home/pi/klipper_config/boards/duet_3_6hc/firmware.config /home/pi/klipper/.config
    make olddefconfig
    make clean
    make
    cp /home/pi/klipper/out/klipper.bin /home/pi/klipper_config/firmware_binaries/duet_3_6hc.bin
}

mkdir -p /home/pi/klipper_config/firmware_binaries

pushd /home/pi/klipper
compile_duet_3_6hc
chown pi:pi /home/pi/klipper_config/firmware_binaries/*.bin
popd
