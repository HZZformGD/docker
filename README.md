# docker
my dockerfile

## 删除所有容器
```shell
docker stop $(docker ps -q) & docker rm $(docker ps -aq)
#sudo docker stop $(sudo docker ps -q) & sudo docker rm $(sudo docker ps -aq)
```

## php
```shell
#fpm
docker run -p 9000:9000 --name phpfpm -v /home/www:/www:rw -d php7-fpm

#cli
alias php='docker run --rm --name=php-cli -v $(pwd):/www php7-cli php'

```
