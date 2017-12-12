FROM alpine:3.6
# 下载安装Docker CLI
USER root
RUN apk add --no-cache --virtual .fetch-deps \
		curl \
		tar

RUN curl -O https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz \
    && tar zxvf docker-latest.tgz \
    && cp docker/docker /usr/local/bin/ \
    && rm -rf docker docker-latest.tgz \
    \
    && apk del .fetch-deps 
# 将 `jenkins` 用户的组 ID 改为宿主 `docker` 组的组ID，从而具有执行 `docker` 命令的权限。
ARG DOCKER_GID=100
USER root:${DOCKER_GID}