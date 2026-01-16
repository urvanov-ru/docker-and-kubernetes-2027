# Первый этап с именем builder. 
# Используется специальный образ для сборки проекта,
# содержащий в себе Maven и OpenJDK 17 Temurin на основе Alpine Linux..
FROM maven:3.9.12-eclipse-temurin-17-alpine AS builder
# Выкачиваение исходного кода проекта из репозитория GitHub.
ADD https://github.com/urvanov-ru/simple-spring-webmvc.git \
  simple-spring-webmvc
# Смена рабочего каталога на каталог с исходным кодом
WORKDIR /simple-spring-webmvc
# Сборка с использованием кеша для выкачиваемых
# артефактов Maven.
RUN --mount=type=cache,id=maven-cache,target=/root/.m2 \
 /usr/bin/mvn clean package

# Второй этап. 
# В качестве базового образа используется образ с Tomcat 10.1.50
# С OpenJDK 17 Temurin на основе Ubuntu 22.04 Jammy.
FROM tomcat:10.1.50-jdk17-temurin-jammy
# Результат первого этапа (builder) разворачивается
# в Apache Tomcat.
COPY --from=builder \
  /simple-spring-webmvc/target/simple-spring-webmvc-0.0.1-SNAPSHOT.war \
  /usr/local/tomcat/webapps/ROOT.war

