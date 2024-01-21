FROM debian:12-slim
USER root
WORKDIR /tmp
RUN apt-get update -yq \
&& apt-get install curl bash -yq 

ADD korbel.bash /tmp/.
RUN chmod +x /tmp/korbel.bash
CMD [ "bash", "/tmp/korbel.bash" ]
