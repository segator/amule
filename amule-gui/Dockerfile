FROM ubuntu:18.04

ENV UID 0
ENV GUI 0
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

WORKDIR /root

RUN apt-get update \
    && apt-get -y install nano unzip wget tar curl gnupg software-properties-common xvfb xdotool supervisor net-tools fluxbox x11vnc amule-utils-gui \
    && wget -O - https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz | tar -xzv -C /root/ && mv /root/noVNC-1.1.0 /root/novnc \
    && ln -s /root/novnc/vnc_lite.html /root/novnc/index.html \
    && wget -O - https://github.com/novnc/websockify/archive/v0.8.0.tar.gz | tar -xzv -C /root/ \
    && mv /root/websockify-0.8.0 /root/novnc/utils/websockify

WORKDIR /app

ENV RESOLUTION=1600x900
ENV DISPLAY :0
ENV AMULE_HOST=localhost
ENV AMULE_PORT=4712
ENV AMULE_PWD=""
ENV VNC_PASS=admin
COPY config/fluxbox-init /root/.fluxbox/init
COPY config/fluxbox-apps /root/.fluxbox/apps
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY scripts /app
RUN chmod +x /app/init.sh

ENTRYPOINT ["/app/init.sh"]
