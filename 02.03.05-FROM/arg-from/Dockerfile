# Объявление переменной IMAGE_VERSION с версией образа
ARG IMAGE_VERSION=3.45
# Объявленная переменная IMAGE_NAME используется
# для указания версии образа первой инструкции
# FROM в Dockerfile.
FROM myrepo1:${IMAGE_VERSION}
# Здесь переменная окружения IMAGE_VERSION
# уже недоступна.
...
# В одном Dockerfile может быть несколько инструкций FROM,
# Переменная окружения  IMAGE_VERSION используется
# для указания одинаковой версии образа с первой
# инструкцией FROM.
FROM myrepo2:${IMAGE_VERSION}
