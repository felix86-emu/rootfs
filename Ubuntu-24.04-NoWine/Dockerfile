FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

COPY Ubuntu-NoWine.sh /tmp/Ubuntu.sh

RUN bash /tmp/Ubuntu.sh

WORKDIR /root

CMD ["/bin/bash"]
