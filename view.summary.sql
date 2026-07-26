WITH
 a AS (SELECT (DATE(date_time::text)::timestamp with time zone)::date as datetime
            , ((payload->>'Value')::money)::numeric AS value
            , (payload->>'Type') AS acct_type
            , (payload->>'Subtype') AS subtype
            , payload->>'Name'::text AS name
            , (payload->>'Maturity'::text)::date AS maturity
            , payload
         FROM history
      )
,aa AS (SELECT *
          FROM a
         WHERE subtype NOT IN ('Charity', 'Health') and acct_type != 'Index'
      )
,ab AS (SELECT *
         FROM a
        WHERE subtype = 'Charity'
      )
,ac AS (SELECT *
         FROM a
        WHERE acct_type = 'Property'
      )
,ad AS (SELECT *
         FROM a
        WHERE subtype = 'Stock'
      )
,ae AS (SELECT datetime, value
         FROM ab
        ORDER BY datetime ASC LIMIT 1
      )
,g AS (SELECT MIN(datetime) AS firstdate
            , MAX(datetime) AS lastdate
         FROM a
      )
,d AS (SELECT MIN(maturity) AS next_mature
         FROM a
        WHERE maturity IS NOT NULL AND maturity > (CURRENT_DATE - 1) AND datetime = (SELECT lastdate FROM g)
      )
,e AS (SELECT name
            , maturity
            , value
         FROM a
        WHERE maturity = (SELECT next_mature FROM d) AND datetime = (SELECT lastdate FROM g)
      )
,f AS (SELECT DISTINCT name
            , maturity
            , value
         FROM e
        LIMIT 1
      )
,hh AS (SELECT datetime
            , SUM(value) AS networth
         FROM aa
        GROUP BY datetime
      )
,i AS (SELECT datetime
            , networth
            , networth - lag(networth, 1) OVER (ORDER BY datetime) AS delta
         FROM hh
      )
,b AS (SELECT datetime
            , SUM(value) AS cash_assets
         FROM aa
        WHERE acct_type IN ('Cash Assets', 'Cards') and subtype != 'Stock'
        GROUP BY datetime
      )
,b2 AS (SELECT aa.datetime
             , CASE
                 WHEN aa.datetime < ae.datetime THEN (aa.value - ae.value)
                 ELSE aa.value
               END AS value
          FROM aa, ae
         WHERE aa.acct_type IN ('Cash Assets', 'Cards') and subtype != 'Stock'
      )
,b3 AS (SELECT datetime
             , SUM(value) AS adj_cash_assets
          FROM b2
         GROUP BY datetime
       )
,i0 AS (SELECT datetime
            , cash_assets
            , cash_assets - lag(cash_assets, 1) OVER (ORDER BY datetime) AS delta
         FROM b
      )
,c AS (SELECT datetime
            , SUM(value) AS managed_funds
         FROM aa
        WHERE acct_type = 'Managed Funds'
        GROUP BY datetime
      )
,i1 AS (SELECT datetime
            , managed_funds
            , managed_funds - lag(managed_funds, 1) OVER (ORDER BY datetime) AS delta
         FROM c
      )
,ii AS (SELECT *
         FROM hh
         LEFT JOIN i0 USING (datetime)
         LEFT JOIN i1 USING (datetime)
         LEFT JOIN b3 USING (datetime)
      )
,j AS (SELECT MIN(networth) AS minworth
            , MAX(networth) AS maxworth
            , MIN(cash_assets) AS min_cash_assets
            , MAX(cash_assets) AS max_cash_assets
            , MIN(adj_cash_assets) AS min_adj_cash_assets
            , MAX(adj_cash_assets) AS max_adj_cash_assets
            , MIN(managed_funds) AS min_managed_funds
            , MAX(managed_funds) AS max_managed_funds
         FROM ii
      )
,k AS (SELECT MIN(datetime) AS date_of_minworth
         FROM ii
        WHERE networth = (SELECT minworth FROM j)
      )
