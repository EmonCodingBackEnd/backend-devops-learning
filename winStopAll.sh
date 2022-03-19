#!/usr/bin/env bash

# 停止discovery-service
PID=$(netstat -ano | findstr "8761" | grep 0.0.0.0 | awk '{print $5}')
if [ -n "$PID" ]; then
  taskkill //PID "$PID" //F
fi
# 停止notebook-service
PID=$(netstat -ano | findstr "1111" | grep 0.0.0.0 | awk '{print $5}')
if [ -n "$PID" ]; then
  taskkill //PID "$PID" //F
fi
# 停止gateway-service
PID=$(netstat -ano | findstr "8765" | grep 0.0.0.0 | awk '{print $5}')
if [ -n "$PID" ]; then
  taskkill //PID "$PID" //F
fi
