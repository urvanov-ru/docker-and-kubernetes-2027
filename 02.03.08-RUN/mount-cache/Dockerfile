FROM maven:3.9.12-eclipse-temurin-17-alpine AS builder
ADD https://github.com/urvanov-ru/simple-spring-webmvc.git \
  simple-spring-webmvc
WORKDIR /simple-spring-webmvc
RUN --mount=type=cache,id=maven-cache,target=/root/.m2 \
  /usr/bin/mvn clean verify

