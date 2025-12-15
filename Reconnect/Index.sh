export PATH=/data/data/com.termux/files/usr/bin:/system/bin:/system/xbin:/sdcard:/data/data/com.termux/files/home
LOG_FILE="/sdcard/Reconnect/log.txt"
WEBHOOK_FILE="/sdcard/Reconnect/webhookurl.txt"
PS_LINK_FILE="/sdcard/Reconnect/linkps.txt"

while :
do
    echo ""
    echo "=== Roblox Manager ==="
    echo "1. Get Client Data"
    echo "2. Client Process List"
    echo "3. Import Webhook URL"
    echo "4. Import Private Server Link"
    echo "5. Auto Reconnect"
    echo "6. Exit"
    printf "Pilih menu: "
    read menu

    case "$menu" in
        1)
            python3 /sdcard/Reconnect/ClientData.py
            ;;
        
        2)
            if [[ -f "$LOG_FILE" ]]; then
                echo "Membaca log file: $LOG_FILE"
                cat "$LOG_FILE"
            else
                echo "Client Data Not Found!"
            fi
            ;;
        
        3)
            echo "Masukkan Webhook URL: "
            read webhook_url
            if [[ -n "$webhook_url" ]]; then
                echo "$webhook_url" > "$WEBHOOK_FILE"
                echo "Webhook URL berhasil disimpan di $WEBHOOK_FILE"
            else
                echo "URL tidak valid. Silakan coba lagi."
            fi
            ;;
        
        4)
            echo "Masukkan Private Server Link: "
            read ps_link
            if [[ -n "$ps_link" ]]; then
                echo "$ps_link" > "$PS_LINK_FILE"
                echo "Private Server Link berhasil disimpan di $PS_LINK_FILE"
            else
                echo "Link tidak valid. Silakan coba lagi."
            fi
            ;;

        5)
            echo "Starting Auto Reconnect..."
            echo "checking status..."
            python3 /sdcard/Reconnect/CheckingStatus.py &

            echo "Preparing Reconnect Script..."
            dos2unix /sdcard/Reconnect/reconnect.sh
            chmod +x /sdcard/Reconnect/reconnect.sh
            sh /sdcard/Reconnect/reconnect.sh &
            ;;
        
        6)
            echo "Keluar dari program..."
            exit 0
            ;;
        
        *)
            echo "Pilihan tidak valid!"
            ;;
    esac
done
