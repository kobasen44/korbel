#Project name : Korbel
#Description : Call Plex Server, send message to Telegram if KO
#Creation date : 27/09/2023
#Author : KMO 

send_to_telegram() {
    local API_URL="https://api.telegram.org/bot$API_TOKEN/sendMessage"
    local message="$1"  
    local data="{\"chat_id\": \"$CHAT_ID\", \"text\": \"$message\"}"
    curl -s -X POST -H "Content-Type: application/json" -d "$data" "$API_URL"
}

EXPECTED_PLEX_RETURNED_MESSAGE="<html><head><script>window.location = window.location.href.match(/(^.+\\/)[^\\/]*$/)[1] + 'web/index.html';</script><title>Unauthorized</title></head><body><h1>401 Unauthorized</h1></body></html>"

if cmd_output=$(curl --connect-timeout 15 "$PLEX_SERVER" 2>/dev/null); then
    if [ "$EXPECTED_PLEX_RETURNED_MESSAGE" = "$cmd_output" ]; then
        #send_to_telegram "Call Plex Server: ok"
        exit 0
    fi
fi

send_to_telegram "Call Plex Server: ko"
exit 1