WITH
 a AS (SELECT DATE((date_time::text)::timestamp with time zone)::date as datetime
            , ((payload->>'Value')::money)::numeric AS value
            , (payload->>'Name') AS name
            , (payload->>'Type') AS acct_type
            , (payload->>'Subtype') AS subtype
            , payload
         FROM history WHERE payload->>'Subtype' NOT IN ('Charity', 'Health'))
,b AS (SELECT datetime, SUM(value) AS net_worth
         FROM a WHERE acct_type NOT IN  ('Property', 'Index') AND subtype != 'Stock' GROUP BY datetime)
,c AS (SELECT *, LAG(net_worth, 1) OVER (ORDER BY b.datetime) AS last FROM b)
,d AS (SELECT datetime, (net_worth - last) weekly_change FROM c)
,e AS (SELECT datetime, SUM(value) AS cash_assets
         FROM a WHERE acct_type IN ('Cash Assets', 'Cards') AND subtype NOT IN ('Stock', 'UK') GROUP BY datetime)
,f AS (SELECT datetime, SUM(value) AS managed_funds
         FROM a WHERE acct_type = 'Managed Funds' GROUP BY datetime)
,g AS (SELECT datetime, SUM(value) AS checking
         FROM a WHERE acct_type = 'Cash Assets' AND subtype = 'Checking' GROUP BY datetime)
,h AS (SELECT datetime, SUM(value) AS deferred_comp
         FROM a WHERE acct_type = 'Cash Assets' AND subtype = 'Deferred Compensation' GROUP BY datetime)
,i AS (SELECT datetime, SUM(value) AS money_market
         FROM a WHERE acct_type = 'Cash Assets' AND subtype = 'Brokerage' GROUP BY datetime)
,j AS (SELECT datetime, SUM(value) AS savings
         FROM a WHERE acct_type = 'Cash Assets' AND subtype = 'Savings' GROUP BY datetime)
,k AS (SELECT datetime, SUM(value) AS cds
         FROM a WHERE acct_type = 'Cash Assets' AND subtype = 'CD' GROUP BY datetime)
,l AS (SELECT datetime, SUM(value) AS uk_assets
         FROM a WHERE acct_type = 'Cash Assets' AND subtype = 'UK' GROUP BY datetime)
,m AS (SELECT datetime, SUM(value) AS annuities
         FROM a WHERE acct_type = 'Managed Funds' AND subtype = 'Investment' GROUP BY datetime)
,n AS (SELECT datetime, SUM(value) AS jgb_401k
         FROM a WHERE acct_type = 'Managed Funds' AND subtype = '401K IRA' AND name ~ 'JGB' GROUP BY datetime)
,o AS (SELECT datetime, SUM(value) AS rab_401k
         FROM a WHERE acct_type = 'Managed Funds' AND subtype = '401K IRA' AND name ~ 'RAB' GROUP BY datetime)
,p AS (SELECT datetime, SUM(value) AS roth_ira
         FROM a WHERE acct_type = 'Managed Funds' AND subtype = 'Roth IRA' GROUP BY datetime)
,q AS (SELECT datetime, SUM(value) AS stock
         FROM a WHERE acct_type = 'Cash Assets' AND subtype = 'Stock' GROUP BY datetime)
,r AS (SELECT datetime, SUM(value) AS credit_card_debt
         FROM a WHERE acct_type = 'Cards' AND subtype = 'Credit' GROUP BY datetime)
,s AS (SELECT datetime, SUM(value) AS property
         FROM a WHERE acct_type = 'Property' GROUP BY datetime)
,u AS (SELECT datetime, SUM(value) AS snp
         FROM a WHERE acct_type = 'Index' and name = 'S&P' GROUP BY datetime)
,v AS (SELECT datetime, SUM(value) AS nasdaq
         FROM a WHERE acct_type = 'Index' and name = 'NASDAQ' GROUP BY datetime)
,w AS (SELECT datetime, SUM(value) AS dji
         FROM a WHERE acct_type = 'Index' and name = 'DJI' GROUP BY datetime)
,x AS (SELECT datetime, SUM(value) AS barnum_fg
         FROM a
        WHERE name ~ '^Investor:'
        GROUP BY datetime)
,y AS (SELECT datetime, SUM(value) AS generational_wealth
         FROM a WHERE acct_type = 'Property' OR subtype = 'Stock' GROUP BY datetime)
,aa AS (SELECT DATE((date_time::text)::timestamp with time zone) as datetime
            , ((payload->>'Value')::money)::numeric AS value
         FROM history WHERE payload->>'Subtype' = 'Charity')
,t AS (SELECT datetime, SUM(value) AS charitable_fund
         FROM aa GROUP BY datetime)
,zz AS (SELECT * FROM b
         LEFT JOIN d USING (datetime)
         LEFT JOIN e USING (datetime)
         LEFT JOIN f USING (datetime)
         LEFT JOIN g USING (datetime)
         LEFT JOIN h USING (datetime)
         LEFT JOIN i USING (datetime)
         LEFT JOIN j USING (datetime)
         LEFT JOIN k USING (datetime)
         LEFT JOIN l USING (datetime)
         LEFT JOIN m USING (datetime)
         LEFT JOIN n USING (datetime)
         LEFT JOIN o USING (datetime)
         LEFT JOIN p USING (datetime)
         LEFT JOIN q USING (datetime)
         LEFT JOIN r USING (datetime)
         LEFT JOIN s USING (datetime)
         LEFT JOIN t USING (datetime)
         LEFT JOIN u USING (datetime)
         LEFT JOIN v USING (datetime)
         LEFT JOIN w USING (datetime)
         LEFT JOIN x USING (datetime)
         LEFT JOIN y USING (datetime)
      )
SELECT * FROM zz ORDER BY datetime;