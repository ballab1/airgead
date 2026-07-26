WITH
 a AS (SELECT category, (sum(amount::money) * -1) as amount
         FROM quicken_data
		WHERE category ~ 'Travel:20'
		GROUP BY category)
SELECT * FROM a ORDER BY category;
