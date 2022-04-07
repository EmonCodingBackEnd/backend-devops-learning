#!/bin/bash

pwd
mvn mvn -pl k8s-demo/springboot-web-demo/ -am clean package -Dmaven.test.skip=true

pwd
cd k8s-demo/springboot-web-demo
pwd

docker build -t 192.168.200.116:5080/devops-learning/springboot-web-demo:latest .
cd "$WORKSPACE"
pwd

#docker push 192.168.200.116:5080/devops-learning/springboot-web-demo:latest

# 执行目录： $ cd /root/dockerdata/backend-devops-learning
# 执行构建： $ sh k8s-demo/springboot-web-demo/build.sh
# 启动容器： $ docker run -it 192.168.200.116:5080/devops-learning/springboot-web-demo:latest
