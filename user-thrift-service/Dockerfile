FROM emon:5080/devops-learning/openjdk:8-jre
MAINTAINER 问秋 liming2011071@163.com

COPY target/user-thrift-service.jar /user-thrift-service.jar

ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=prod", "/user-thrift-service.jar"]
