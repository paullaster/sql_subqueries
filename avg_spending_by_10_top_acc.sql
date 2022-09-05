/*average amount spent in terms of total_amt_usd for the top 10 total spending accounts*/
/* Getting the average amount*/ 
SELECT 
        AVG(amount) "Avarage Amount Spent"
FROM(
        /* 1. Getting top 10 accounts and  Getting amount column table*/
        SELECT
            a.name  "Account Name" ,
            SUM(o.total_amt_usd) AS amount
        FROM accounts a
        JOIN orders o 
        ON a.id = o.account_id
        ORDER BY 1 DESC
        LIMIT 10
)avarage