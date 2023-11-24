#!/bin/bash

sudo docker run -p 8080:8080 -v /path/path/linx-server.conf:/data/linx-server.conf -v /path/path:/home -v /path/path:/home andreimarcu/linx-server -config /data/linx-server.conf
