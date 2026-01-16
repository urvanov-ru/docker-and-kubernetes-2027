# Базовый образ busybox версии 1.37.0
FROM busybox:1.37.0
# Метка образа с версией.
LABEL version=0.1
# Метка образа с описанием. 
LABEL description="A simple Docker image with a single command"
# Метка образа с e-mail автора..
LABEL maintainer="fedor@urvanov.ru"
# Просто своя дополнительная метка для личных нужд.
LABEL ru.urvanov.my-super-label=This\ is\ a\ test\ label
# Вывод сообщения при старте контейнера. 
ENTRYPOINT [ "echo", "Hello, world!" ]
