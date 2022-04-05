FROM 192.168.200.116:5080/devops-learning/python-base:latest
MAINTAINER 问秋 liming2011071@163.com

ENV PYTHONPATH /
COPY ./message /message

ENTRYPOINT ["python", "/message/message_service.py"]
