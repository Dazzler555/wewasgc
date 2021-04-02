#!/bin/sh -l -c

mkdir -p /tmp/recovery
cd /tmp/recovery

repo init --depth=1 -u git://github.com/SHRP/platform_manifest_twrp_omni.git -b v3_9.0 -g default,-device,-mips,-darwin,-notdefault 
repo sync -j$(nproc --all)




git clone https://github.com/SHRP-Devices/device_xiaomi_violet.git -b android-9.0 device/xiaomi/violet

rm -rf out
. build/envsetup.sh && lunch omni_violet-eng && export LC_ALL="C" && export ALLOW_MISSING_DEPENDENCIES=true && mka recoveryimage

cd out/target/product/violet
curl -sL https://git.io/file-transfer | sh
./transfer wet *.zip
./transfer wet recovery.img
