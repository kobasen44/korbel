FROM alpine:3.18

USER root
WORKDIR /tmp


RUN apk add --no-cache python3 curl

ADD main.py /tmp/.

CMD [ "python3", "/tmp/main.py" ]