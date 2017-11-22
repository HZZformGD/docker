#!/bin/bash

function stop ( ) {
    docker stop nginx && sudo docker rm nginx
    docker stop phpfpm && sudo docker rm phpfpm    
}

function restart ( ) {
    docker restart nginx 
    docker restart phpfpm   
}

function start ( ) {
    php_version=$1
    list=("53" "56" "72")
    [[ ${list[@]/$php_version/} == ${list[@]} ]] && php_version='72'

    #redis 
    # docker run -p 6379:6379 --name redis -d redis:alpine

    #memcached

    #mysql

    #phpfpm link mysql redis
    # docker run -p 9000:9000 --name phpfpm -v /www:/usr/share/nginx/html:rw --link redis:redis --link mysql:mysql -d php$php_version:fpm
    docker run -p 9000:9000 --name phpfpm -v /www:/usr/share/nginx/html:rw -d php${php_version}:fpm

    #nginx link phpfpm
    docker run --name nginx -d -p 80:80 \
    -v /etc/nginx/conf.d:/etc/nginx/conf.d:ro \
    --link phpfpm:phpfpm \
    --volumes-from phpfpm \
    nginx:alpine
}

function chage(){
    php_version=$1
    stop
    start $php_version
}

cmd=$1
php_version=$2
# - && --
# getopts && getopt
[[ $cmd == "start" ]] && start $php_version
[[ $cmd == "stop" ]] && stop
[[ $cmd == "restart" ]] && restart
[[ $cmd == "fpmch" ]] && chage $php_version


# winpty docker run -it --rm --name=tmp-$RANDOM -p --link php72sw 9000:9000 -v $PWD:/var/www/html -w /var/www/html php72:sw php test.php
