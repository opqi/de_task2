-- Создание таблицы транзакций
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    merchant_id INT,
    client_id INT,
    transaction_dttm TIMESTAMP,
    transaction_amt DECIMAL(10, 2),
    FOREIGN KEY (merchant_id) REFERENCES merchants(merchant_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);


WITH transaction_data AS (
    SELECT 
        generate_series(1, 500) AS transaction_id,
        floor(random() * 10) + 1 AS merchant_id,
        floor(random() * 50) + 1 AS client_id,
        current_timestamp - (random() * 365 * 5 || ' days')::INTERVAL AS transaction_dttm,
        round((random() * 1000)::numeric, 2) AS transaction_amt
)
INSERT INTO transactions (transaction_id, merchant_id, client_id, transaction_dttm, transaction_amt)
SELECT * FROM transaction_data;
