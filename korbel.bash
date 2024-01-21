#!/bin/bash
# Project name : Korbel
# Description : Call Plex Server, send message to Telegram if KO
# Creation date : 27/09/2023
# Author : KMO
# Usage : ./korbel.bash

set -e

################ CONSTANTS #################
ATTEMPTS_NUMBER=3
EXPECTED_PLEX_RETURNED_MESSAGE="<html><head><script>window.location = window.location.href.match(/(^.+\\/)[^\\/]*$/)[1] + 'web/index.html';</script><title>Unauthorized</title></head><body><h1>401 Unauthorized</h1></body></html>"

################## FUNCTION ################
send_to_telegram(){
  local API_URL="https://api.telegram.org/bot$API_TOKEN/sendMessage"
  local message="$1"  
  local data="{\"chat_id\": \"$CHAT_ID\", \"text\": \"$message\"}"
  curl -s -X POST -H "Content-Type: application/json" -d "$data" "$API_URL"
}

################## MAIN ####################
for ((i=1; i<=$ATTEMPTS_NUMBER; i++));
do
  if output=$(curl --connect-timeout 20 "$PLEX_SERVER" 2>/dev/null); then
    if [ "$EXPECTED_PLEX_RETURNED_MESSAGE" = "$output" ]; then
      #send_to_telegram "Call Plex Server: ok"
      exit 0
    fi
  fi
  sleep 15
done

send_to_telegram "Call Plex Server: ko"
exit 1