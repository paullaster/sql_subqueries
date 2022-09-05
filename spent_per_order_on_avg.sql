/*BS REQ : What is the lifetime average amount spent in terms of total_amt_usd,
 including only the companies that spent more per order, on average,
  than the average of all orders.*/
/*Getting the avarage values of the accounts*/
SELECT AVG(avg_per_order) "AVG VALUE"
FROM(
    /*Getting accounts with higher AVG per order than the total AVG*/
    SELECT account_id, AVG(total_amt_usd) avg_per_order
    FROM orders
    GROUP BY 1
    HAVING AVG(total_amt_usd) > (
        /*Getting average value of the total amount*/
        SELECT AVG(total_amt_usd)
        FROM orders
    )
)avg_amt

