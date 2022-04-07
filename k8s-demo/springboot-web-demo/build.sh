#!/bin/bash

cd /root/dockerdata/backend-devops-learning
mvn clean package -DskipTests

cd /root/dockerdata/backend-devops-learning/k8s-demo/springboot-web-demo
docker build -t 192.168.200.116:5080/devops-learning/springboot-web-demo:latest .

docker push 192.168.200.116:5080/devops-learning/springboot-web-demo:latest

# 执行目录： $ cd /root/dockerdata/backend-devops-learning
# 执行构建： $ sh k8s-demo/springboot-web-demo/build.sh
# 启动容器： $ docker run -it 192.168.200.116:5080/devops-learning/springboot-web-demo:latest
