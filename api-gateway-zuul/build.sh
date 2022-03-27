#!/bin/bash

# 用例： [emon@emon backend-devops-learning]$ sh api-gateway-zuul/build.sh

cd /home/emon/dockerdata/backend-devops-learning
mvn clean package -DskipTests

cd /home/emon/dockerdata/backend-devops-learning/api-gateway-zuul
sudo docker build -t emon:5080/devops-learning/api-gateway:latest .

sudo docker push emon:5080/devops-learning/api-gateway:latest
# 启动容器： [emon@emon backend-devops-learning]$ docker run -it api-gateway:latest
