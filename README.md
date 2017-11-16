my dockerfile

## 删除所有容器
删除
```shell
docker stop $(docker ps -q) & docker rm $(docker ps -aq)
#sudo docker stop $(sudo docker ps -q) & sudo docker rm $(sudo docker ps -aq)
```

## 抽取默认配置文件
以nginx为例
直接先复制再挂载
```shell
docker run --name tmp-nginx-container -d nginx
docker cp tmp-nginx-container:/etc/nginx/nginx.conf /host/path/nginx.conf
docker rm -f tmp-nginx-container
```

从基础镜像再build一层(每次修改都需要重新build)
```dockerfile
FROM nginx
# COPY nginx.conf /etc/nginx/nginx.conf
COPY /etc/nginx* /etc/nginx
```
