
DROP TABLE IF EXISTS data;
WITH
 a as (SELECT date_time
            , acct_type
            , info || jsonb_build_object('0-Name', name,
                                         '1-Value', value,
  		 	                 '2-Type', acct_type,
				         '3-Subtype', subtype,
				         '6-Rate', rate,
				         '5-Account', acct_num,
				         '4-Bank', bank) as account
         from acct_history)
,b as (SELECT date_time, jsonb_agg(account) as accounts from a where acct_type != 'Cards' group by date_time)
,c as (SELECT date_time, jsonb_agg(account) as cards from a where acct_type = 'Cards' group by date_time)
,d as (SELECT * from b LEFT JOIN c USING(date_time))
,e as (SELECT jsonb_build_object('0-date_time', date_time,
                                 '1-Accounts', accounts,
                                 '2-Cards', cards) as data
         from d)
,f as (SELECT jsonb_agg(data) as results from e)
SELECT * into data from f;

---------------------------------------------------------------------------------------------------------

WITH
 a AS (SELECT date_time, jsonb_array_elements(payload->'Brokerage') as accts FROM money_from_indata)
,b AS (SELECT * from a where accts->>'Name' = 'Fidelity: Individual - TOD')
SELECT date_time
     , positions.value
     , b.accts->>'Value'
     , ((positions.value)::real - (b.accts->>'Value')::real)
 from positions left join b using (date_time);

WITH
 a AS (SELECT date_time, jsonb_array_elements(payload->'Brokerage') as accts FROM money_from_indata)
,b AS (SELECT * from a where accts->>'Name' = 'Fidelity: Individual - TOD')
,c AS (SELECT date_time, positions.value as "Fidelity", b.accts->>'Value' as "Weekly", (cast(positions.value as float) - cast(b.accts->>'Value' as float)) as diff from positions left join b using (date_time))
,d AS (SELECT date_time, "Fidelity", "Weekly", round(diff) as "diff" from c)
,e AS (SELECT date_time, "Fidelity", "Weekly", (case when abs(diff) < 0.1 then 0 else diff end) as diff from d)
SELECT * from e;
