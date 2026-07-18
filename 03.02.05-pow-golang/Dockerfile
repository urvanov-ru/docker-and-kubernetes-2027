# Специальный базовый образ для сборки на Go.
FROM golang:1.26.4-alpine3.24 AS builder

WORKDIR /usr/src/app

# Копируем текст программы в образ.
COPY pow-golang.go ./

# Сборка приложения.
RUN go build -v -o /usr/local/bin/app pow-golang.go

# Базовый образ для запуска собранного приложения.
FROM alpine:3.24.1

# Копируем собранное на предыдущем этапе приложение в образ.
COPY --from=builder /usr/local/bin/app /usr/local/bin/app

# Приложение слушает порт 8087.
# Ожидается запрос вида http://localhost:8087?base=2&exponent=3
EXPOSE 8087

# Команда запуска приложения в контейнере.
CMD ["app"]
