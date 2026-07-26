WITH
 a AS (SELECT
                CASE
                    WHEN quicken.category::text ~ 'Gits'::text THEN 'Gifts'::character varying
                    WHEN quicken.category::text = 'Cell Phone'::text THEN 'Utilities'::character varying
                    WHEN quicken.category::text = 'Telephone'::text THEN 'Utilities'::character varying
                    WHEN quicken.category::text = '1090:Excise'::text THEN 'Utilities'::character varying
                    WHEN quicken.category::text = 'Furniture'::text THEN 'Household'::character varying
                    WHEN quicken.category IS NULL THEN 'Misc'::character varying
                    WHEN quicken.category::text ~ ':'::text THEN "substring"(quicken.category::text, '^[^:]+'::text)::character varying
                    ELSE quicken.category
                END AS category,
            EXTRACT(year FROM quicken.end_of_month)::integer AS year,
            quicken.amount::numeric * '-1'::integer::numeric AS amount
           FROM quicken
        )
,b AS (SELECT a.category,
               sum(a.amount) AS total_amount,
               a.year
          FROM a
         WHERE a.category::text <> 'Medical'::text AND a.category::text !~ '^\[|^1090:'::text
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