,k1 AS (SELECT MIN(datetime) AS date_of_min_cash_assets
         FROM ii
        WHERE cash_assets = (SELECT min_cash_assets FROM j)
      )
,k2 AS (SELECT MIN(datetime) AS date_of_min_adj_cash_assets
         FROM ii
        WHERE adj_cash_assets = (SELECT min_adj_cash_assets FROM j)
      )
,k3 AS (SELECT MAX(datetime) AS date_of_min_managed_funds
         FROM ii
        WHERE managed_funds = (SELECT min_managed_funds FROM j)
      )
,l AS (SELECT MAX(datetime) AS date_of_maxworth
         FROM ii
        WHERE networth = (SELECT maxworth FROM j)
      )
,l1 AS (SELECT MIN(datetime) AS date_of_max_cash_assets
         FROM ii
        WHERE cash_assets = (SELECT max_cash_assets FROM j)
      )
,l2 AS (SELECT MIN(datetime) AS date_of_max_adj_cash_assets
         FROM ii
        WHERE adj_cash_assets = (SELECT max_adj_cash_assets FROM j)
      )
,l3 AS (SELECT MAX(datetime) AS date_of_max_managed_funds
         FROM ii
        WHERE managed_funds = (SELECT max_managed_funds FROM j)
      )
,m AS (SELECT firstdate
            , lastdate
            , (SELECT networth FROM ii WHERE ii.datetime = g.firstdate) AS first_networth
            , (SELECT cash_assets FROM ii WHERE ii.datetime = g.firstdate) AS first_cash_assets
            , (SELECT managed_funds FROM ii WHERE ii.datetime = g.firstdate) AS first_managed_funds
            , (SELECT networth FROM ii WHERE ii.datetime = g.lastdate) AS last_networth
            , (SELECT cash_assets FROM ii WHERE ii.datetime = g.lastdate) AS last_cash_assets
            , (SELECT managed_funds FROM ii WHERE ii.datetime = g.lastdate) AS last_managed_funds
            , (SELECT value FROM ab WHERE ab.datetime = g.lastdate) AS charity_funds
            , (SELECT value FROM ac WHERE ac.datetime = g.lastdate) AS property
            , (SELECT value FROM ad WHERE ad.datetime = g.lastdate) AS stock
            , round((SELECT avg(delta) FROM i)::numeric, 2)::numeric AS avg_delta
            , round((SELECT avg(delta) FROM i WHERE delta < '0.00'::numeric)::numeric, 2)::numeric AS neg_delta
            , round((SELECT avg(delta) FROM i WHERE delta > '0.00'::numeric)::numeric, 2)::numeric AS pos_delta
            , (SELECT count(delta) FROM i WHERE delta < '0.00'::numeric) AS neg_count
            , (SELECT count(delta) FROM i WHERE delta > '0.00'::numeric) AS pos_count
            , (SELECT delta FROM i WHERE i.datetime = g.lastdate) AS last_delta
            , (SELECT count(*) FROM i) AS total_count
            , (SELECT count(*) FROM g) AS num_records
            , (SELECT datetime FROM ae) AS date_of_first_charity
            , (SELECT value FROM ae) AS value_first_charity
            , (SELECT minworth FROM j) AS minworth
            , (SELECT date_of_minworth FROM k) AS date_of_minworth
            , (SELECT maxworth FROM j) AS maxworth
            , (SELECT date_of_maxworth FROM l) AS date_of_maxworth
            , (SELECT min_cash_assets FROM j) AS min_cash_assets
            , (SELECT date_of_min_cash_assets FROM k1) AS date_of_min_cash_assets
            , (SELECT max_cash_assets FROM j) AS max_cash_assets
            , (SELECT date_of_max_cash_assets FROM l1) AS date_of_max_cash_assets
            , (SELECT min_adj_cash_assets FROM j) AS min_adj_cash_assets
            , (SELECT date_of_min_adj_cash_assets FROM k2) AS date_of_min_adj_cash_assets
            , (SELECT max_adj_cash_assets FROM j) AS max_adj_cash_assets
            , (SELECT date_of_max_adj_cash_assets FROM l2) AS date_of_max_adj_cash_assets
            , (SELECT min_managed_funds FROM j) AS min_managed_funds
            , (SELECT date_of_min_managed_funds FROM k3) AS date_of_min_managed_funds
            , (SELECT max_managed_funds FROM j) AS max_managed_funds
            , (SELECT date_of_max_managed_funds FROM l3) AS date_of_max_managed_funds
        FROM g
      )
