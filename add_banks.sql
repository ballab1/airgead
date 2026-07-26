DROP TABLE IF EXISTS tmp_data;
CREATE TEMPORARY TABLE tmp_data (
    name  varchar,
    url  varchar,
	tel  varchar,
	routing  varchar
);
ALTER TABLE tmp_data OWNER TO postgres;

INSERT INTO tmp_data (name, url, tel, routing)
VALUES
('Ally','ally.com','877-247-2559','124003116'),
('BMO Alto','bank.alto.bmo.com','855-266-8100','75906061'),
('Bankcorp Bank','healthequity/wageworks','877 924 3967','NULL'),
('Barclays','jetbluemastercard.com','866 928 3104','NULL'),
('Bask Bank','baskbank.com','833-260-4320','111026177'),
('CapOne (Capital One)','capitalone.com','877-383-4802','31176110'),
('Citicard','citi.com','888-248-4226','271070801'),
('Comenity','NULL','NULL','NULL'),
('Department Stores National Bank','NULL','NULL','NULL'),
('Discover','discover.com','800 347 2683','NULL'),
('Easton','secure-eastoncoop.com','508-238-1000','211373597'),
('Fidelity','fidelity.com','800-835-5097','101205681'),
('Forbright','forbrightbank.com','800-550-0159','55003612'),
('GAP','gap.syf.com','NULL','NULL'),
('Investor','investor360.com','',''),
('Natwest','NULL','NULL','NULL'),
('RBS','personal.rbs.co.uk/mydebitcard','+44 345 724 2424','NULL'),
('Sutton Bank','thpmp.org/mybenefitscenter','866 623 0172','NULL'),
('Synchrony','jcrew.com/credit','855 818 3059','NULL'),
('TD Bank','NULL','800 659 2396','NULL'),
('UMB Bank','mywellatdell.com','866 335 3663','NULL'),
('Vanguard','NULL','NULL','NULL');
delete from banks *;
insert into banks  select * from tmp_data;
DROP TABLE IF EXISTS tmp_data;
select * from banks;
