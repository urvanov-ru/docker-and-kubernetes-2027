FROM maven:3.9.12-eclipse-temurin-17-alpine AS builder
ADD https://github.com/urvanov-ru/simple-spring-webmvc.git simple-spring-webmvc
WORKDIR /simple-spring-webmvc
RUN ls -la /usr/bin/mvn
RUN /usr/bin/mvn clean package

FROM tomcat:11.0.15-jdk17-temurin-jammy
RUN ls -la /usr/local/tomcat/webapps/
COPY --from=builder \
  /simple-spring-webmvc/target/simple-spring-webmvc-0.0.1-SNAPSHOT.war \
  /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080