,n AS (SELECT firstdate::date
            , lastdate::date
            , first_networth::money
            , first_cash_assets::money
            , first_managed_funds::money
            , last_networth::money
            , last_cash_assets::money
            , last_managed_funds::money
            , charity_funds::money
            , property::money
            , stock::money
            , avg_delta::money
            , neg_delta::money
            , pos_delta::money
            , neg_count
            , pos_count
            , last_delta::money
            , total_count
            , num_records
            , (last_networth - first_networth)::money AS net_gain
            , ((lastdate - firstdate)::text || ' days')::interval AS duration
            , date_of_first_charity::date
            , value_first_charity::money
            , minworth::money
            , date_of_minworth::date
            , maxworth::money
            , date_of_maxworth::date
            , min_cash_assets::money
            , date_of_min_cash_assets::date
            , max_cash_assets::money
            , date_of_max_cash_assets::date
            , min_adj_cash_assets::money
            , date_of_min_adj_cash_assets::date
            , max_adj_cash_assets::money
            , date_of_max_adj_cash_assets::date
            , min_managed_funds::money
            , date_of_min_managed_funds::date
            , max_managed_funds::money
            , date_of_max_managed_funds::date
         FROM m
      )
,o AS (SELECT 1 AS id
            , ('Next CD to mature on '::text || to_char(maturity, 'Day DD-Mon, YYYY'::text)) AS info
            , (name::text || '; (' || value::money::text || ')') AS value
         FROM f
      )
,p AS (SELECT 2 AS id
            , ('Total net worth on '::text || to_char(lastdate, 'DD-Mon, YYYY'::text)) AS info
            , CASE WHEN date_of_maxworth = lastdate THEN (last_networth::text || '    **record high'::text)::text
                   ELSE last_networth::text
              END AS value
         FROM n
      )
,y0 AS (SELECT 3 AS id
            , (' - Managed Funds'::text) AS info
            , CASE WHEN date_of_max_managed_funds = lastdate THEN (last_managed_funds::text || '    **record high'::text)::text
                   ELSE last_managed_funds::text
              END AS value
         FROM n
      )
,y1 AS (SELECT 4 AS id
            , (' - Cash assets'::text) AS info
            , CASE WHEN date_of_max_adj_cash_assets = lastdate THEN (last_cash_assets::text || '    **record high'::text)::text
                   ELSE last_cash_assets::text
              END AS value
         FROM n
      )
,y2 AS (SELECT 5 AS id
            , (' - Dell stock'::text) AS info
            , stock::text AS value
         FROM n
      )
,y3 AS (SELECT 6 AS id
            , (' - Property Value: 40 Cooper Rd'::text) AS info
            , property::text AS value
         FROM n
      )
,y4 AS (SELECT 7 AS id
            , ('Donor Advised Fund on '::text || to_char(lastdate, 'DD-Mon, YYYY'::text)) AS info
            , charity_funds::text AS value
         FROM n
      )
,q AS (SELECT 8 AS id
            , 'Last week''s change in net worth'::text AS info
            , last_delta::text AS value
         FROM n
        )
