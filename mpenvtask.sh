#!/bin/bash

#
sudo docker run --name tmp-php7-container -d php7:fpm
sudo docker cp tmp-php7-container:/etc/php7 /etc/php7
sudo docker rm -f tmp-php7-container




alias php7='sudo docker run -it --rm --name my-running-script -v "$PWD":/usr/src/myapp -w /usr/src/myapp php:7.2-rc-fpm-alpine3.6 php'
docker run -p 9000:9000 --name phpfpm -v /www:/usr/share/nginx/html:rw -d php:7.2-rc-fpm-alpine3.6
