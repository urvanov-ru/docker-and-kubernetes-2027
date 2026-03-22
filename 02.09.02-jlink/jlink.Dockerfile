# Этап 1.
# Базовый образ с Java 17, в котором будет осуществляться
# сборка проекта.
FROM eclipse-temurin:17.0.18_8-jdk-alpine-3.23 AS jre_builder

# Сборка минималистичного дистрибутива Java,
# специально подобранного для нашего сервиса.
RUN $JAVA_HOME/bin/jlink \
 --module-path "$JAVA_HOME/jmods" \
--add-modules java.base,java.desktop,java.instrument,\
java.logging,java.management,java.naming,java.net.http,\
java.prefs,java.scripting,java.security.jgss,\
java.sql,java.xml,jdk.jfr,jdk.unsupported \
--verbose \
--strip-debug \
--no-header-files \
--no-man-pages \
--output /my-minimal-jre

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
# Новый чистый базовый образ для развёртывания сервиса.
FROM alpine:3.23.3
COPY --from=jre_builder \
  /my-minimal-jre \
  /opt/jre-minimal
COPY --from=jre_builder \
  /app.jar /opt/docker-jlink/app.jar

# Просто указываем в качестве документации,
# что сервис слушает порт 8080.
EXPOSE 8080

# Команда запуска сервиса.
ENTRYPOINT ["/opt/jre-minimal/bin/java", \
    "-jar","/opt/javaexamples-jlink/app.jar"]

#