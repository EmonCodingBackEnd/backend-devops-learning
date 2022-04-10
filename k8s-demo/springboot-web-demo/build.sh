#!/bin/bash

version=latest
if [ $# -gt 0 ]; then
  version=$1
fi

cd /root/dockerdata/backend-devops-learning
#mvn clean package -DskipTests
mvn -pl k8s-demo/springboot-web-demo -am clean package -Dmaven.test.skip=true

cd /root/dockerdata/backend-devops-learning/k8s-demo/springboot-web-demo
docker build -t 192.168.200.116:5080/devops-learning/springboot-web-demo:"${version}" .

docker push 192.168.200.116:5080/devops-learning/springboot-web-demo:"${version}"

# 执行目录： $ cd /root/dockerdata/backend-devops-learning
# 执行构建： $ sh k8s-demo/springboot-web-demo/build.sh
# 启动容器： $ docker run -it 192.168.200.116:5080/devops-learning/springboot-web-demo:latest
