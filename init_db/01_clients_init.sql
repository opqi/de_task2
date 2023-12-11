-- Создание таблицы профиля клиентов
CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    gender VARCHAR(10),
    age INT
);


WITH client_data AS (
    SELECT 
        generate_series(1, 50) AS client_id,
        CASE WHEN random() > 0.5 THEN 'Male' ELSE 'Female' END AS gender,
        floor(random() * 70) AS age
)
INSERT INTO clients (client_id, gender, age)
SELECT * FROM client_data;
