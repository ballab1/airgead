WITH
 a AS (SELECT quicken.category,
            EXTRACT(year FROM quicken.end_of_month)::integer AS year,
            quicken.amount::numeric AS amount
           FROM quicken
          WHERE quicken.category::text ~ '^1090:'::text
        )
,b AS (SELECT a.category,
            sum(a.amount) AS total_amount,
            a.year
           FROM a
          GROUP BY a.category, a.year
        )
,c AS (SELECT b.category,
            sum(CASE WHEN b.year = 2010 THEN b.total_amount ELSE 0::numeric END) AS "2010",
            sum(CASE WHEN b.year = 2011 THEN b.total_amount ELSE 0::numeric END) AS "2011",
            sum(CASE WHEN b.year = 2012 THEN b.total_amount ELSE 0::numeric END) AS "2012",
            sum(CASE WHEN b.year = 2013 THEN b.total_amount ELSE 0::numeric END) AS "2013",
            sum(CASE WHEN b.year = 2014 THEN b.total_amount ELSE 0::numeric END) AS "2014",
            sum(CASE WHEN b.year = 2015 THEN b.total_amount ELSE 0::numeric END) AS "2015",
            sum(CASE WHEN b.year = 2016 THEN b.total_amount ELSE 0::numeric END) AS "2016",
            sum(CASE WHEN b.year = 2017 THEN b.total_amount ELSE 0::numeric END) AS "2017",
            sum(CASE WHEN b.year = 2018 THEN b.total_amount ELSE 0::numeric END) AS "2018",
            sum(CASE WHEN b.year = 2019 THEN b.total_amount ELSE 0::numeric END) AS "2019",
            sum(CASE WHEN b.year = 2020 THEN b.total_amount ELSE 0::numeric END) AS "2020",
            sum(CASE WHEN b.year = 2021 THEN b.total_amount ELSE 0::numeric END) AS "2021",
            sum(CASE WHEN b.year = 2022 THEN b.total_amount ELSE 0::numeric END) AS "2022",
            sum(CASE WHEN b.year = 2023 THEN b.total_amount ELSE 0::numeric END) AS "2023",
            sum(CASE WHEN b.year = 2024 THEN b.total_amount ELSE 0::numeric END) AS "2024",
            sum(CASE WHEN b.year = 2025 THEN b.total_amount ELSE 0::numeric END) AS "2025",
           FROM b
          GROUP BY b.category
          ORDER BY b.category
        )
 SELECT * FROM c;