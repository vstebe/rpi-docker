FROM resin/rpi-raspbian:jessie

RUN sudo apt-get update && \
    sudo apt-get install -y nginx

RUN sudo sed -i "s/worker_processes 4;/worker_processes 2;/g" /etc/nginx/nginx.conf
RUN sudo sed -i "s/worker_connections 768;/worker_connections 256;/g" /etc/nginx/nginx.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["nginx"]
