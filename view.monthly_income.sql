 WITH
  a AS (SELECT quicken.end_of_month
             , sum(quicken.amount) AS amount
           FROM quicken
          WHERE (quicken.category::text ~ '^1090:.*Income'::text OR quicken.category::text ~ '1090:Medical'::text) AND quicken.category_type::text <> 'Managed Funds'::text
          GROUP BY quicken.end_of_month)
, b AS (SELECT a.end_of_month
             , a.amount
             , lag(a.amount, 12) OVER (ORDER BY a.end_of_month) AS "year-1"
             , lag(a.amount, 24) OVER (ORDER BY a.end_of_month) AS "year-2"
           FROM a
          ORDER BY a.end_of_month DESC LIMIT 12
        )
 SELECT end_of_month, amount, "year-1", "year-2" FROM b;