#!/bin/sh -l -c

cd out/target/product/violet

ZIPNAME="SHRP_v3.0_stable-Official_violet_*.zip"
curl -F chat_id=1033360588 -F document=@$ZIPNAME -F parse_mode=markdown https://api.telegram.org/bot1744981054:AAEwTewZaL8Z6K49crBWlfRnW3Zi9Aqim6U/sendDocument
