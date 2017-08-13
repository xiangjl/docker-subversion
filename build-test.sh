#!/bin/sh

docker stop subversion
docker rm subversion
docker rmi xiangjl/subversion
docker build -t xiangjl/subversion .
docker run -d --name subversion -p 80:80/tcp xiangjl/subversion
