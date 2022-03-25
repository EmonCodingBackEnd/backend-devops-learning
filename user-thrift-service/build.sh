#!/bin/bash

# 用例： [emon@emon backend-devops-learning]$ sh user-thrift-service/build.sh

cd /home/emon/dockerdata/backend-devops-learning
mvn clean package -DskipTests

sleep 2

cd /home/emon/dockerdata/backend-devops-learning/user-thrift-service
sudo docker build -t user-thrift-service:latest .