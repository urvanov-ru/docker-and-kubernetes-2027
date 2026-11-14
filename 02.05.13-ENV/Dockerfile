# Базовый образ busybox версии 1.37.0.
FROM busybox:1.37.0
# Создание переменной окружения MESSAGE_LINE1 со
# значением в кавычках.
ENV MESSAGE_LINE1="Hello, my love\n"
# Создание переменной окружения MESSAGE_LINE2 со 
# значением без кавычек, но с символами экранирования.
ENV MESSAGE_LINE2=How\ are\ you\\n
# При старте контейнера выводится содержимое переменных окружения. 
ENTRYPOINT ["sh", "-c", "echo -e $MESSAGE_LINE1$MESSAGE_LINE2"]
