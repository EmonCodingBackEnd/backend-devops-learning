#!/bin/bash

# 用例： [emon@emon backend-devops-learning]$ sh message-thrift-python-service/build.sh

cd /home/emon/dockerdata/backend-devops-learning/message-thrift-python-service
sudo docker build -t message-service:latest .

# 启动容器： [emon@emon backend-devops-learning]$ docker run -it message-service:latest --mysql.address=10.0.0.116
