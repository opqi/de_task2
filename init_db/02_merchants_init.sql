-- Создание таблицы торговых точек
CREATE TABLE merchants (
    merchant_id SERIAL PRIMARY KEY,
    latitude DECIMAL(8, 6),
    longitude DECIMAL(9, 6),
    mcc_cd INT
);


WITH merchant_data AS (
    SELECT 
        generate_series(1, 10) AS merchant_id,
        random() * 180 - 90 AS latitude,
        random() * 360 - 180 AS longitude,
        floor(random() * 1000) AS mcc_cd
)
INSERT INTO merchants (merchant_id, latitude, longitude, mcc_cd)
SELECT * FROM merchant_data;
