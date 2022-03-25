#!/bin/bash

# 用例： [emon@emon backend-devops-learning]$ sh course-edge-service/build.sh

cd /home/emon/dockerdata/backend-devops-learning
mvn clean package -DskipTests

cd /home/emon/dockerdata/backend-devops-learning/course-edge-service
sudo docker build -t course-edge-service:latest .

# 启动容器： [emon@emon backend-devops-learning]$ docker run -it course-edge-service:latest --zookeeper.address=10.0.0.116