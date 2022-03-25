#!/bin/bash

# 用例： [emon@emon backend-devops-learning]$ sh user-thrift-service/build.sh

cd /home/emon/dockerdata/backend-devops-learning
mvn clean package -DskipTests

cd /home/emon/dockerdata/backend-devops-learning/user-thrift-service
sudo docker build -t user-thrift-service:latest .

# 启动容器： [emon@emon backend-devops-learning]$ docker run -it user-thrift-service:latest --mysql.address=10.0.0.116