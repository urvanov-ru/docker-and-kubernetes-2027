# Этап 1.
# Базовый образ с Java 17, в котором будет осуществляться
# сборка проекта.
FROM eclipse-temurin:17.0.18_8-jdk-alpine-3.23 AS jre_builder

# Копирование исходных кодов в контейнер для сборки.
COPY . /javaexamples-jlink

# Переходим в каталог со скопированными
# исходными кодами.
WORKDIR /javaexamples-jlink

# Запускаем сборку проекта Maven.
RUN --mount=type=cache,id=maven-cache,target=/root/.m2 \
 ./mvnw clean package

# Нам нужен только jar-файл с результатом сборки.
# Все остальные файлы не нужны
COPY target/docker-jlink-0.0.1-SNAPSHOT.jar /app.jar


# Этап 2.
# Новый чистый базовый образ для развёртывания сервиса.
FROM eclipse-temurin:17.0.18_8-jdk-alpine-3.23

# Забираем результат сборки из этапа сборки.
COPY --from=jre_builder \
  /app.jar /opt/docker-jlink/app.jar

# Просто указываем в качестве документации,
# что сервис слушает порт 8080.
EXPOSE 8080

# Команда запуска сервиса.
ENTRYPOINT ["java","-jar","/opt/docker-jlink/app.jar"]
