FROM emon:5080/devops-learning/openjdk:8-jre
MAINTAINER 问秋 liming2011071@163.com

COPY target/user-edge-service.jar /user-edge-service.jar

ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=prod", "/user-edge-service.jar"]
