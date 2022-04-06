#!/bin/bash

cd /root/dockerdata/backend-devops-learning
mvn clean package -DskipTests

cd /root/dockerdata/backend-devops-learning/k8s-demo/cronjob-demo
docker build -t 192.168.200.116:5080/devops-learning/cronjob-demo:latest .

docker push 192.168.200.116:5080/devops-learning/cronjob-demo:latest

# 执行目录： $ cd /root/dockerdata/backend-devops-learning
# 执行构建： $ sh k8s-demo/cronjob-demo/build.sh
# 启动容器： $ docker run -it 192.168.200.116:5080/devops-learning/cronjob-demo:latest
