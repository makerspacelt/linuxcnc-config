#!/bin/bash
set -e

echo "Compiling Device Tree ... "
dtc -O dtb -o SHAPEOKO-BBB-1.dtbo -b 0 -@ SHAPEOKO-BBB-1.dts

echo "Moving Device Tree Blob to firmwares ..."
sudo mv SHAPEOKO-BBB-1.dtbo /lib/firmware/
