#!/bin/bash

# 用例： [emon@emon backend-devops-learning]$ sh course-dubbo-service/build.sh

cd /root/dockerdata/backend-devops-learning
mvn clean package -DskipTests

cd /root/dockerdata/backend-devops-learning/course-dubbo-service
sudo docker build -t 192.168.200.116:5080/devops-learning/course-service:latest .

sudo docker push 192.168.200.116:5080/devops-learning/course-service:latest

# 启动容器： [emon@emon backend-devops-learning]$ docker run -it course-service:latest --mysql.address=172.17.0.1 --zookeeper.address=172.17.0.1
