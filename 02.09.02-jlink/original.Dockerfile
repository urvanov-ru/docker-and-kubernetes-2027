# Этап 1.
# Базовый образ с JDK 25, в котором будет осуществляться
# сборка проекта.
FROM eclipse-temurin:25.0.2_10-jdk-alpine-3.23 AS builder

# Копирование исходных кодов в контейнер для сборки.
COPY . /docker-jlink

# Переходим в каталог со скопированными
# исходными кодами.
WORKDIR /docker-jlink

# Запускаем сборку проекта Maven.
RUN --mount=type=cache,id=maven-cache,target=/root/.m2 \
 ./mvnw clean package

# Нам нужен только jar-файл с результатом сборки.
# Все остальные файлы не нужны.
COPY target/docker-jlink-0.0.1-SNAPSHOT.jar /app.jar


# Этап 2.
# Новый чистый базовый образ с JRE 25
# для развёртывания сервиса.
FROM eclipse-temurin:25.0.2_10-jre-alpine-3.23

# Забираем результат сборки из этапа сборки.
COPY --from=builder \
  /app.jar /opt/docker-jlink/app.jar

# Просто указываем в качестве документации,
# что сервис слушает порт 8080.
EXPOSE 8080

# Команда запуска сервиса.
ENTRYPOINT ["java","-jar","/opt/docker-jlink/app.jar"]
