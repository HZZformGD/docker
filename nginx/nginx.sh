#!/bin/bash

sudo docker run --name nginx -d -p 80:80 -v /etc/nginx/conf.d:/etc/nginx/conf.d:ro -v /www:/usr/share/nginx/html nginx:alpine 
docker restart nginx


# sudo docker run --name tmp-nginx-container -d nginx:alpine
# sudo docker cp tmp-nginx-container:/etc/nginx/conf.d /etc/nginx/conf.d
# sudo docker rm -f tmp-nginx-container