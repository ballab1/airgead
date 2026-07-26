 SELECT EXTRACT(year FROM date) AS year,
    sum(amount) AS amount
   FROM quicken
  WHERE (category::text ~ '^1090:.*Income'::text OR category::text ~ '1090:Medical'::text) AND category_type::text <> 'Managed Funds'::text
  GROUP BY (EXTRACT(year FROM date))
  ORDER BY (EXTRACT(year FROM date));