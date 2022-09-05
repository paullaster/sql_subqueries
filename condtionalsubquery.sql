SELECT r.name "Region name",
		COUNT(o.total)
FROM orders o
JOIN accounts a
ON o.account_id = a.id
JOIN sales_reps sr
ON a.sales_rep_id = sr.id
JOIN region r
ON sr.region_id = r.id
GROUP BY 1
HAVING SUM(o.total_amt_usd) =(

		SELECT
	   		MAX(total_sales) max_sales
		FROM (
      		SELECT
					r.name region_name,
        			SUM(o.total_amt_usd) total_sales
			FROM sales_reps s
			JOIN region r
			ON s.region_id = r.id
			JOIN accounts a
			ON s.id = a.sales_rep_id
			JOIN orders o
			ON a.id = o.account_id
          	GROUP BY 1
  			)t1
		)