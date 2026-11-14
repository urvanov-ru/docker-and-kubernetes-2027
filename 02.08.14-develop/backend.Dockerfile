# Первый этап с именем builder. 
# Используется специальный образ для сборки проекта,
# содержащий в себе Maven и OpenJDK 17 Temurin на основе Alpine Linux.
FROM maven:3.9.12-eclipse-temurin-17-alpine AS builder
# Копирование исходного кода в контейнер.
COPY . /virtualpets-server-springboot
# Смена рабочего каталога на каталог с исходным кодом.
WORKDIR /virtualpets-server-springboot
# Сборка с использованием кеша для выкачиваемых артефактов Maven.
RUN --mount=type=cache,id=maven-cache,target=/root/.m2 \
/usr/bin/mvn clean package \
'-DskipTests' \
spring-boot:repackage \
-Dspring-boot:repackage:mainClass=\
ru.urvanov.virtualpets.server.Application \
-Dspring-boot:repackage:classifier=\
target/virtualpets-server-springboot-3.3.2.jar

# Второй этап. 
# В качестве базового образа используется образ
# с OpenJDK 17 Temurin на основе Alpine Linux.
FROM eclipse-temurin:17.0.18_8-jre-alpine-3.23
# Результат первого этапа (builder) разворачивается в контейнере
COPY --from=builder \
/virtualpets-server-springboot/target/\
virtualpets-server-springboot-3.3.2.jar \
/virtualpets-server-springboot.jar

ENTRYPOINT ["java", "-jar", "/virtualpets-server-springboot.jar", \
"--spring.datasource.url=jdbc:postgresql://db:5432/postgres" ]
