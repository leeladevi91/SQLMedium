Write a query that returns customers whose total valid transaction amount is at least 200, sorted from highest to lowest total.
  
SELECT
    customer,
    SUM(amount) AS total
FROM transactions
WHERE amount > 0
GROUP BY customer
HAVING SUM(amount) >= 200
ORDER BY total DESC;
