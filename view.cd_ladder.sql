WITH
 a AS (SELECT * FROM acc_history)
,b AS (SELECT MAX(date_time) AS date_time FROM a)
,c AS (SELECT name
	    , value
  	    , (payload->>'Rate')::numeric AS rate
  	    , (payload->>'Maturity')::date AS end_date
	    , (payload->>'Term')::interval AS term
	    , (payload->>'Bank')::text AS bank
	    , (payload->>'Account')::text AS account
	    , (payload->>'Deposit')::Money AS deposit
         FROM a
         LEFT JOIN b USING (date_time)
        WHERE subtype = 'CD' AND b.date_time IS NOT NULL
      )
,d AS (SELECT *, (end_date - term)::date AS start_date FROM c WHERE end_date > NOW())
SELECT end_date, term, rate, value, bank, account, start_date FROM d ORDER BY end_date ASC;