,r2 AS (SELECT CASE WHEN date_of_maxworth = lastdate THEN 0
                    ELSE 9
               END AS id
            , ('Net worth change since  ('::text || to_char(date_of_maxworth, 'DD-Mon, YYYY'::text)|| ' : '::text || (SELECT maxworth::money FROM j)::text || ')') AS info
            , CASE WHEN date_of_first_charity BETWEEN date_of_maxworth AND lastdate THEN
                  ((last_networth + value_first_charity - maxworth)::money::text || '   ('::text || (round((last_networth + value_first_charity - maxworth)::numeric * '100'::numeric / (maxworth - value_first_charity)::numeric, 2)::real)::text || '%)'::text)
                ELSE
                  ((last_networth - maxworth)::money::text || '   ('::text || (round((last_networth - maxworth)::numeric * '100'::numeric / maxworth::numeric, 2)::real)::text || '%)'::text)
              END AS value
         FROM n
      )
,r21 AS (SELECT CASE WHEN date_of_maxworth = lastdate THEN 0
                     ELSE 9
                END AS id
             , ('Net worth change since  ('::text || to_char(date_of_maxworth, 'DD-Mon, YYYY'::text)|| ' : '::text || (SELECT maxworth::money FROM j)::text || ')') AS info
             , ((last_networth - maxworth)::money::text || '   ('::text || (round((last_networth - maxworth)::numeric * '100'::numeric / maxworth::numeric, 2)::real)::text || '%)'::text) AS value
         FROM n
      )
,r3 AS (SELECT CASE WHEN date_of_max_adj_cash_assets = lastdate THEN 0
                     ELSE 10
                END AS id
             , ('Cash assets change since ('::text || to_char(date_of_max_adj_cash_assets, 'DD-Mon, YYYY'::text) || ' : '::text || (SELECT max_adj_cash_assets::money FROM j)::text || ')'::text) AS info
             , ((last_cash_assets - max_adj_cash_assets)::money::text || '   ('::text || (round((last_cash_assets - max_adj_cash_assets)::numeric * '100'::numeric / max_cash_assets::numeric, 2)::real)::text || '%)'::text) value
          FROM n
      )
,r31 AS (SELECT CASE WHEN date_of_max_cash_assets = lastdate THEN 0
                     ELSE 10
                END AS id
              , ('Cash assets change since ('::text || to_char(date_of_max_cash_assets, 'DD-Mon, YYYY'::text) || ' : '::text || (SELECT max_cash_assets::money FROM j)::text || ')'::text) AS info
              , CASE WHEN date_of_first_charity BETWEEN date_of_max_cash_assets AND lastdate THEN
                    ((last_cash_assets + value_first_charity - max_cash_assets)::money::text || '   ('::text || (round((last_cash_assets + value_first_charity - max_cash_assets)::numeric * '100'::numeric / (max_cash_assets - value_first_charity)::numeric, 2)::real)::text || '%)'::text)
                  ELSE
                    ((last_cash_assets - max_cash_assets)::money::text || '   ('::text || (round((last_cash_assets - max_cash_assets)::numeric * '100'::numeric / max_cash_assets::numeric, 2)::real)::text || '%)'::text)
                END AS value
           FROM n
      )
,r32 AS (SELECT CASE WHEN date_of_max_cash_assets = lastdate THEN 0
                     ELSE 10
                END AS id
              , ('Cash assets change since ('::text || to_char(date_of_max_cash_assets, 'DD-Mon, YYYY'::text) || ' : '::text || (SELECT max_cash_assets::money FROM j)::text || ')'::text) AS info
              , ((last_cash_assets - max_cash_assets)::money::text || '   ('::text || (round((last_cash_assets - max_cash_assets)::numeric * '100'::numeric / max_cash_assets::numeric, 2)::real)::text || '%)'::text) value
           FROM n
      )
,r4 AS (SELECT CASE WHEN date_of_max_managed_funds = lastdate THEN 0
                     ELSE 11
                END AS id
             , ('Managed funds change since ('::text || to_char(date_of_max_managed_funds, 'DD-Mon, YYYY'::text) || ' : '::text || (SELECT max_managed_funds::money FROM j)::text || ')'::text) AS info
             , ((last_managed_funds - max_managed_funds)::money::text || '   ('::text || (round((last_managed_funds - max_managed_funds)::numeric * '100'::numeric / max_managed_funds::numeric, 2)::real)::text || '%)'::text) AS value
          FROM n
      )
