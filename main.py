"""
Project name : Korbel
Description : Call Plex Server, send message to Telegram if KO
Creation date : 27/09/2023
Author : KMO 
"""

import subprocess
import requests


def send_to_telegram(message):
    apiToken = '1223180354:AAHWv4JPS7bpDJmccIvoqOhNrmtsWVz8fkE'
    chatID = '531244299'
    apiURL = f'https://api.telegram.org/bot{apiToken}/sendMessage'
    try:
        response = requests.post(apiURL, json={'chat_id': chatID, 'text': message})
        print(response.text)
    except Exception as e:
        print(e)


if __name__ == '__main__':
    
    EXCEPTED_PLEX_RETURNED_MESSAGE = b"<html><head><script>window.location = window.location.href.match(/(^.+\\/)[^\\/]*$/)[1] + 'web/index.html';</script><title>Unauthorized</title></head><body><h1>401 Unauthorized</h1></body></html>"
    PLEX_SERVER = 'tremoille.ddns.net:29144'

    # Call Plex Server
    cmd = ['curl', PLEX_SERVER]
    plexReturnedOutput = subprocess.check_output(cmd)
    if EXCEPTED_PLEX_RETURNED_MESSAGE == plexReturnedOutput:
        print('ok')
        send_to_telegram("Call Plex Server : ok")
        exit(0)
    else:
        print("ko")
        send_to_telegram("Call Plex Server : ko")
        exit(1)
