WITH t1 AS (
        SELECT accounts.id AS id, accounts.name AS account_name, accounts.sales_rep_id AS sales_rep_id
        FROM accounts
        ),
    t2 AS (
        SELECT orders.account_id AS account_id, orders.id AS orders_id, orders.total_amt_usd AS orders_total_amt_usd
        FROM orders
    ),
    t3 AS (
        SELECT sales_reps.id AS id, sales_reps.name AS sales_rep, sales_reps.region_id AS region_id
        FROM sales_reps
    ),
    t4 AS (
        SELECT region.id AS id, region.name AS region_name
        FROM region
    ),
    t5 AS (
        SELECT web_events.account_id AS account_id, web_events.channel AS channel
        FROM web_events
    )

SELECT 
    t1.account_name AS "account name",
    t2.orders_id AS "order ID",
    t2.orders_total_amt_usd AS "order total amt in USD",
    t3.sales_rep AS "Sales Rep",
    t4.region_name AS "region name",
    t5.channel AS "channel"
FROM t1
JOIN t2
ON t1.id = t2.account_id
JOIN t3
ON t1.sales_rep_id = t3.id
JOIN t4
ON t3.region_id = t4.id
JOIN t5
ON t1.id = t5.account_id
