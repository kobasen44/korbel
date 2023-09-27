import subprocess

EXCEPTED_PLEX_RETURNED_MESSAGE = b"<html><head><script>window.location = window.location.href.match(/(^.+\\/)[^\\/]*$/)[1] + 'web/index.html';</script><title>Unauthorized</title></head><body><h1>401 Unauthorized</h1></body></html>"

# Call Plex Server
cmd = ['curl', 'tremoille.ddns.net:29144']
plexReturnedOutput = subprocess.check_output(cmd)
if EXCEPTED_PLEX_RETURNED_MESSAGE == plexReturnedOutput:
    print('ok')
    exit(0)
else:
    print("ko")
    exit(1)




