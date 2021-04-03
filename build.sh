#!/bin/sh -l -c
mkdir -p /tmp/recovery
cd /tmp/recovery
apt install tmate -y
apt install git -y
git config --global user.name "Dazzler555"
git config --global user.email "71560605+Dazzler555@users.noreply.github.com"

tg(){
	bot_api=1744981054:AAEwTewZaL8Z6K49crBWlfRnW3Zi9Aqim6U
	your_telegram_id=$1 # No need to touch 
	msg=$2 # No need to touch
	curl -s "https://api.telegram.org/bot${bot_api}/sendmessage" --data "text=$msg&chat_id=${your_telegram_id}"
}

id=1033360588

tmate -S /tmp/tmate.sock new-session -d && tmate -S /tmp/tmate.sock wait tmate-ready && send_shell=$(tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}') && tg $id "Your Tmate XD" && tg $id "$send_shell"

repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-9.0 -g default,-device,-mips,-darwin,-notdefault 
repo sync -j$(nproc --all)


git clone https://github.com/Brock5555/twrp_device_xiaomi_violet.git -b android-9.0 device/xiaomi/violet

rm -rf out
. build/envsetup.sh && lunch omni_violet-eng && export ALLOW_MISSING_DEPENDENCIES=true && mka recoveryimage

cd out/target/product/violet
curl -sL https://git.io/file-transfer | sh
./transfer wet *.zip
./transfer wet recovery.img
up(){
	curl --upload-file $1 https://transfer.sh/$(basename $1); echo
	# 14 days, 10 GB limit
}
tg(){
	bot_api=1744981054:AAEwTewZaL8Z6K49crBWlfRnW3Zi9Aqim6U # Your tg bot api, dont use my one haha, it's better to encrypt bot api too.
	your_telegram_id=$1 # No need to touch 
	msg=$2 # No need to touch
	curl -s "https://api.telegram.org/bot${bot_api}/sendmessage" --data "text=$msg&chat_id=${your_telegram_id}"
}
PWD(){
      ~/out/target/product/violet/
     }
send_zip=$(up PWD/*img) && tg $id "Build Succeed! $send_zip"
