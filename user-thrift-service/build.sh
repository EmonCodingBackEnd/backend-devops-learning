#!/bin/bash

# 用例： [emon@emon user-thrift-service]$ sudo sh build.sh

mvn clean package -DskipTests
docker build -t user-thrift-service:latest .