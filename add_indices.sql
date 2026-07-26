
declare NAMESPACE=postgres
declare pod=$(kubectl get pods --namespace $NAMESPACE -o=jsonpath='{.items[0].metadata.name}')

kubectl cp ~/20251006.market_indices.csv ${NAMESPACE}/${pod}:/tmp/indices.csv
kubectl exec -n $NAMESPACE $pod -- chmod 666 /tmp/indices.csv
kubectl exec -n $NAMESPACE $pod -- psql -U bobb -h localhost -d money -c 'DROP TABLE IF EXISTS tmp_data;CREATE TABLE tmp_data (date_time date,snp money,nasdaq money,dji money);ALTER TABLE tmp_data OWNER TO postgres;COPY tmp_data FROM '"'/tmp/indices.csv'"' header csv;'
kubectl exec -n $NAMESPACE $pod -- rm /tmp/indices.csv

WITH
 a as (select distinct date_time from history)
,b as (select date_time::date, snp, nasdaq, dji from tmp_data)
,c as (select a.date_time, 'S&P' as "Name", b.snp as "Value", 'Index' as "Type", 'n/a' as "Subtype", 'GSPC' as "Symbol" from a
         left join b on a.date_time::date = b.date_time::date )
,d as (select a.date_time, 'NASDAQ' as "Name", b.nasdaq as "Value", 'Index' as "Type", 'n/a' as "Subtype", 'IXIC' as "Symbol" from a
         left join b on a.date_time::date = b.date_time::date )
,e as (select a.date_time, 'DJI' as "Name", b.dji as "Value", 'Index' as "Type", 'n/a' as "Subtype", 'DJI' as "Symbol" from a
         left join b on a.date_time::date = b.date_time::date )
,f as (select * from c union select * from d union select * from e)
,g as (select * from f order by date_time)
,h as (select date_time, (to_jsonb(g) - 'date_time')::jsonb as payload from g)
INSERT INTO history ( date_time,payload ) select date_time,payload from h
