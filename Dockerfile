FROM alpine:3.18
USER root
WORKDIR /tmp
RUN apk add --no-cache bash curl
ADD korbel.bash /tmp/.
CMD [ "bash", "/tmp/korbel.bash" ]