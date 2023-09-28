"""
Project name : Korbel
Description : Call Plex Server, send message to Telegram if KO
Creation date : 27/09/2023
Author : KMO 
"""

import subprocess
import requests


def send_to_telegram(message):
    API_TOKEN = '1223180354:AAHWv4JPS7bpDJmccIvoqOhNrmtsWVz8fkE'
    CHAT_ID = '531244299'
    API_URL = f'https://api.telegram.org/bot{API_TOKEN}/sendMessage'
    try:
        response = requests.post(API_URL, json={'chat_id': CHAT_ID, 'text': message})
        print(response.text)
    except Exception as e:
        print(e)


if __name__ == '__main__':
    EXCEPTED_PLEX_RETURNED_MESSAGE = b"<html><head><script>window.location = window.location.href.match(/(^.+\\/)[^\\/]*$/)[1] + 'web/index.html';</script><title>Unauthorized</title></head><body><h1>401 Unauthorized</h1></body></html>"
    PLEX_SERVER = 'tremoille.ddns.net:29144'

    cmd = ['curl', '--connect-timeout', '15', PLEX_SERVER]
    if subprocess.call(cmd) == 0:
        plexReturnedOutput = subprocess.check_output(cmd)
        if EXCEPTED_PLEX_RETURNED_MESSAGE == plexReturnedOutput:
            # send_to_telegram("Call Plex Server : ok")
            exit(0)
    send_to_telegram("Call Plex Server : ko")
    exit(1)
