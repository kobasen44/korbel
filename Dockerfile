FROM alpine:3.18
USER root
WORKDIR /tmp
RUN apk add --no-cache bash curl
RUN ls -lh /bin/bash
ADD korbel.bash /tmp/.
RUN chmod +x /tmp/korbel.bash
CMD [ "/tmp/korbel.bash" ]