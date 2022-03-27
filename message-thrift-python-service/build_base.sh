#!/usr/bin/env bash

# 用例： [emon@emon backend-devops-learning]$ sh message-thrift-python-service/build_base.sh

cd /home/emon/dockerdata/backend-devops-learning/message-thrift-python-service
sudo docker build -t emon:5080/devops-learning/python-base:latest -f ./Dockerfile.base .
