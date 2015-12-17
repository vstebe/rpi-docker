FROM resin/rpi-raspbian:wheezy
MAINTAINER Stefan Schoeffmann <stefan.schoeffmann@posteo.de>

ENV OWNCLOUD_BASE_DIR /var/www
ENV OWNCLOUD_DATA_DIR /srv/http/owncloud/data
ENV OWNCLOUD_CONFIG_DIR $OWNCLOUD_BASE_DIR/owncloud/config

RUN sudo mkdir -p "$OWNCLOUD_DATA_DIR" && \
    sudo mkdir -p "$OWNCLOUD_CONFIG_DIR" 

ADD autoconfig.php $OWNCLOUD_CONFIG_DIR/
RUN sudo sed -i "s@\"directory\".*,\$@\"directory\" => \"$OWNCLOUD_DATA_DIR\",@g" $OWNCLOUD_CONFIG_DIR/autoconfig.php && \
    sudo chown -R www-data:www-data "$OWNCLOUD_DATA_DIR" && \
    sudo chown -R www-data:www-data "$OWNCLOUD_CONFIG_DIR"

VOLUME ["$OWNCLOUD_DATA_DIR"]
VOLUME ["$OWNCLOUD_CONFIG_DIR"]

CMD ["true"]
