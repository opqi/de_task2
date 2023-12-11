FROM postgres:11.22-alpine

COPY ./init_db/01_clients_init.sql /docker-entrypoint-initdb.d/
COPY ./init_db/02_merchants_init.sql /docker-entrypoint-initdb.d/
COPY ./init_db/03_transactions_init.sql /docker-entrypoint-initdb.d/
COPY ./init_db/04_aggregated_data.sql /docker-entrypoint-initdb.d/
