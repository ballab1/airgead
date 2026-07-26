WITH
 a AS (SELECT * FROM quicken_data)
,b AS (SELECT * FROM category_mapping)
,c AS (SELECT * FROM category_types)
,d AS (SELECT DISTINCT category AS org_category, category as new_category FROM a)
,e AS (SELECT * FROM d WHERE d.org_category NOT IN (SELECT org_category FROM b))
,f AS (SELECT org_category, new_category FROM b UNION SELECT * FROM e)
,g AS (SELECT f.*, c.category_type FROM f
         LEFT JOIN c ON f.new_category = c.category)
,h AS (SELECT * FROM g
        WHERE category_type IS NOT NULL)
,i AS (SELECT org_category, new_category, 'Xfer' FROM g
        WHERE substring(org_category,1,1) = '[' )
,j AS (SELECT * FROM h UNION SELECT * FROM i)
,k AS (SELECT * FROM g
        WHERE category_type IS NULL
          AND (org_category || new_category) NOT IN (SELECT (org_category || new_category) FROM j))
,l AS (SELECT k.org_category
            , k.new_category
            , CASE
                 WHEN c.category_type IS NULL THEN 'Expense'
                 ELSE c.category_type
              END as category_type
         FROM k
         LEFT JOIN c ON k.new_category ~ c.category)
,m AS (SELECT * FROM j UNION SELECT * FROM l)
,n AS (SELECT id
            , a."date"::date
            , (DATE_TRUNC('month', a."date"::date) + ('1 month - 1 day')::interval)::date AS end_of_month
            , a.amount::money
            , m.new_category as category
            , m.category_type
            , a.account
            , a.description
            , a.tax_item
            , a.memo
            , a.tag
            , (regexp_replace(a.num, '^(.*[^\s])\s+S$', '\1')) as num
            , CASE
                 WHEN a.num ~ 'S$' THEN TRUE
                 ELSE FALSE
              END as split
            , a.clr::char
         FROM a
         LEFT JOIN m ON a.category = m.org_category)
SELECT * FROM n ORDER BY 1