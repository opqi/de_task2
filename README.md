# de_task2

For db creation and initialization of the tables run:
docker-compose up -d

examples.sql contains query examples for aggregated_data table

To recreate a copied db run:
createdb -h localhost -p 5432 -U db_user newdatabase

pg_restore -h localhost -p 5432 -U db_user -d newdatabase -F c -c task2_db.dump
