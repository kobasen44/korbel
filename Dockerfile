FROM alpine:3.18

USER root
WORKDIR /tmp

RUN apk add --no-cache python3 curl py-pip
RUN pip install requests

ADD main.py /tmp/.

CMD [ "python3", "/tmp/main.py" ]