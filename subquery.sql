SELECT  t3.sr_name "Sales Rep name",
		t2.region_name "Region name",
        t2.max_sales "Max Sales"
FROM (
	SELECT region_name,
	   		MAX(total_sales) max_sales
	FROM (
      		SELECT s.name sr_name, 
					r.name region_name,
        			SUM(o.total_amt_usd) total_sales
			FROM sales_reps s
			JOIN region r
			ON s.region_id = r.id
			JOIN accounts a
			ON s.id = a.sales_rep_id
			JOIN orders o
			ON a.id = o.account_id
			GROUP BY 1,2
  			)t1
	GROUP BY 1
  		)t2
JOIN (
  	SELECT s.name sr_name, 
					r.name region_name,
        			SUM(o.total_amt_usd) total_sales 
			FROM sales_reps s
			JOIN region r
			ON s.region_id = r.id
			JOIN accounts a
			ON s.id = a.sales_rep_id
			JOIN orders o
			ON a.id = o.account_id
			GROUP BY 1,2
  			)t3
ON t2.region_name = t3.region_name 
AND t2.max_Sales = t3.total_sales 