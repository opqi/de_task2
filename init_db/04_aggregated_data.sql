-- Создание таблицы для хранения результатов агрегации
CREATE TABLE aggregated_data (
    gender VARCHAR(10),
    age_group VARCHAR(20),
    mcc_cd INT,
    transaction_year INT,
    transaction_month INT,
    total_purchase_amount DECIMAL(15, 2),
    average_purchase_amount DECIMAL(15, 2),
    total_transactions_count INT
);


INSERT INTO aggregated_data
SELECT
    c.gender,
    CASE 
        WHEN c.age <= 18 THEN 'Under 18'
        WHEN c.age BETWEEN 19 AND 30 THEN '19-30'
        ELSE '31 and older'
    END AS age_group,
    m.mcc_cd,
    EXTRACT(YEAR FROM t.transaction_dttm) AS transaction_year,
    EXTRACT(MONTH FROM t.transaction_dttm) AS transaction_month,
    SUM(t.transaction_amt) AS total_purchase_amount,
    AVG(t.transaction_amt) AS average_purchase_amount,
    COUNT(*) AS total_transactions_count
FROM
    transactions t
JOIN
    merchants m ON t.merchant_id = m.merchant_id
JOIN
    clients c ON t.client_id = c.client_id
GROUP BY
    c.gender,
    age_group,
    m.mcc_cd,
    transaction_year,
    transaction_month;
