FROM resin/rpi-raspbian:wheezy

RUN apt-get update && \
    apt-get install -y transmission-daemon git && \
    git clone https://github.com/ronggang/transmission-web-control.git /root/webui

RUN mkdir -p /root/.local/share/transmission && \
    cp -R /root/webui/src /root/.local/share/transmission/web && \
    rm -rf /root/webui

EXPOSE 9091

VOLUME "/root/.config/transmission-daemon/"
VOLUME "/var/lib/transmission-daemon/downloads"

CMD ["transmission-daemon", "-f"]
