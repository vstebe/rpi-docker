FROM resin/rpi-raspbian:wheezy

RUN apt-get update && apt-get install -y -q vsftpd

ADD vsftpd.conf /etc/
ADD vsftpd.sh /root/

RUN mkdir -p /var/run/vsftpd/empty \
 && chown root:root /etc/vsftpd.conf \
 && chmod +x /root/vsftpd.sh

RUN mkdir /ftp

VOLUME /ftp/

EXPOSE 20 30000-31000

ENTRYPOINT ["/root/vsftpd.sh"]

CMD ["vsftpd"]
