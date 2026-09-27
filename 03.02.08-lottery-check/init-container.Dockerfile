# Образ Flyway для миграции базы данных.
FROM flyway/flyway:13.8.0-alpine

# Образ читает скрипты из каталога /flyway/sql.
# Помещаем наши SQL-скрипты миграции в этот каталог.
COPY src/main/resources/db/migration/*.sql /flyway/sql/

# Выполняем миграцию при запуске контейнера.
ENTRYPOINT ["flyway", "migrate"]

