USE bank;

-- Query 1: Get the id values of the first 5 clients from district_id = 1
SELECT client_id
FROM client
WHERE district_id = 1
ORDER BY client_id ASC
LIMIT 5;

-- Query 2: Get the id of the last client from district_id = 72
SELECT client_id
FROM client
WHERE district_id = 72
ORDER BY client_id DESC
LIMIT 1;

-- Query 3: Get the 3 lowest loan amounts
SELECT amount
FROM loan
ORDER BY amount ASC
LIMIT 3;

-- Query 4: Possible values of 'status' in loan table, alphabetically
SELECT DISTINCT status
FROM loan
ORDER BY status ASC;

-- Query 5: Loan ID of highest payment received
SELECT loan_id
FROM loan
ORDER BY payments DESC
LIMIT 1;

-- Query 6: Loan amounts of the lowest 5 account_ids
SELECT account_id, amount
FROM loan
WHERE account_id IN (
    SELECT DISTINCT account_id
    FROM loan
    ORDER BY account_id ASC
    LIMIT 5
)
ORDER BY account_id ASC;

-- Query 7: account_ids with the lowest loan amount and duration = 60
SELECT account_id
FROM loan
WHERE duration = 60
ORDER BY amount ASC
LIMIT 5;

-- Query 8: Unique k_symbol values in `order` table
SELECT DISTINCT k_symbol
FROM `order`
ORDER BY k_symbol ASC;

-- Query 9: order_ids for account_id = 34
SELECT order_id
FROM `order`
WHERE account_id = 34;

-- Query 10: account_ids for orders between order_id 29540 and 29560 (inclusive)
SELECT DISTINCT account_id
FROM `order`
WHERE order_id BETWEEN 29540 AND 29560;

-- Query 11: Individual amounts sent to account_to = 30067122
SELECT DISTINCT amount
FROM `order`
WHERE account_to = 30067122;

-- Query 12: 10 most recent transactions from account_id 793
SELECT trans_id, date, type, amount
FROM trans
WHERE account_id = 793
ORDER BY date DESC
LIMIT 10;

-- Query 13: Number of clients from each district_id < 10
SELECT district_id, COUNT(*) AS district_count
FROM client
WHERE district_id < 10
GROUP BY district_id
ORDER BY district_id ASC;

-- Query 14: Number of cards per type, ordered by most frequent
SELECT type, COUNT(*) AS card_count
FROM card
GROUP BY type
ORDER BY card_count DESC;

-- Query 15: Top 10 account_ids by total loan amount
SELECT account_id, SUM(amount) AS amount_sum
FROM loan
GROUP BY account_id
ORDER BY amount_sum DESC
LIMIT 10;

-- Query 16: Number of loans issued each day before 930907, in descending order
SELECT date, COUNT(*) AS loan_count
FROM loan
WHERE date < 930907
GROUP BY date
ORDER BY date DESC;

-- Query 17: For each day in Dec 1997, count loans per duration
SELECT date, duration, COUNT(*) AS loan_count
FROM loan
WHERE date BETWEEN 971201 AND 971231
GROUP BY date, duration
ORDER BY date ASC, duration ASC;

-- Query 18: Sum of transaction amounts for account_id 396, grouped by type
SELECT account_id, type, SUM(amount) AS total_amount
FROM trans
WHERE account_id = 396
GROUP BY type, account_id
ORDER BY type ASC;
