# syntax=docker/dockerfile:1
# Первая строка с комментарием - это директива парсера.
# В данном случае директива указывает, что используется
# последняя версия синтаксиса.
# Базовый образ с Apache HTTP Server
FROM httpd:2.4.65
# Документирование, что образ слушает порт 80.
EXPOSE 80
# Копирорование файла конфигурации Apache HTTP Server.
# С поддержкой SSI (Server Side Includes).
COPY ./ssi-enabled-httpd.conf /usr/local/apache2/conf/httpd.conf
# Копирование директории с сайтом на сервер.
# Исключая все md и template.shtml файлы.
COPY --exclude=*.md --exclude=template.shtml \
./public-html/ /usr/local/apache2/htdocs/
