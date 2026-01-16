# Базовый образ busybox версии 1.37.0
FROM busybox:1.37.0
# Объявление переменных, задаваемых при сборке образа.
ARG HELLO_MESSAGE="Hi,"
ARG HELLO_USERNAME
# Вывод содержимого переменных при старте контейнера.
RUN echo $HELLO_MESSAGE $HELLO_USERNAME
