#!/bin/bash

# 用例： [emon@emon backend-devops-learning]$ sh course-edge-service/build.sh

cd /home/emon/dockerdata/backend-devops-learning
mvn clean package -DskipTests

cd /home/emon/dockerdata/backend-devops-learning/course-edge-service
sudo docker build -t emon:5080/devops-learning/course-edge-service:latest .

# 启动容器： [emon@emon backend-devops-learning]$ docker run -it course-edge-service:latest --zookeeper.address=172.17.0.1
