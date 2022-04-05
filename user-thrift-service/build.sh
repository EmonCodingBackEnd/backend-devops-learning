#!/bin/bash

# 用例： [emon@emon backend-devops-learning]$ sh user-thrift-service/build.sh

cd /root/dockerdata/backend-devops-learning
mvn clean package -DskipTests

cd /root/dockerdata/backend-devops-learning/user-thrift-service
sudo docker build -t 192.168.200.116:5080/devops-learning/user-service:latest .

sudo docker push 192.168.200.116:5080/devops-learning/user-service:latest

# 启动容器： [emon@emon backend-devops-learning]$ docker run -it user-service:latest --mysql.address=10.0.0.116