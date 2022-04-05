#!/bin/bash

# 用例： [emon@emon backend-devops-learning]$ sh message-thrift-python-service/build.sh

cd /root/dockerdata/backend-devops-learning/message-thrift-python-service
sudo docker build -t 192.168.200.116:5080/devops-learning/message-service:latest .

sudo docker push 192.168.200.116:5080/devops-learning/message-service:latest

# 启动容器： [emon@emon backend-devops-learning]$ docker run -it message-service:latest
