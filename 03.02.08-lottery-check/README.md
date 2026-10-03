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


$ kubectl apply -f kubernetes/secret.yaml

$ kubectl apply -f kubernetes/config-map.yaml

$ kubectl apply -f kubernetes/lottery-check.yaml

```




Проверка init-контейнера
========================
Команды проверки init-container.Dockerfile:

Запуск PostgreSQL.

```
$ docker run \
-e POSTGRES_DB=mytempdb \
-e POSTGRES_USER=mytempusername \
-e POSTGRES_PASSWORD=mytemppassword \
-p 5432:5432 postgres
```

Сборка образа для init-контейнера.

```
$ docker build -t urvanov/lottery-check-init \
-f "init-container.Dockerfile" .
```

Узнаём идентификатор контейнера с PostgreSQL.

```
$ docker ps --format "table {{.ID}}\t{{.Image}}" | grep postgres
89d6b2593819   postgres
```

Нам необходимо узнать IP-адрес контейнера с PostgreSQL, чтобы передать
его в init-контейнер.

```
$ docker inspect \
-f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' \
<ID контейнера>
```

Создаём init-контейнер. При этом важно передать ему найденный на прошлом шаге
IP-адрес контейнера с PostgreSQL.


```
$ docker run \
-e FLYWAY_PASSWORD=mytemppassword \
-e FLYWAY_URL=jdbc:postgresql://<IP-адрес PostgreSQL>:5432/mytempdb \
-e FLYWAY_USER=mytempusername \
urvanov/lottery-check-init
```


