DROP TABLE IF EXISTS tmp_data;
CREATE TEMPORARY TABLE tmp_data (
    date_time timestamp,
    house_value money
);
ALTER TABLE tmp_data OWNER TO postgres;

INSERT INTO tmp_data (date_time, house_value)
VALUES
('20250601',877300),
('20250501',874200),
('20250401',861400),
('20250301',849000),
('20250201',840000),
('20250101',833600),
('20241201',829700),
('20241101',837200),
('20241001',861800),
('20240901',860600),
('20240801',869000),
('20240701',878800),
('20240601',880900),
('20240501',879800),
('20240401',862600),
('20240301',853800),
('20240201',802900),
('20240101',781600),
('20231201',781300),
('20231101',790800),
('20231001',816200);

with
 a as (select distinct date_time from history)
,b as (select date_time::date, house_value from tmp_data)
,c as (select a.date_time, b.house_value as "Value", '40 Cooper Rd, Mansfield' as "Name", 'Property' as "Type" from a
         left join b on
date_trunc('month', a.date_time::date) =
date_trunc('month', b.date_time::date)
)
,d as (select * from c order by date_time)
,e as (select date_time, (to_jsonb(d) - 'date_time')::jsonb as payload from d)
INSERT INTO history ( date_time,payload )
select date_time,payload from e;
