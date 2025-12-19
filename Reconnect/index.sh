export PATH=/data/data/com.termux/files/usr/bin:/system/bin:/system/xbin:/sdcard:/data/data/com.termux/files/home
LOG_FILE="/sdcard/Reconnect/log.txt"
WEBHOOK_FILE="/sdcard/Reconnect/webhookurl.txt"
PS_LINK_FILE="/sdcard/Reconnect/linkps.txt"

while :
do
    echo " "
    echo "==== Roblox Manager ===="
    echo "1. Client Manager"
    echo "2. Auto Reconnect Manager"
    echo "3. Executor Manager"
    echo "4. Exit"
    echo "======================="
    echo " "
    printf "Pilih menu: "
    echo " "
    read menu

    case "$menu" in
        1)
            echo "Client Manager"
            echo "1. Get Client Data"
            echo "2. Client Account List"
            printf "Pilih menu: "
            echo " "
            read client_menu
            case "$client_menu" in
                1)
                    python3 /sdcard/Reconnect/ClientData.py
                    cat "$LOG_FILE"
                    ;;
                2)
                    if [[ -f "$LOG_FILE" ]]; then
                        echo "Membaca log file: $LOG_FILE"
                        cat "$LOG_FILE"
                    else
                        echo "Client Data Not Found!"
                    fi
                    ;;
                *)
                    echo "Pilihan executor tidak valid!"
                    ;; 
            esac
            ;;
        2)
            echo "Auto Reconnect Manager"
            echo "1. Import Webhook URL"
            echo "2. Import Private Server Link"
            printf "Pilih menu: "
            echo " "
            read reconnect_menu
            case "$reconnect_menu" in
                1)
                    echo "Masukkan Webhook URL: "
                    read webhook_url
                    if [[ -n "$webhook_url" ]]; then
                        echo "$webhook_url" > "$WEBHOOK_FILE"
                        echo "Webhook URL berhasil disimpan di $WEBHOOK_FILE"
                    else
                        echo "URL tidak valid. Silakan coba lagi."
                    fi
                    ;;
                2)
                    echo "Masukkan Private Server Link: "
                    read ps_link
                    if [[ -n "$ps_link" ]]; then
                        echo "$ps_link" > "$PS_LINK_FILE"
                        echo "Private Server Link berhasil disimpan di $PS_LINK_FILE"
                    else
                        echo "Link tidak valid. Silakan coba lagi."
                    fi
                    ;;  
            esac
            ;;
        3)
            echo "Executor Manager"    
            echo "1. Delta"
            echo "2. Arceus X"
            echo "3. Codex"
            printf "Pilih executor: "
            read executor_choice
            case "$executor_choice" in
                1)
                    echo "Delta selected."
                    echo "1. Get Links"
                    echo "2. Import Keys"
                    printf "Pilih menu: "
                    read delta_menu
                    case "$delta_menu" in
                        1)
                            sh /sdcard/Reconnect/GetDeltaKey.sh
                            ;;
                        2)
                            sh /sdcard/Reconnect/ImportDeltaKey.sh
                            ;;
                        *)
                        echo "Pilihan tidak valid!"
                        ;;
                    esac
                    ;;
                2)  
                    echo "Arceus X selected."
                    echo "Coming Soon..."                    
                    ;;
                3) 
                    echo "Codex selected."
                    echo "Coming Soon..."
                    ;;
            esac
            ;;
        4)
            echo "Keluar dari program."
            exit 0
            ;;
        *)
            echo "Pilihan tidak valid!"
            ;;
    esac
done
