#!/bin/bash

# 用例： [emon@emon backend-devops-learning]$ sh user-edge-service/build.sh

cd /root/dockerdata/backend-devops-learning
mvn clean package -DskipTests

cd /root/dockerdata/backend-devops-learning/user-edge-service
sudo docker build -t emon:5080/devops-learning/user-edge-service:latest .

sudo docker push emon:5080/devops-learning/user-edge-service:latest

# 启动容器： [emon@emon backend-devops-learning]$ docker run -it user-edge-service:latest --redis.address=172.17.0.1