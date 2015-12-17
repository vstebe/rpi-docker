#!/bin/bash

set -e

if [ -z "$OWNCLOUD_SERVERNAME" ]; then
    echo >&2 'error: you have to provide a server-name'
    echo >&2 '  Did you forget to add -e HOSTNAME=... ?'
    exit 1
fi

sudo sed -i "s/server_name localhost/server_name $OWNCLOUD_SERVERNAME/g" /etc/nginx/sites-available/default

if [ ! -f /etc/nginx/ssl/owncloud.crt ]; then
    sudo mkdir /etc/nginx/ssl 
    sudo openssl genrsa -out /etc/nginx/ssl/owncloud.key 4096 
    sudo openssl req -new -sha256 -batch -subj "/CN=$OWNCLOUD_SERVERNAME" -key /etc/nginx/ssl/owncloud.key -out /etc/nginx/ssl/owncloud.csr 
    sudo openssl x509 -req -sha256 -days 3650 -in /etc/nginx/ssl/owncloud.csr -signkey /etc/nginx/ssl/owncloud.key -out /etc/nginx/ssl/owncloud.crt
fi

exec "$@"
