-- Примеры запросов к aggregated_data
-- Сумма вообще всех покупок за 2020 год
SELECT SUM(total_purchase_amount) AS total_purchase_2020
FROM aggregated_data
WHERE transaction_year = 2020;

-- Сумма всех покупок за апрель 2020 года
SELECT SUM(total_purchase_amount) AS total_purchase_april_2020
FROM aggregated_data
WHERE transaction_year = 2020 AND transaction_month = 4;

-- Сумма покупок всех мужчин за 2020 год
SELECT SUM(total_purchase_amount) AS total_purchase_male_2020
FROM aggregated_data
WHERE gender = 'Male' AND transaction_year = 2020;

-- Сумма покупок всех мужчин в возрасте 18-31 за 2020 год
SELECT SUM(total_purchase_amount) AS total_purchase_male_18_31_2020
FROM aggregated_data
WHERE gender = 'Male' AND age_group = '19-30' AND transaction_year = 2020;
