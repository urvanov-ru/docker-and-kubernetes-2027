
FROM flyway/flyway:12.4.0-azure-mongo

COPY src/main/resources/db/migration/*.sql /flyway/sql/

ENTRYPOINT ["flyway", "migrate"]

