# Используется специальный образ для сборки проекта,
# содержащий в себе Maven и OpenJDK 17 Temurin на основе Alpine Linux.
FROM maven:3.9.12-eclipse-temurin-17-alpine AS builder
# Выкачиваение исходного кода проекта из репозитория GitHub.
ADD https://github.com/urvanov-ru/simple-spring-webmvc.git \
  simple-spring-webmvc
# Смена рабочего каталога на каталог с исходным кодом.
WORKDIR /simple-spring-webmvc
# Запуск тестов с использованием кеша для выкачиваемых
# артефактов Maven.
RUN --mount=type=cache,id=maven-cache,target=/root/.m2 \
  /usr/bin/mvn clean verify

