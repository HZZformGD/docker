# docker
my dockerfile

## php
```shell
#fpm
docker run -p 9000:9000 --name phpfpm -v /home/www:/www:rw -d php7-fpm

#cli
alias php='docker run --rm --name=php-cli -v $(pwd):/www php7-cli php'

```
