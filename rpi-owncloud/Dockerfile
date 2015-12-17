FROM karrde/rpi-nginx-php5

ENV OWNCLOUD_VERSION owncloud-8.2.1
ENV OWNCLOUD_BASE_DIR /var/www
ENV OWNCLOUD_DATA_DIR /srv/http/owncloud/data
ENV OWNCLOUD_CONFIG_DIR $OWNCLOUD_BASE_DIR/owncloud/config
ENV OWNCLOUD_SERVERNAME dockerpi

# we need openssl in order to generate a new ssl-key
RUN apt-get update && apt-get install -y openssl wget bzip2 vim

# Change upload-limits and -sizes
RUN sudo sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 2048M/g" /etc/php5/fpm/php.ini && \
    sudo sed -i "s/post_max_size = 8M/post_max_size =root123  2048M/g" /etc/php5/fpm/php.ini && \
    sudo echo 'default_charset = "UTF-8"' >> /etc/php5/fpm/php.ini && \
    echo "upload_tmp_dir = $OWNCLOUD_DATA_DIR" >> /etc/php5/fpm/php.ini && \
    echo "extension = apc.so" >> /etc/php5/fpm/php.ini && \
    echo "apc.enabled = 1" >> /etc/php5/fpm/php.ini && \
    echo "apc.include_once_override = 0" >> /etc/php5/fpm/php.ini && \
    echo "apc.shm_size = 256" >> /etc/php5/fpm/php.ini && \
    echo "zend_extension=opcache.so" >> /etc/php5/fpm/conf.d/05-opcache.ini && \
    echo "opcache.memory_consumption = 256" >> /etc/php5/fpm/conf.d/05-opcache.ini && \
    echo "opcache.interned_strings_buffer = 16" >> /etc/php5/fpm/conf.d/05-opcache.ini && \
    echo "opcache.max_accelerated_files = 4000" >> /etc/php5/fpm/conf.d/05-opcache.ini && \
    echo "opcache.revalidate_freq = 10" >> /etc/php5/fpm/conf.d/05-opcache.ini && \
    echo "opcache.fast_shutdown=1" >> /etc/php5/fpm/conf.d/05-opcache.ini 

# now add our hand-written nginx-default-configuration which makes use of all the stuff so far prepared
ADD default /etc/nginx/sites-available/default

# Create the data-directory where owncloud can store its stuff
RUN sudo mkdir -p "$OWNCLOUD_DATA_DIR" && \
    sudo chown www-data:www-data "$OWNCLOUD_DATA_DIR"

# finally, download owncloud and extract it
WORKDIR /var/www
RUN sudo wget http://download.owncloud.org/community/"$OWNCLOUD_VERSION".tar.bz2 && \ 
    sudo tar xvf "$OWNCLOUD_VERSION".tar.bz2 && \
    sudo rm "$OWNCLOUD_VERSION".tar.bz2 

WORKDIR /
COPY docker-entrypoint.sh /entrypoint.sh

VOLUME "$OWNCLOUD_DATA_DIR"
VOLUME "$OWNCLOUD_CONFIG_DIR"

ENTRYPOINT ["/entrypoint.sh"]
CMD service php5-fpm start && nginx
