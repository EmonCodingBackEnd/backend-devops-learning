FROM openjdk:8-jre
MAINTAINER 问秋 liming2011071@163.com

COPY target/course-dubbo-service.jar /course-dubbo-service.jar

ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=prod", "/course-dubbo-service.jar"]
