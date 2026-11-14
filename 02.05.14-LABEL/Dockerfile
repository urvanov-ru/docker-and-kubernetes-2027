# Базовый образ busybox версии 1.37.0.
FROM busybox:1.37.0
# Метка с названием проекта.
LABEL ru.urvanov.project=docker-and-kubernetes-2027
# Метка с именем автора.
# Обратите внимание, что использованы двойные кавычки, так
# как строка со значением содержит символ пробела.
LABEL ru.urvanov.author="Fedor Urvanov"
# Метка образа с e-mail автора.
LABEL ru.urvanov.email="fedor@urvanov.ru"
# Метка с версией образа.
LABEL ru.urvanov.version=0.1
# Метка образа с описанием. 
LABEL ru.urvanov.description=\
"A simple Docker image with a single command"
# Просто своя дополнительная метка для личных нужд. Здесь
# она только для демонстрации экранирования пробелов с 
# помощью обратной косой черты.
LABEL ru.urvanov.my-super-label=This\ is\ a\ test\ label
# Вывод сообщения при старте контейнера. 
ENTRYPOINT [ "echo", "Hello, world!" ]
