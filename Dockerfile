FROM ubuntu

#for debconf tzdata
ENV TZ=Europe/Berlin

RUN apt update && \
    apt -y install \
      software-properties-common && \
    add-apt-repository -y ppa:cernekee/ppa && \
    apt update && \
    apt -y install stoken libstoken-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root
           
VOLUME /root

ENTRYPOINT [ "/usr/bin/stoken" ]
