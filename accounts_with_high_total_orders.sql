SELECT COUNT(*)
FROM (
        SELECT a.name AS name
        FROM accounts a
        JOIN orders o
        ON a.id = o.account_id
        GROUP BY 1
        HAVING SUM(o.total) > (
            SELECT total
            FROM (
                    SELECT
                    a.name AS name,
                    SUM(o.standard_qty) AS standard,
                    SUM(o.total) AS total
                FROM accounts AS a
                JOIN orders AS o 
                ON a.id = o.account_id
                GROUP BY 1
                ORDER BY 2 DESC
                LIMIT 1
            )tab1
)
)tab2