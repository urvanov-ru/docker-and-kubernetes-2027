FROM maven:3.9.12-eclipse-temurin-17-alpine AS builder
ADD https://github.com/urvanov-ru/simple-spring-webmvc.git \
  simple-spring-webmvc
WORKDIR /simple-spring-webmvc
RUN --mount=type=cache,id=maven-cache,target=/root/.m2 \
 /usr/bin/mvn clean package

FROM tomcat:10.1.50-jdk17-temurin-jammy
COPY --from=builder \
  /simple-spring-webmvc/target/simple-spring-webmvc-0.0.1-SNAPSHOT.war \
  /usr/local/tomcat/webapps/ROOT.war

