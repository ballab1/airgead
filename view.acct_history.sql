 SELECT DATE(date_time::timestamp with time zone)::date AS datetime,
    (date_time::timestamp with time zone) AS date_time,
    payload->>'Name'::text AS name,
    (payload->>'Value'::text)::money AS value,
    payload->>'Type'::text AS acct_type,
    payload->>'Subtype'::text AS subtype,
    (payload->>'Rate'::text)::real AS rate,
    payload->>'Account'::text AS acct_num,
    payload->>'Bank'::text AS bank,
    payload
   FROM history;