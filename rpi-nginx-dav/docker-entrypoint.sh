#!/bin/bash

set -e

htpasswd -nb $USER $PASSWORD >> /config/.htpasswd

exec "$@"
