#!/bin/sh

set -e
set -o xtrace

user=${USER:-ftpuser}
password=${PASSWORD:-$(openssl rand -base64 8)}
dir=${DIR:-/ftp}


useradd --home-dir /ftp  $user

echo "$user:$password" | chpasswd
echo "Login info is: $user:$password"

service vsftpd start

exec tail -f /var/log/vsftpd.log

