#!/bin/bash

# 用例： [emon@emon backend-devops-learning]$ sh user-edge-service/build.sh

cd /home/emon/dockerdata/backend-devops-learning
mvn clean package -DskipTests

cd /home/emon/dockerdata/backend-devops-learning/user-edge-service
sudo docker build -t user-edge-service:latest .

# 启动容器： [emon@emon backend-devops-learning]$ docker run -it user-edge-service:latest --redis.address=172.17.0.1