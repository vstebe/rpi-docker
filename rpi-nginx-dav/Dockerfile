FROM resin/rpi-raspbian:jessie

RUN apt-get update && \
    apt-get install -y nginx apache2-utils

RUN sed -i "s/worker_processes 4;/worker_processes 2;/g" /etc/nginx/nginx.conf && \
    sed -i "s/worker_connections 768;/worker_connections 256;/g" /etc/nginx/nginx.conf && \
    echo "daemon off;" >> /etc/nginx/nginx.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

RUN mkdir /www && chown -R www-data:www-data /www && \
    mkdir /config && chown -R www-data:www-data /config

ADD default /etc/nginx/sites-available/default

WORKDIR /
COPY docker-entrypoint.sh /entrypoint.sh

VOLUME ["/www"]

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
CMD nginx
