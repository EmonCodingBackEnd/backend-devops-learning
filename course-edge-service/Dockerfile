FROM 192.168.200.116:5080/devops-learning/openjdk:8-jre
MAINTAINER 问秋 liming2011071@163.com

COPY target/course-edge-service.jar /course-edge-service.jar

ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=prod", "/course-edge-service.jar"]
