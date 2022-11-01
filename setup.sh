#!/bin/bash
# step1 : set your ip addres and port & name  in Env
# step 2 : ensure docker registry contianer is exist
# step 3 : config docker-compose 
REGISTRY_PORT=5000
NAME=systemstatus
IPADDRESS=192.168.10.175
docker ps | grep registry 

if [ $? -eq 1 ] ; then
    echo "docker registry container not exist"
    echo " (Hint)=https://hub.docker.com/_/registry " 
    exit 1
else

docker build -t $NAME . 
if [ $? -eq 1 ];then
    echo "please ensure the validate Dockerfile"
    exit 1 
else
   docker tag $NAME localhost:5000/$NAME
   docker push localhost:5000/$NAME
   docker-compose up -d
fi
fi
