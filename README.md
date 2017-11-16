# docker
my dockerfile

## php
```shell
#fpm
docker run -p 9000:9000 --name phpfpm -v /home/user/public_html:/www:rw -d matriphe/alpine-php:fpm

#cli
alias php='docker run --rm --name=php-cli -v $(pwd):/www matriphe/alpine-php:cli php'

```
