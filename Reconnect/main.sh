#!/system/bin/sh
# Menambahkan PATH khusus untuk flush.sh
export PATH=/data/data/com.termux/files/usr/bin:/system/bin:/system/xbin:/sdcard:/data/data/com.termux/files/home

export WEBHOOK_URL="https://discord.com/api/webhooks/1444621772870783016/zGgY3sRh6cTKUc3xuV3r_xY61VAH18JajRI_vFT1W40IqOHrUYD1EhhwBk6pfpqbgADd"
export PS_LINK="https://www.roblox.com/games/121864768012064/Fish-It?privateServerLinkCode=80716470014750973347679818857221"

python3 /sdcard/data.py &
sleep 150

dos2unix /sdcard/reconnect.sh
chmod +x /sdcard/reconnect.sh
sh /sdcard/reconnect.sh
