FROM 192.168.200.116:5080/devops-learning/openjdk:8-jre
MAINTAINER 问秋 liming2011071@163.com

COPY target/api-gateway-zuul.jar /api-gateway-zuul.jar

ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=prod", "/api-gateway-zuul.jar"]