,s AS (SELECT 12 AS id
            , ('Net worth change since '::text || to_char(firstdate, 'DD-Mon, YYYY'::text)) AS info
            , (net_gain::money::text || '   ('::text || (round((last_networth - first_networth)::numeric * '100'::numeric / first_networth::numeric, 2)::real)::text || '%)'::text) AS value
         FROM n
      )
,t AS (SELECT 13 AS id
            , ('Ratio of "upturn::downturn" weeks'::text) AS info
            , ( pos_count::text || ':'::text || neg_count::text || ' ('::text || round((pos_count::real / neg_count::real)::numeric, 3)::text || ':1)'::text) AS value
         FROM n
      )
,u AS (SELECT 14 AS id
            , ('Average weekly change over last '::text || total_count::text || ' weeks'::text) AS info
            , avg_delta::text AS value
         FROM n
      )
,r AS (SELECT 15 AS id
            , ('Date of max net worth ('::text || (SELECT maxworth::money FROM j)::text || ')'::text) AS info
            , to_char(date_of_maxworth, 'DD-Mon, YYYY'::text)::text AS value
         FROM n
      )
,r0 AS (SELECT 16 AS id
            , ('Date of max cash assets ('::text || (SELECT max_cash_assets::money FROM j)::text || ')'::text) AS info
            , to_char(date_of_max_cash_assets, 'DD-Mon, YYYY'::text)::text AS value
         FROM n
      )
,r1 AS (SELECT 17 AS id
            , ('Date of max managed funds ('::text || (SELECT max_managed_funds::money FROM j)::text || ')'::text) AS info
            , to_char(date_of_max_managed_funds, 'DD-Mon, YYYY'::text)::text AS value
         FROM n
      )
,v AS (SELECT 18 AS id
            , ('Average of '::text || pos_count::text || ' weekly +ve changes in wealth'::text) AS info
            , pos_delta::text AS value
         FROM n
      )
,w AS (SELECT 19 AS id
            , ('Average of '::text || neg_count::text || ' weekly -ve changes in wealth'::text) AS info
            , neg_delta::text AS value
         FROM n
      )
,x AS (SELECT 20 AS id
            , 'Duration tracked'::text AS info
            , CASE
                WHEN duration > '721 days'::interval THEN to_char(duration / 365.25::double precision, 'W'::text) || ' years'::text
                ELSE (to_char(duration, 'W'::text) || ' weeks ('::text) || num_records::text || ' data sets)'::text
              END AS value
         FROM n
      )
,z AS (SELECT id, info, value FROM o
        UNION SELECT id, info, value FROM p
        UNION SELECT id, info, value FROM q
        UNION SELECT id, info, value FROM y0
        UNION SELECT id, info, value FROM y1
        UNION SELECT id, info, value FROM y2
        UNION SELECT id, info, value FROM y3
        UNION SELECT id, info, value FROM y4
        UNION SELECT id, info, value FROM r
        UNION SELECT id, info, value FROM r0
        UNION SELECT id, info, value FROM r1
        UNION SELECT id, info, value FROM r2
--        UNION SELECT id, info, value FROM r21
        UNION SELECT id, info, value FROM r3
--        UNION SELECT id, info, value FROM r31
--        UNION SELECT id, info, value FROM r32
        UNION SELECT id, info, value FROM r4
        UNION SELECT id, info, value FROM s
        UNION SELECT id, info, value FROM t
        UNION SELECT id, info, value FROM u
        UNION SELECT id, info, value FROM v
        UNION SELECT id, info, value FROM w
        UNION SELECT id, info, value FROM x
      )
SELECT id, info, value FROM z ORDER BY id;