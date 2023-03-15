#!/bin/bash

cd /usr/local/apache2/htdocs
rm index.html
curl https://plak.infrapuin.nl/selif/index.txt -o index.html
