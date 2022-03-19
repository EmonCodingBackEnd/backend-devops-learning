#!/usr/bin/env bash

rm discovery.log notebook.log gateway.log
nohup java -jar discovery-service/target/discovery-service-1.0.jar >>discovery.log 2>&1 &
sleep 5s # Waits 5 seconds.
nohup java -jar notebook-service/target/notebook-service-1.0.jar >>notebook.log 2>&1 &
sleep 5s # Waits 5 seconds.
nohup java -jar gateway-service/target/gateway-service-1.0.jar >>gateway.log 2>&1 &
