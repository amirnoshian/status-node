#!/bin/bash

which docker > /dev/null
if [ $? -eq 1 ];then
   echo "please ensure to install docker"
else
   docker build -t status-node . 
if [ $? -eq 0 ];then
  echo "your image name is status-node"
  docker-compose up -d 
else
   "please check dockerfile"
fi    
fi
