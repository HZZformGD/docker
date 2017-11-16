#!/bin/bash

#安装docker,需要curl
export CHANNEL=stable
curl -fsSL https://get.docker.com/ | sh -s -- --mirror Aliyun

#nginx
docker pull nginx:alpine
#复制默认配置文件
docker run --name tmp-nginx-container -d nginx:alpine
docker cp tmp-nginx-container:/etc/nginx/conf.d /etc/nginx/conf.d
docker rm -f tmp-nginx-container

#share mem
docker pull redis:alpine
docker pull memcached:alpine

#php
#7.2 fpm
docker pull php:7.2-rc-fpm-alpine3.6
#设置别名
alias php7nts='sudo docker run -it --rm --name my-running-script -v "$PWD":/usr/src/myapp -w /usr/src/myapp php:7.2-rc-fpm-alpine3.6 php'
echo alias php7nts='sudo docker run -it --rm --name my-running-script -v "$PWD":/usr/src/myapp -w /usr/src/myapp php:7.2-rc-fpm-alpine3.6 php' >> ~/.bashrc
source ~/.bashrc

#7.2zts

#5.6 fpm

#5.3 fpm


#mysql

#启动




