#!/bin/bash

# 用例： [emon@emon backend-devops-learning]$ sh k8s-demo/cronjob-demo/build.sh

cd /root/dockerdata/backend-devops-learning
mvn clean package -DskipTests

cd /root/dockerdata/backend-devops-learning/k8s-demo/cronjob-demo
docker build -t emon:5080/devops-learning/cronjob-demo:latest .

docker push emon:5080/devops-learning/cronjob-demo:latest

# 启动容器： [emon@emon backend-devops-learning]$ docker run -it emon:5080/devops-learning/cronjob-demo:latest
