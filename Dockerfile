FROM alpine:3.18
USER root
WORKDIR /tmp
ADD korbel.bash /tmp/.
CMD [ "bash", "/tmp/korbel.bash" ]
