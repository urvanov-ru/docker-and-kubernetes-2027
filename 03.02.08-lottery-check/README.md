Сервис проверки лотерейных билетов
----------------------------------


Разворачивание в Kubernetes
===========================
```
$ eval $(minikube -p minikube docker-env)

$ docker build -t urvanov/lottery-check-init \
-f "init-container.Dockerfile" .


$ ./mvnw spring-boot:build-image \
-Dspring-boot.build-image.imageName=urvanov/lottery-check

```




Проверка init-контейнера
========================
Команды проверки init-container.Dockerfile:

```
$ docker run \
-e POSTGRES_PASSWORD=mytemppassword \
-e POSTGRES_USER=mytempusername \
-e POSTGRES_DB=mytempdb \
-p 5432:5432 postgres

$ docker build -t urvanov/lottery-check-init \
-f "init-container.Dockerfile" .

$ docker run \
-e FLYWAY_PASSWORD=mytemppassword \
-e FLYWAY_URL=jdbc:postgresql://172.17.0.2:5432/mytempdb \
-e FLYWAY_USER=mytempusername \
urvanov/lottery-check-init
```


