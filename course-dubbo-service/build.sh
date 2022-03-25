#!/bin/bash

# 用例： [emon@emon backend-devops-learning]$ sh course-dubbo-service/build.sh

cd /home/emon/dockerdata/backend-devops-learning
mvn clean package -DskipTests

cd /home/emon/dockerdata/backend-devops-learning/course-dubbo-service
sudo docker build -t course-service:latest .

# 启动容器： [emon@emon backend-devops-learning]$ docker run -it course-service:latest --mysql.address=10.0.0.116 --redis.address=10.0.0.116 --zookeeper.address=10.0.0.116
