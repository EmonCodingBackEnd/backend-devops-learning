#!/bin/bash

# 用例： [emon@emon user-thrift-service]$ sudo sh build.sh

cd /home/emon/dockerdata/backend-devops-learning
mvn clean package -DskipTests

sleep 2

cd /home/emon/dockerdata/backend-devops-learning/user-thrift-service
docker build -t user-thrift-service:latest .