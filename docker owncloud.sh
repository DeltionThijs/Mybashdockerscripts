#!/bin/bash

sudo usermod -aG docker thijs

mkdir owncloud-docker-server
cd owncloud-docker-server


wget https://raw.githubusercontent.com/owncloud/docs-server/master/modules/admin_manual/examples/installation/docker/docker-compose.yml

cat << EOF > .env
OWNCLOUD_VERSION=10.11
OWNCLOUD_DOMAIN=localhost:8080
OWNCLOUD_TRUSTED_DOMAINS=
ADMIN_USERNAME=admin
ADMIN_PASSWORD=admin
HTTP_PORT=8080
EOF

apt-get install docker docker-compose

docker-compose up -d
