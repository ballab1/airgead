
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';
SET search_path TO public;

SET default_table_access_method = heap;



DROP TABLE IF EXISTS positions;
CREATE TEMPORARY TABLE positions (
    date_time character varying COLLATE pg_catalog."default" NOT NULL, "Price" real, "Num Shares" integer, "Money Market" money, "Account Value" money,
    CONSTRAINT positions_pkey PRIMARY KEY (date_time)
);
ALTER TABLE positions OWNER TO postgres;
INSERT INTO positions ( date_time,"Price","Num Shares","Money Market", "Account Value" )
VALUES
('20231014T143000-04',68.040001,2874,104674.06,300221.02),
('20231021T143000-04',65.910004,2874,104674.06,294099.41),
('20231028T163000-04',65.959999,2874,104674.06,294243.10),
('20231104T112400-04',69.510002,2874,105737.44,305509.19),
('20231111T155700-04',73.500000,2874,105737.44,316976.44),
('20231118T101900-04',73.599998,2874,105737.44,317263.83),
('20231125T135000-04',74.410004,2874,105737.44,319591.79),
('20231202T163000-04',71.930000,2874,106171.17,312897.99),
('20231210T133000-04',68.699997,2874,106171.17,303614.96),
('20231219T110000-04',73.529999,2874,106171.17,317496.39),
('20231224T140000-04',75.709999,2874,106621.75,324212.29),
('20231231T133300-05',76.500000,2874,106621.75,326482.75),
('20240106T133300-05',75.839996,2874,106621.75,324585.90),
('20240113T133300-05',79.309998,2874,106621.75,334558.68),
('20240128T140000-05',84.220001,2874,106621.75,348670.03),
('20240203T123400-05',86.320000,2874,108254.28,356337.96),
('20240211T123400-05',86.199997,2874,109377.93,357116.72),
('20240218T133400-05',84.209999,2874,108254.28,350273.82),
('20240224T133400-05',90.349998,2874,108254.28,367920.17),
('20240302T111000-05',124.589996,2874,109807.99,467879.64),
('20240310T141800-05',116.250000,2874,109807.99,443910.49),
('20240317T161800-05',107.000000,4309,109807.99,570870.99),
('20240324T123400-05',112.239998,4309,109807.99,593450.14),
('20240330T145000-05',114.110001,4309,110271.22,601971.21),
('20240408T145000-04',127.150002,4309,110271.22,658160.58),
('20240413T125000-04',117.760002,4309,110271.22,617699.07),
('20240421T125000-04',114.870003,4309,110271.22,605246.06),
('20240428T170000-04',125.059998,4309,110271.22,649154.75),
('20240506T104000-04',129.330002,4309,112637.56,669920.54),
('20240513T140200-04',131.009995,4309,112637.56,677159.63),
('20240518T130200-04',149.520004,4309,112637.56,756919.26),
('20240525T150200-04',160.179993,4309,112637.56,802853.15),
('20240601T160200-04',139.559998,4309,113110.98,714475.01),
('20240608T154000-04',129.970001,4309,113110.98,673151.71),
('20240615T064000-04',134.979996,4309,113110.98,694739.78),
('20240629T101000-04',137.910004,4309,113110.98,707365.19),
('20240706T110290-04',138.960007,4309,113572.04,712350.71),
('20240713T115090-04',139.570007,4309,113572.04,714979.20),
('20240720T115000-04',125.790001,4309,113572.04,655601.15);


DROP TABLE IF EXISTS name_replacements;
CREATE TEMPORARY TABLE name_replacements (
    name character varying COLLATE pg_catalog."default" NOT NULL,
    acct_type character varying COLLATE pg_catalog."default" NOT NULL,
    subtype character varying COLLATE pg_catalog."default" NOT NULL,
    name_replacement character varying COLLATE pg_catalog."default",
    acct_num_replacement character varying COLLATE pg_catalog."default",
    bank_replacement character varying COLLATE pg_catalog."default",
    file_order integer,
    CONSTRAINT name_replacements_pkay PRIMARY KEY (name, acct_type, subtype)
);
ALTER TABLE name_replacements OWNER TO postgres;
INSERT INTO name_replacements ( name, acct_type, subtype, name_replacement, acct_num_replacement, bank_replacement, file_order )
VALUES
    ('Ally - XX0946','Cash Assets','CD','Ally: CD - X0946','XX0946','Ally',0),
    ('Ally','Cash Assets','Checking','Ally: Checking - X4634','1133204634','Ally',1),
    ('Spending Account','Cash Assets','Checking','Ally: Checking - X4634','1133204634','Ally',1),
    ('Ally','Cash Assets','Savings','Ally: Savings - X5337','2172505337','Ally',2),
    ('Ally - XX7352','Cash Assets','CD','Ally: 24-11-06 (5yr) - X7352','3079417352','Ally',3),
    ('24-11-06 (5yr) - XX7352','Cash Assets','CD','Ally: 24-11-06 (5yr) - X7352','3079417352','Ally',3),
    ('Ally - XX1841','Cash Assets','CD','Ally: 24-08-17 (18mo) - X1841','3096591841','Ally',4),
    ('24-08-17 (18mo) - XX1841','Cash Assets','CD','Ally: 24-08-17 (18mo) - X1841','3096591841','Ally',4),
    ('Ally - RAB','Managed Funds','401K IRA','Ally: 401K (RAB) - X4314','7047034314','Ally',5),
    ('25-07-14 (12mo) - XX6436','Cash Assets','CD','Bask: 25-07-14 (12mo) - X6436','7282216436','Bask Bank',6),
    ('26-07-13 (24mo) - XX7367','Cash Assets','CD','Bask: 26-07-13 (24mo) - X7367','8060447367','Bask Bank',7),
    ('BMO Alto - XX1509','Cash Assets','CD','BMO: 29-07-27 (5yr) - X1509','349011361509','BMO Alto',8),
    ('29-07-27 (5yr) - XX1509','Cash Assets','CD','BMO: 29-07-27 (5yr) - X1509','349011361509','BMO Alto',8),
    ('27-07-27 (3yr) - XX2892','Cash Assets','CD','BMO: 27-07-27 (3yr) - X2892','349011392892','BMO Alto',9),
    ('Capital One - X9279','Cash Assets','CD','CapOne: CD - X9279','X9279','CapOne (Capital One)',10),
    ('Capital One - X0147','Cash Assets','CD','CapOne: CD - X0147','36045860147','CapOne (Capital One)',11),
    ('360 Performance Savings','Cash Assets','Savings','CapOne: Savings - X1185','36281011185','CapOne (Capital One)',12),
    ('Capital One: Savings','Cash Assets','Savings','CapOne: Savings - X1185','36281011185','CapOne (Capital One)',12),
    ('Capital One: 360 Money Market','Cash Assets','Brokerage','CapOne: Brokerage - X4596','36043174596','CapOne (Capital One)',13),
    ('25-02-09 (12mo) - X1046','Cash Assets','CD','CapOne: 25-02-09 (12mo) - X1046','36281011046','CapOne (Capital One)',14),
    ('Capital One - X1046','Cash Assets','CD','CapOne: 25-02-09 (12mo) - X1046','36281011046','CapOne (Capital One)',14),
    ('26-03-05 (2yr) - X5024','Cash Assets','CD','CapOne: 26-03-05 (2yr) - X5024','36047455024','CapOne (Capital One)',15),
    ('Capital One - X5024','Cash Assets','CD','CapOne: 26-03-05 (2yr) - X5024','36047455024','CapOne (Capital One)',15),
    ('28-02-22 (5yr) - X1272','Cash Assets','CD','CapOne: 28-02-22 (5yr) - X1272','36045041272','CapOne (Capital One)',16),
    ('Capital One - X1272','Cash Assets','CD','CapOne: 28-02-22 (5yr) - X1272','36045041272','CapOne (Capital One)',16),
    ('Citi: JGB','Cash Assets','Savings','Citi: Savings JGB - X6834','174516834','Citicard',17),
    ('American JGB','Cash Assets','Savings','Citi: Savings JGB - X6834','174516834','Citicard',17),
    ('Citi: RAB','Cash Assets','Savings','Citi: Savings RAB - X1855','XX1855','Citicard',18),
    ('Discover - 8501','Cash Assets','CD','Discover: CD - X8501','X8501','Discover',19),
    ('Discover','Cash Assets','Savings','Discover: Savings - X0277','7032390277','Discover',20),
    ('Bank of Easton - XX7163','Cash Assets','CD','Easton: CD - X7163','330317163','Easton',21),
    ('Bank of Easton - XX8838','Cash Assets','CD','Easton: 25-01-27 (9mo) - X8838','330318838','Easton',22),
    ('25-01-27 (9mo) - XX8838','Cash Assets','CD','Easton: 25-01-27 (9mo) - X8838','330318838','Easton',22),
    ('Easton','Cash Assets','Checking','Easton: Checking - X2127','18432127','Easton',23),
    ('Fidelity - JGB: STEWARD 401(K) PLAN','Managed Funds','401K IRA','Fidelity: 401K (JGB) Steward - X4832','84832','Fidelity',24),
    ('Fidelity - RAB: Dell 401(k) PLAN','Managed Funds','401K IRA','Fidelity: 401K (RAB) Dell - X9037','09037','Fidelity',25),
    ('Fidelity: Deferred Compensation','Cash Assets','Brokerage','Fidelity: Brokerage (Deferred Compensation) - X3296','NONP: 93296','Fidelity',26),
    ('Fidelity: Deferred Compensation','Managed Funds','401K IRA','Fidelity: Brokerage (Deferred Compensation) - X3296','NONP: 93296','Fidelity',26),
    ('Fidelity: Individual - TOD','Cash Assets','Brokerage','Fidelity: Brokerage (Individual - TOD)  - X4009','39900000584654009','Fidelity',27),
    ('Fidelity: Individual - TOD','Managed Funds','Stock','Fidelity: Stock (Individual - TOD) - X4009','39900000584654009','Fidelity',28),
    ('Forbright','Cash Assets','Savings','Forbright: Savings - X9001','48192269001','Forbright',29),
    ('Investor: Joint NFS','Cash Assets','Brokerage','Investor: Brokerage (TOD Joint w/Survivor NFS) - X0977','JAV030977','Investor',30),
    ('MassMutual - JGB: NFS - Advisor PM','Managed Funds','401K IRA','Investor: 401K (JGB) SKG Blue Chip + Tactical ETF + NASDAQ Choice - X7403','ME8097403','Investor',31),
    ('MassMutual - RAB: Ascend Life Ins','Managed Funds','401K IRA','Investor: 401K (RAB) Index Summit 6 PRO - X3899','4483673899','Investor',32),
    ('Equitable - JGB: Equitable Fin Life Co America','Managed Funds','401K IRA','Investor: 401K (JGB) Equitable Fin Life Co America - X8892','523438892','Investor',33),
    ('MassMutual - RAB: NFS - Advisor PM','Managed Funds','401K IRA','Investor: 401K (RAB) SKG Blue Chip High Income Focus - X7402','ME8097402','Investor',34),
    ('MassMutual - RAB: NFS - Advisor PM','Managed Funds','Roth IRA','Investor: Roth (RAB) SKG Blue Chip + Tactical ETF + NASDAQ Choice - X7401','ME8097401','Investor',35),
    ('MassMutual - JGB: NFS - Mutual Fund Strategist','Managed Funds','Roth IRA','Investor: Roth (JGB) NFS - UMA Program - X9052','MT3139052','Investor',36),
    ('SecureFore - RAB: Global Atlantic','Managed Funds','Investment','Investor: Annuity SecureFore 5YR Global Atlantic - X9036','A010049036','Investor',37),
    ('Vanguard - JGB','Managed Funds','Roth IRA','Vanguard: Roth (JGB) - X8830','15188830','Vanguard',38),
    ('Vanguard','Cash Assets','Brokerage','Vanguard: Brokerage - X7940','64717940','Vanguard',39),
    ('1698 - Loft Mastercard','Cards','Credit','1698 - Loft Mastercard','5466 7600 2683 1698','Comenity',1),
    ('1796 - AA RAB (citi)','Cards','Credit','1796 - AA RAB (citi)','5189 4101 2624 1796','Citicard',2),
    ('1961 - GAP Card','Cards','Credit','1961 - GAP Card','4479 9413 1900 1961','GAP',3),
    ('3299 - Target','Cards','Credit','3299 - Target','5859 7520 6875 3299','TD Bank',4),
    ('3333 - J Crew','Cards','Credit','3333 - J Crew','6097 6947 3349 2756','Synchrony',5),
    ('3977 - Discover','Cards','Credit','3977 - Discover','6011 0013 2172 3977','Discover',6),
    ('5780 - Macys amex','Cards','Credit','5780 - Macys amex','3774 811602 45780','Department Stores National Bank',7),
    ('7152 - Capital One (C1)','Cards','Credit','7152 - Capital One (C1)','5178 0573 0698 7152','CapOne (Capital One)',8),
    ('7475 - L.L.Bean','Cards','Credit','7475 - L.L.Bean','5494 6001 2492 7475','Citicard',9),
    ('8000 - JGB JetBlue','Cards','Credit','8000 - JGB JetBlue','5378 1100 4732 8000','Barclays',10),
    ('8192 - West Elm (C1)','Cards','Credit','8192 - West Elm (C1)','6004 3014 3634 8192','CapOne (Capital One)',11),
    ('8406 - AA JGB (citi)','Cards','Credit','8406 - AA JGB (citi)','5189 4100 3067 8406','Citicard',12),
    ('9462 - Pottery Barn (C1)','Cards','Credit','9462 - Pottery Barn (C1)','6004 3015 1067 9462','CapOne (Capital One)',13),
    ('9932 - Banana Republic','Cards','Credit','9932 - Banana Republic','5106 9001 0862 6071','Barclays',14),
    ('JGB - Health  tufts','Cards','Health','Health: Tufts PPO (JGB) - X5930','4143 6416 7038 5930','Sutton Bank',15),
    ('JGB - Health healthequity','Cards','Health','Healthy: Healthequity (JGB)  - X8023','4231 9052 3845 8023','Bankcorp Bank',16),
    ('RAB - HSA (Dell Inc XX701)','Cards','Health','Health: Alight HMO  (RAB) - X1562','5285 7300 0328 1562','UMB Bank',17),
    ('RAB - Tufts (XX998)','Cards','Health','Health: Tufts PPO (RAB) - X4998','4143 6416 7030 4998','Sutton Bank',18),
    ('RAB - Health  tufts','Cards','Health','Health: Tufts PPO (RAB) - X4998','4143 6416 7030 4998','Sutton Bank',18),
    ('RAB - Health alight','Cards','Health','Health: Alight HMO  (RAB) - X1562','5285 7300 0328 1562','UMB Bank',19);


DROP TABLE IF EXISTS subtype_replacements;
CREATE TEMPORARY TABLE subtype_replacements (
    subtype character varying COLLATE pg_catalog."default" NOT NULL,
    replacement character varying COLLATE pg_catalog."default",
    CONSTRAINT subtype_replacements_pkey PRIMARY KEY (subtype)
);
ALTER TABLE subtype_replacements OWNER TO postgres;
INSERT INTO subtype_replacements ( subtype, replacement )
VALUES
('Brokerage','Brokerage'),
('CD info','CD'),
('Checking','Checking'),
('CreditCards','Credit'),
('DebitCards','Health'),
('IRA','401K IRA'),
('Investment','Investment'),
('Roth IRA','Roth IRA'),
('Savings','Savings'),
('Stock','Stock');


DROP TABLE IF EXISTS type_replacements;
CREATE TEMPORARY TABLE type_replacements (
    acct_type character varying COLLATE pg_catalog."default" NOT NULL,
    replacement character varying COLLATE pg_catalog."default",
    CONSTRAINT type_replacements_pkey PRIMARY KEY (acct_type)
);
ALTER TABLE type_replacements OWNER TO postgres;
INSERT INTO type_replacements ( acct_type, replacement )
VALUES
('Brokerage','Cash Assets'),
('CD info','Cash Assets'),
('Checking','Cash Assets'),
('CreditCards','Cards'),
('DebitCards','Cards'),
('IRA','Managed Funds'),
('IRA Investments','Managed Funds'),
('Savings','Cash Assets');


DROP TABLE IF EXISTS indata;
CREATE TEMPORARY TABLE INDATA ( payload jsonb )
ON COMMIT DROP;
INSERT INTO indata
VALUES($$
[
  {
    "date_time": "20231014T143000-04",
    "IRA Investments": [
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 756393.72 },
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 748259.76 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 700115.22 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 374965.37 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 260443.34 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 501256.01 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7277.17 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 2752.14 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 15915.8 }
    ],
    "Brokerage": [
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 301811.63 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 18434.25 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 85997.64 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 166390.37 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 10178.99 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10178.12 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 31159.55 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 44801.06 }
    ],
    "CD info": [
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 50987.38, "Value": 50987.38 },
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32359.79 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65261.64 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 27589.17 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 20180.77 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 26818.78 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33482.73 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 46664.76 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20000 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20000 }
    ],
    "CreditCards": [],
    "DebitCards": []
  },
  {
    "date_time": "20231021T143000-04",
    "IRA Investments": [
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 756393.72 },
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 748259.76 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 700115.22 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 374965.37 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 260443.34 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 501256.01 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7277.17 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 2752.14 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 15915.8 }
    ],
    "Brokerage": [
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 301811.63 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 18434.25 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 85997.64 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 166390.37 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 0 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 51493.9 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 51113.01 }
    ],
    "CD info": [
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 50987.38, "Value": 50987.38 },
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32359.79 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65261.64 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 27589.17 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 20180.77 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 26818.78 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33482.73 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 46664.76 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20000 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20000 }
    ],
    "CreditCards": [],
    "DebitCards": []
  },
  {
    "date_time": "20231028T163000-04",
    "IRA Investments": [
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 718044.87 },
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 734156.67 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 700115.22 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 364651.00 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 251854.58 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 501256.01 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7277.17 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 5607.32 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 14824.74 }
    ],
    "Brokerage": [
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 301811.63 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 18482.81 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 85997.64 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 166390.37 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 0 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 51493.9 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 61237.17 }
    ],
    "CD info": [
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 50987.38, "Value": 51660.15 },
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32359.79 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65261.64 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 27589.17 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 20180.77 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 26818.78 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33482.73 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 46819.13 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20350.14 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20461.09 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -2110.94 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": 0.00 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -47.60 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": 0.00 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": 0.00 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -1009.43 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -1796.58 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20231104T112400-04",
    "IRA Investments": [
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 747256.50 },
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 775061.96 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 730639.42 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 379626.79 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 265863.39 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 501256.01 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7277.17 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 8219.70 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 15845.18 }
    ],
    "Brokerage": [
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 305509.18 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 18583.79 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 86112.24 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 165169.11 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 51884.42 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 60623.17 }
    ],
    "CD info": [
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 50987.38, "Value": 51493.90 },
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32367.76 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65309.72 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 27589.17 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 20180.77 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 26818.78 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33510.12 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 46819.13 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20426.58 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20537.53 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -2110.94 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -267.15 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -47.60 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": 0.00 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": 0.00 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -1134.24 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -1705.68 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20231111T155700-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 789315.95 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 761105.71 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 735635.50 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 374635.71 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 270752.03 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 501256.01 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7277.17 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 6694.86 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 15523.27 }
    ],
    "Brokerage": [
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 211239.18 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 18579.90 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 86112.24 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 165169.11 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 92032.86 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 26291.11 }
    ],
    "CD info": [
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 50987.38, "Value": 51493.90 },
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32367.76 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65309.72 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 27589.17 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 20180.77 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 26818.78 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33510.12 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 46819.13 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20426.58 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20537.53 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -2591.49 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -267.15 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -47.60 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": 0.00 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -3.73 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -1220.79 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -1705.68 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20231118T101900-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 807154.98 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 782875.83 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 761745.23 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 380777.18 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 276892.82 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 501256.01 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7277.17 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 6835.49 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 16223.00 }
    ],
    "Brokerage": [
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 211526.40 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 18596.40 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 86112.24 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 165169.11 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 92032.86 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 22230.97 }
    ],
    "CD info": [
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 50987.38, "Value": 51493.90 },
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32367.76 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65359.44 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 27589.17 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 20180.77 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 26818.78 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33538.45 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 46819.13 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20426.58 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20537.53 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -2252.66 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -197.15 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -67.59 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": 0.00 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -3.73 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -984.98 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": 0.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20231125T135000-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 818731.39 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 790758.25 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 772970.96 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 381439.10 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 280152.53 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 501256.01 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7277.17 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 6855.58 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 16344.81 }
    ],
    "Brokerage": [
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 319591.78 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 78923.06 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 18588.66 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 86112.24 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 167551.81 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 92032.86 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 32895.20 }
    ],
    "CD info": [
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 50987.38, "Value": 51493.90 },
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32367.76 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65359.44 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 27589.17 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 20180.77 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 26818.78 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33538.45 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 46979.18 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20426.58 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20537.53 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -2588.55 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -197.15 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -27.97 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -107.93 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -3.73 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -1064.43 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -114.57 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20231202T163000-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 829029.41 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 795213.53 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 769360.58 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 388134.12 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 284351.46 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 501256.01 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7277.17 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 6855.58 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 16344.81 }
    ],
    "Brokerage": [
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 319591.78 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 78923.06 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 18588.66 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 86168.66 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 167551.81 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 92032.86 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 32695.59 }
    ],
    "CD info": [
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 50987.38, "Value": 51493.90 },
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32367.76 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65359.44 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 27589.17 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 20180.77 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 26818.78 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33538.45 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 46979.18 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20500.55 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20611.50 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -2891.28 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -197.10 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -27.97 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -107.93 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -3.73 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -1070.45 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -470.72 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20231210T133000-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 827458.19 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 804540.51 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 766575.22 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 388883.48 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 283835.71 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 501256.01 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7277.17 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 6971.09 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 16971.56 }
    ],
    "Brokerage": [
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 303614.97 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 83084.70 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 18688.36 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 86168.66 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 167551.81 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 92032.86 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 39240.34 }
    ],
    "CD info": [
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 50987.38, "Value": 51493.90 },
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32376.00 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65407.59 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 27589.17 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 20180.77 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 26818.78 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33565.89 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 46979.18 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20500.55 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20611.50 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -2969.62 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -379.63 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -642.03 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -107.93 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -3.73 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -1228.47 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -660.55 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20231219T110000-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 864688.21 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 830293.54 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 786764.04 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 398720.59 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 296629.99 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 501256.01 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7277.17 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 8912.66 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 17836.64 }
    ],
    "Brokerage": [
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 339360.74 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 88585.94 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 18704.94 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 86168.66 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 168125.98 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 144322.59 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 22248.19 }
    ],
    "CD info": [
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 51999.97, "Value": 0.00 },
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32383.97 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65407.59 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 27589.17 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 20180.77 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 26818.78 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33565.89 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 46979.18 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20500.55 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20611.50 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -2599.00 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -282.93 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -1202.98 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -107.93 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": 0.00 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -890.36 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -649.19 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20231224T140000-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 861608.44 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 838490.02 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 792728.87 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 398322.18 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 295576.76 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 0.00 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 501256.01 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7277.17 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 8912.66 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 17836.64 }
    ],
    "Brokerage": [
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 339360.74 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 88585.94 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 18704.94 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 86168.66 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 168125.98 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 144322.59 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 31772.11 }
    ],
    "CD info": [
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 51999.97, "Value": 0.00 },
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32383.97 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65407.59 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 27589.17 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 20180.77 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 26818.78 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33565.89 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47134.59 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20500.55 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20611.50 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -6192.93 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -282.93 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -1465.98 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -245.23 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -19.70 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -890.36 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -649.19 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20231231T133300-05",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 864329.27 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 846006.43 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 800236.04 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 401459.49 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 296526.55 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 0.00 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 501256.01 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7277.17 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 9015.75 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 18134.43 }
    ],
    "Brokerage": [
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 350886.25 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 92734.35 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 18714.70 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 86168.66 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 168125.98 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 159322.59 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 35511.11 }
    ],
    "CD info": [
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 51999.97, "Value": 0.00 },
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32383.97 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65407.59 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 27589.17 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 20180.77 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 26818.78 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33565.89 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47134.59 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20576.99 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20677.73 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -6305.69 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -245.01 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -1723.88 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -258.73 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -19.70 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -243.49 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -649.19 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20240106T133300-05",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 867115.55 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 828036.32 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 784959.95 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 404764.44 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 290635.50 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 17507.12 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 501256.01 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 8877.22 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 0.00 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 18729.10 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 348778.87 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 91673.41 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 86227.00 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 0.00 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 168728.00 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 159322.59 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0.00 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 59884.67 }
    ],
    "CD info": [
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32383.97 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65457.36 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33565.89 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47134.59 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20576.99 },
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 51999.97, "Value": 0.00 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 0.00 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -4077.76 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -330.24 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -1739.79 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -258.73 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -42.35 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -243.49 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -649.19 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20240113T133300-05",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 869420.54 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 839489.95 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 801712.98 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 402231.24 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 298224.27 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 17801.76 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 501256.01 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 2129.27 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 10403.42 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 0.00 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 18691.99 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 359858.58 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 95789.51 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 86227.00 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 0.00 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 168728.00 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 189756.97 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0.00 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 26434.27 }
    ],
    "CD info": [
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32383.97 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65457.36 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33565.89 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47134.59 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20576.99 },
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 51999.97, "Value": 0.00 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 0.00 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -4327.34 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -147.71 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": -351.71 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -1739.79 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -258.73 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -75.66 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -319.32 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -649.19 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20240128T140000-05",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 892702.35 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 853792.01 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 834800.13 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 406002.15 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 306128.12 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 18110.69 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 501256.01 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 4244.03 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 10336.39 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 0.00 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 18771.42 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 375536.21 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 99520.47 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 86227.00 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 0.00 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 168728.00 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 104756.97 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0.00 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 114545.58 }
    ],
    "CD info": [
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32392.20 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65457.36 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33594.25 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47295.42 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20576.99 },
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 51999.97, "Value": 0.00 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 0.00 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -4881.88 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -176.92 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": -203.81 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -177.90 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": 13.53 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -112.01 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -75.83 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": 0.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20240203T123400-05",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 907687.82 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 856270.29 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 828403.13 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 404714.32 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 311297.71 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 18297.32 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 798219.73 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 4262.55 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 11896.38 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 0.00 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 118825.36 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 383874.04 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 99775.27 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 86285.22 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 0.00 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 168728.00 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 105338.70 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0.00 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 18362.58 }
    ],
    "CD info": [
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32392.20 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65457.36 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33594.25 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47295.42 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20653.22 },
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 51999.97, "Value": 0.00 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 0.00 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -5176.17 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -176.92 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": -203.81 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -327.90 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -215.93 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -163.21 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -75.83 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": 0.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20240211T123400-05",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 925807.07 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 867930.35 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 859163.52 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 400739.17 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 317481.18 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 18525.20 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 798219.73 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 6361.09 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 13624.77 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 0.00 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 118904.25 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 384614.53 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 103621.66 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 86285.22 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 0.00 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 169339.30 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 117338.70 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0.00 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 5720.63 }
    ],
    "CD info": [
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32392.20 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65507.05 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33622.57 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47295.42 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20675.35 },
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 51999.97, "Value": 0.00 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 0.00 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -5656.39 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -176.92 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": -277.76 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -330.89 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -215.93 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -163.21 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -75.83 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": 0.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20240218T133400-05",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 917351.88 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 867866.41 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 866439.38 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 400806.05 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 314656.71 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 18497.44 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 798219.73 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 8481.14 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 13636.23 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 0.00 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 118833.32 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 378260.46 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 103798.18 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 86285.22 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 0.00 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 169339.30 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 117338.70 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0.00 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 4018.01 }
    ],
    "CD info": [
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32400.42 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65507.05 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33622.57 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47295.42 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20675.35 },
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 51999.97, "Value": 0.00 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 0.00 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -2297.96 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -29.21 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": -277.76 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -353.88 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -171.43 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -114.25 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -75.83 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": 0.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20240224T133400-05",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 928394.97 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 888555.84 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 879648.60 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 405036.30 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 318433.02 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 18790.51 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 798219.73 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 10654.04 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 15219.10 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 0.00 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 118847.93 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 397865.48 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 108033.16 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 86285.22 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 0.00 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 169339.30 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 203588.70 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0.00 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 3691.39 }
    ],
    "CD info": [
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32400.42 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65507.05 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33622.57 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47295.42 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2024-02-10", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 20675.35 },
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 51999.97, "Value": 0.00 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 0.00 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -2542.83 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -221.6 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -175.98 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -171.43 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -114.25 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -3.99 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -107.68 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20240302T111000-05",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 946285.84 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 887517.75 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 880627.89 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 402181.85 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 324435.70 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 18974.12 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 798219.73 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 10695.22 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 16942.85 },
      { "Name": "Vanguard - JGB", "Type": "Roth IRA", "Account": "15188830", "Value": 0.00 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 119237.73 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 507623.86 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 108875.52 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 76.57 },
      { "Name": "Vanguard", "Account": "64717940", "Rate": 0.012, "Value": 0.00 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 169339.30 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 204015.69 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 },
      { "Name": "Citi: RAB", "Account": "XX1855", "Rate": 0.0271, "Value": 0.00 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 11497.60 }
    ],
    "CD info": [
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32400.42 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65507.05 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33622.57 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47295.42 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20651.61 },
      { "Name": "Discover - 8501", "Term": "12 months", "Maturity": "2023-12-23", "Rate": 0.04, "Deposit": 50000, "Early Cashout": 51999.97, "Value": 0.00 },
      { "Name": "Bank of Easton - XX7163", "Term": "9 months", "Maturity": "2023-12-27", "Rate": 0.045, "Deposit": 20000, "Early Cashout": 20000, "Value": 0.00 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -2569.33 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -242.73 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -175.98 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -250.66 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -140.15 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -3.99 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": 0.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20240310T141800-05",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 943260.74 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 895336.41 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 889792.67 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 409853.76 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 323503.95 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 19003.57 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 798219.73 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 12913.55 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 14415.31 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 119241.33 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 480994.24 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 112813.40 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 76.57 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 169913.16 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 204015.69 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 10867.06 }
    ],
    "CD info": [
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32400.42 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65553.57 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20651.61 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33649.09 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47456.65 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -2807.84 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -242.73 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -178.97 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -370.73 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -140.15 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -115.72 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": 0.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 7593.54
      }
    ]
  },
  {
    "date_time": "20240317T161800-05",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 939398.26 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 904738.44 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 885478.54 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 409267.31 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 322255.68 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 18921.98 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 798219.73 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 12808.38 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 14285.22 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 119255.58 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 570870.99 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 112308.22 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 76.57 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 169913.16 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 204015.69 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 16159.72 }
    ],
    "CD info": [
      { "Name": "Capital One - X9279", "Term": "3 year", "Maturity": "2024-03-17", "Rate": 0.003, "Deposit": 32117.97, "Early Cashout": 32314.46, "Value": 32411.67 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65553.57 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20651.61 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33649.09 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47456.65 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -2023.10 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -213.52 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -178.97 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -199.30 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -140.15 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -278.46 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": 0.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 6593.54
      }
    ]
  },
  {
    "date_time": "20240324T123400-05",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 965357.05 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 925299.96 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 904314.33 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 412815.82 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 331092.69 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 19286.98 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 798219.73 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 15051.63 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 15949.50 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 119247.86 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 593450.15 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 117123.50 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 32488.24 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 169913.16 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 204015.69 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 32747.78 }
    ],
    "CD info": [
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65553.57 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20651.61 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33649.09 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47608.00 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -2541.84 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -213.52 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -45.97 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -199.30 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -140.15 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -299.69 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": 0.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 6093.54
      }
    ]
  },
  {
    "date_time": "20240330T145000-05",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 965787.38 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 923682.58 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 905103.56 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 420243.16 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 331226.03 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 19357.12 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 798219.73 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 29755.74 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 16001.66 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 119247.86 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 601971.21 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 139995.05 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 1.24 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 199913.16 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 236502.69 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 11303.60 }
    ],
    "CD info": [
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65553.57 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20651.61 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33649.09 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47608.00 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -2776.70 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -213.52 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -19.99 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -199.30 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -68.85 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -299.69 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": 0.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 6093.54
      }
    ]
  },
  {
    "date_time": "20240408T145000-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 957130.98 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 922655.15 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 895191.39 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 413249.50 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 328238.26 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 19237.36 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 501256.01 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 31482.80 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 17333.00 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 119767.46 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 658160.57 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 142263.02 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 100006.22 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 180529.16 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 137250.82 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 30974.63 }
    ],
    "CD info": [
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65603.34 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20734.63 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33677.46 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47608.00 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -4690.69 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -213.52 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -2.99 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -199.30 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -68.85 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -389.20 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": 0.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 6093.54
      }
    ]
  },
  {
    "date_time": "20240413T125000-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 942753.49 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 930709.48 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 892896.31 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 401503.59 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 323314.31 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 18925.51 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 501256.01 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 31218.34 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 17105.31 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 119774.50 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 617699.06 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 140105.34 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 1.22 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 180529.16 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 137250.82 },
      { "Name": "Capital One: Savings", "Account": "XX1185", "Rate": 0.043, "Value": 5.00 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 12840.74 }
    ],
    "CD info": [
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 65603.34 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20734.63 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33677.46 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47608.00 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -3429.32 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": 0.0 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -2.99 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -199.30 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -88.65 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -449.53 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": 0.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 6096.81
      }
    ]
  },
  {
    "date_time": "20240421T125000-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 905468.15 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 891474.54 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 856683.93 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 405103.29 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 310593.94 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 18351.28 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 501256.01 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 32690.91 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 17931.96 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 119788.21 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 603328.54 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 140881.04 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 1.22 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 180529.16 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 137250.82 },
      { "Name": "Capital One: Savings", "Account": "XX1185", "Rate": 0.043, "Value": 5.00 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 4389.05 }
    ],
    "CD info": [
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20734.63 },
      { "Name": "Capital One - X1046", "Term": "1 year", "Maturity": "2025-02-09", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 100000.00 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 98937.73, "Value": 65603.34 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33677.46 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47608.00 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -3891.56 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -32.88 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -5.00 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": 0.00 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -19.75 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -410.69 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": 0.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - HSA (Dell Inc XX701)", "Card": "Alight", "Value": 6096.81 },
      { "Name": "RAB - Tufts (XX998)", "Card": "Tufts", "Value": 1500.00
      }
    ]
  },
  {
    "date_time": "20240428T170000-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 938228.02 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 903519.30 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 877698.73 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 404937.57 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 321736.57 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 18852.14 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 514370.39 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 32849.18 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 19614.83 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 119804.79 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 649154.76 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 143286.32 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 1.22 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 180529.16 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 137250.82 },
      { "Name": "Capital One: Savings", "Account": "XX1185", "Rate": 0.043, "Value": 5.00 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 13266.65 }
    ],
    "CD info": [
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20734.63 },
      { "Name": "Capital One - X1046", "Term": "1 year", "Maturity": "2025-02-09", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 100000.00 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 98937.73, "Value": 65603.34 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33677.46 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47770.30 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -5282.44 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -32.88 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -5.00 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": 0.00 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -62.68 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -410.69 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": 0.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - Health alight", "Account": "X1562", "Card": "Alight", "Value": 6096.81 },
      { "Name": "JGB - Health healthequity", "Account": "X8023", "Card": "Health Equity", "Value": 0.00 },
      { "Name": "RAB - Health  tufts", "Account": "X4998", "Card": "Tufts", "Value": 1500.00
      }
    ]
  },
  {
    "date_time": "20240506T104000-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 953060.22 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 905706.45 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 885901.27 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 410235.01 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 326893.46 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 19085.22 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 514370.39 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 32533.67 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 19827.68 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 120253.70 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 662534.47 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 94651.75 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 12.11 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 181143.52 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 137755.43 },
      { "Name": "Capital One: Savings", "Account": "XX1185", "Rate": 0.043, "Value": 5.00 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 13068.56 }
    ],
    "CD info": [
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20734.63 },
      { "Name": "Capital One - X1046", "Term": "1 year", "Maturity": "2025-02-09", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 100000.00 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 98937.73, "Value": 65824.96 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33677.46 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47770.30 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -6686.95 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -32.88 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -36.43 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -135.46 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -62.68 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -482.62 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": 0.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - Health alight", "Account": "X1562", "Card": "Alight", "Value": 6096.81 },
      { "Name": "JGB - Health healthequity", "Account": "X8023", "Card": "Health Equity", "Value": 0.00 },
      { "Name": "RAB - Health  tufts", "Account": "X4998", "Card": "Tufts", "Value": 1500.00
      }
    ]
  },
  {
    "date_time": "20240513T140200-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 968116.92 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 927683.93 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 899115.43 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 419207.88 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 332022.15 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 19301.15 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 514370.39 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 32677.87 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 19991.41 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 120393.48 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 679788.14 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 95939.18 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 12.11 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 181143.52 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 177755.43 },
      { "Name": "Capital One: Savings", "Account": "XX1185", "Rate": 0.043, "Value": 5.00 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 18002.00 }
    ],
    "CD info": [
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20734.63 },
      { "Name": "Capital One - X1046", "Term": "1 year", "Maturity": "2025-02-09", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 104008.57 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 98937.73, "Value": 65824.96 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33704.94 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47770.30 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -3596.87 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -49.39 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -36.43 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -174.56 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -62.68 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -482.62 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": 0.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - Health alight", "Account": "X1562", "Card": "Alight", "Value": 6096.81 },
      { "Name": "JGB - Health healthequity", "Account": "X8023", "Card": "Health Equity", "Value": 0.00 },
      { "Name": "RAB - Health  tufts", "Account": "X4998", "Card": "Tufts", "Value": 1500.00
      }
    ]
  },
  {
    "date_time": "20240518T130200-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 985219.76 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 941228.39 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 911321.74 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 422305.59 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 337828.82 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 19629.72 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 514370.39 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 32924.07 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 21698.49 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 120359.63 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 756919.24 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 97401.58 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 12.11 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 181143.52 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 187755.43 },
      { "Name": "Capital One: Savings", "Account": "XX1185", "Rate": 0.043, "Value": 5.00 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 10209.31 }
    ],
    "CD info": [
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20814.98 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 98937.73, "Value": 65824.96 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33704.94 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47770.30 },
      { "Name": "Capital One - X1046", "Term": "1 year", "Maturity": "2025-02-09", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 100408.57 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -4040.37 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -67.55 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -85.40 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -311.62 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -42.93 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -78.91 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": 0.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - Health alight", "Account": "X1562", "Card": "Alight", "Value": 6096.81 },
      { "Name": "JGB - Health healthequity", "Account": "X8023", "Card": "Health Equity", "Value": 0.00 },
      { "Name": "RAB - Health  tufts", "Account": "X4998", "Card": "Tufts", "Value": 1500.00
      }
    ]
  },
  {
    "date_time": "20240525T150200-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 993713.78 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 939870.74 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 910769.15 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 414044.12 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 340721.70 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 19648.43 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 514370.39 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 32841.46 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 23118.06 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 120396.46 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 802853.18 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 96683.27 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 12.11 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0425, "Value": 181143.52 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 187755.43 },
      { "Name": "Capital One: Savings", "Account": "XX1185", "Rate": 0.043, "Value": 5.01 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 14779.84 }
    ],
    "CD info": [
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20814.98 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 98937.73, "Value": 65824.96 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33704.94 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47927.90 },
      { "Name": "Capital One - X1046", "Term": "1 year", "Maturity": "2025-02-09", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 100408.57 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -4901.61 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -67.55 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -32.66 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -378.90 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -42.93 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -78.91 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -99.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - Health alight", "Account": "X1562", "Card": "Alight", "Value": 6096.81 },
      { "Name": "JGB - Health healthequity", "Account": "X8023", "Card": "Health Equity", "Value": 0.00 },
      { "Name": "RAB - Health  tufts", "Account": "X4998", "Card": "Tufts", "Value": 1500.00
      }
    ]
  },
  {
    "date_time": "20240601T160200-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 984200.28 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 936171.06 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 903290.41 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 416440.81 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 337554.13 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 19537.74 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 514370.39 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 32804.46 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 23005.56 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 120456.87 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 714475.02 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 96452.55 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 12.12 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0416, "Value": 188364.22 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 187755.43 },
      { "Name": "Capital One: Savings", "Account": "XX1185", "Rate": 0.043, "Value": 5.03 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 14347.34 }
    ],
    "CD info": [
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20898.00 },
      { "Name": "Capital One - X1046", "Term": "1 year", "Maturity": "2025-02-09", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 100408.57 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 98937.73, "Value": 65824.96 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33704.94 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47927.90 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -5192.83 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -67.55 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -25.72 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -378.90 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -42.93 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -30.00 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -99.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - Health alight", "Account": "X1562", "Card": "Alight", "Value": 6096.81 },
      { "Name": "JGB - Health healthequity", "Account": "X8023", "Card": "Health Equity", "Value": 0.00 },
      { "Name": "RAB - Health  tufts", "Account": "X4998", "Card": "Tufts", "Value": 1500.00
      }
    ]
  },
  {
    "date_time": "20240608T154000-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 998107.04 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 952237.47 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 917042.88 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 413383.55 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 342338.18 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 19753.48 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 514370.39 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 32972.76 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 24572.77 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 120713.04 },
      {
         "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 673151.71 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 96622.00 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 12.12 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0416, "Value": 187777.59 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 188364.22 },
      { "Name": "Capital One: Savings", "Account": "XX1185", "Rate": 0.043, "Value": 5.03 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 10170.51 }
    ],
    "CD info": [
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20898.00 },
      { "Name": "Capital One - X1046", "Term": "1 year", "Maturity": "2025-02-09", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 100408.57 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 98937.73, "Value": 66054.74 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33733.36 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47927.90 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -5529.22 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -67.55 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -52.22 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -378.90 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -42.93 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -30.00 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -99.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - Health alight", "Account": "X1562", "Card": "Alight", "Value": 6096.81 },
      { "Name": "JGB - Health healthequity", "Account": "X8023", "Card": "Health Equity", "Value": 0.00 },
      { "Name": "RAB - Health  tufts", "Account": "X4998", "Card": "Tufts", "Value": 1500.00
      }
    ]
  },
  {
    "date_time": "20240615T064000-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 1027230.89 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 968367.80 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 922665.40 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 406927.31 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 352055.86 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 20023.01 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 516424.08 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 33271.69 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 24732.20 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 120786.16 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 694739.80 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 96876.20 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 12.12 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.0416, "Value": 187777.59 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.043, "Value": 188364.22 },
      { "Name": "Capital One: Savings", "Account": "XX1185", "Rate": 0.043, "Value": 5.03 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 }
    ],
    "Checking": [
      { "Name": "Easton", "Account": "18432127", "Value": 6449.32 }
    ],
    "CD info": [
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20898.00 },
      { "Name": "Capital One - X1046", "Term": "1 year", "Maturity": "2025-02-09", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 100832.48 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 98937.73, "Value": 66054.74 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33733.36 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 47927.90 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -2117.10 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": 0.00 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -75.21 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -378.90 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -42.93 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -30.00 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": 0.00 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - Health alight", "Account": "X1562", "Card": "Alight", "Value": 6096.81 },
      { "Name": "JGB - Health healthequity", "Account": "X8023", "Card": "Health Equity", "Value": 0.00 },
      { "Name": "RAB - Health  tufts", "Account": "X4998", "Card": "Tufts", "Value": 1500.00
      }
    ]
  },
  {
    "date_time": "20240629T101000-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 1022182.60 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 985596.17 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 929263.28 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 415428.79 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 350377.61 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 20108.07 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 518945.28 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 33143.06 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 24732.20 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 121040.25 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 707826.23 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 97437.47 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 12.12 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.042, "Value": 187776.59 },
      { "Name": "Forbright", "Account": "2172505337", "Rate": 0.053, "Value": 0.00 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.0425, "Value": 188364.22 },
      { "Name": "Capital One: Savings", "Account": "XX1185", "Rate": 0.043, "Value": 5.03 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 }
    ],
    "Checking": [
      { "Name": "Ally", "Account": "1133204634", "Routing": "124003116", "Value": 1.00 },
      { "Name": "Easton", "Account": "18432127", "Routing": "211373597", "Value": 12172.95 }
    ],
    "CD info": [
      { "Name": "Ally - XX0946", "Term": "5 year", "Maturity": "2024-06-01", "Rate": 0.0285, "Deposit": 25000, "Early Cashout": 27843.54, "Value": 28375.46 },
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20898.00 },
      { "Name": "Capital One - X1046", "Term": "1 year", "Maturity": "2025-02-09", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 100832.48 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 98937.73, "Value": 66054.74 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33733.36 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 48091.29 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -3009.57 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": 0.00 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -48.97 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -28.96 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -160.13 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -34.95 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -8879.68 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - Health alight", "Account": "X1562", "Card": "Alight", "Value": 6096.81 },
      { "Name": "JGB - Health healthequity", "Account": "X8023", "Card": "Health Equity", "Value": 0.00 },
      { "Name": "RAB - Health  tufts", "Account": "X4998", "Card": "Tufts", "Value": 1500.00 },
      { "Name": "JGB - Health  tufts", "Account": "X5930", "Card": "Tufts", "Value": 1500.00
      }
    ]
  },
  {
    "date_time": "20240706T110290-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 1045299.07 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 996984.62 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 937742.77 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 415453.53 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 358257.63 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 20254.93 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 518945.28 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 33432.13 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 25001.06 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 121350.33 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 712350.68 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 98713.10 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 12.13 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.042, "Value": 217201.90 },
      { "Name": "Forbright", "Account": "2172505337", "Rate": 0.053, "Value": 2000.00 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.0425, "Value": 189009.64 },
      { "Name": "Capital One: Savings", "Account": "XX1185", "Rate": 0.043, "Value": 5.05 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 }
    ],
    "Checking": [
      { "Name": "Ally", "Account": "1133204634", "Routing": "124003116", "Value": 1.00 },
      { "Name": "Easton", "Account": "18432127", "Routing": "211373597", "Value": 9891.86 }
    ],
    "CD info": [
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "BMO Alto - XX1509", "Term": "5 year", "Maturity": "2029-07-27", "Rate": 0.0475, "Deposit": 25000, "Early Cashout": 25000, "Value": 0.00 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20978.35 },
      { "Name": "Capital One - X1046", "Term": "1 year", "Maturity": "2025-02-09", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 65008.87, "Value": 100832.48 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2024-05-04", "Rate": 0.009, "Deposit": 64437.07, "Early Cashout": 98937.73, "Value": 66277.88 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33733.36 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 48091.29 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -3565.57 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -80.00 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -28.96 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -28.96 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -160.13 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -160.51 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -9709.84 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - Health alight", "Account": "X1562", "Card": "Alight", "Value": 6096.81 },
      { "Name": "JGB - Health healthequity", "Account": "X8023", "Card": "Health Equity", "Value": 0.00 },
      { "Name": "RAB - Health  tufts", "Account": "X4998", "Card": "Tufts", "Value": 1500.00 },
      { "Name": "JGB - Health  tufts", "Account": "X5930", "Card": "Tufts", "Value": 1500.00
      }
    ]
  },
  {
    "date_time": "20240713T115090-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097403", "Value": 1051874.42 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Type": "IRA", "Account": "4483673899", "Value": 999952.65 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Type": "IRA", "Account": "523438892", "Value": 949528.95 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "IRA", "Account": "ME8097402", "Value": 427403.65 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Type": "Roth IRA", "Account": "ME8097401", "Value": 360506.76 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Type": "Roth IRA", "Account": "MT3139052", "Value": 20705.76 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Type": "Investment", "Account": "A010049036", "Value": 518945.28 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Maturity": "2026-05-26", "Type": "IRA", "Account": "XX4314", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Account": "09037", "Type": "IRA", "Value": 33638.79 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Account": "84832", "Type": "IRA", "Value": 25274.86 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Account": "JAV030977", "Rate": 0.0429, "Value": 121456.19 },
      { "Name": "Fidelity: Individual - TOD", "Account": "X84654009", "Rate": 0.0429, "Value": 714979.17 },
      { "Name": "Fidelity: Deferred Compensation", "Account": "NONP: 93296", "Rate": 0.0429, "Value": 100120.13 },
      { "Name": "Capital One: 360 Money Market", "Account": "36043174596", "Rate": 0.008, "Value": 12.13 }
    ],
    "Savings": [
      { "Name": "Ally", "Account": "2172505337", "Rate": 0.042, "Value": 169201.90 },
      { "Name": "Forbright", "Account": "2172505337", "Rate": 0.053, "Value": 2000.00 },
      { "Name": "Discover", "Account": "7032390277", "Rate": 0.0425, "Value": 189009.64 },
      { "Name": "Capital One: Savings", "Account": "XX1185", "Rate": 0.043, "Value": 5.05 },
      { "Name": "Citi: JGB", "Account": "XX6834", "Rate": 0.0271, "Value": 10.36 }
    ],
    "Checking": [
      { "Name": "Ally", "Account": "1133204634", "Routing": "124003116", "Value": 1.82 },
      { "Name": "Easton", "Account": "18432127", "Routing": "211373597", "Value": 28123.08 }
    ],
    "CD info": [
      { "Name": "Ally - XX7352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 0.0225, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "Ally - XX1841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 0.0505, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "BMO Alto - XX1509", "Term": "5 year", "Maturity": "2029-07-27", "Rate": 0.0475, "Deposit": 25000, "Early Cashout": 25000, "Value": 25000.00 },
      { "Name": "Bank of Easton - XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 0.0475, "Deposit": 20621, "Early Cashout": 20000, "Value": 20978.35 },
      { "Name": "Capital One - X1046", "Term": "1 year", "Maturity": "2025-02-09", "Rate": 5.10, "Deposit": 100000.00, "Early Cashout": 100000.00, "Value": 101244.45 },
      { "Name": "Capital One - X5024", "Term": "2 year", "Maturity": "2026-04-05", "Rate": 4.20, "Deposit": 64437.07, "Early Cashout": 98937.73, "Value": 66277.88 },
      { "Name": "Capital One - X0147", "Term": "4 year", "Maturity": "2026-03-08", "Rate": 0.01, "Deposit": 32985.37, "Early Cashout": 33336.33, "Value": 33760.88 },
      { "Name": "Capital One - X1272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 0.041, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 48091.29 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -2649.23 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -80.00 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -25.98 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -28.96 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -160.13 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -160.51 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -10120.45 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - Health alight", "Account": "X1562", "Card": "Alight", "Value": 6096.81 },
      { "Name": "JGB - Health healthequity", "Account": "X8023", "Card": "Health Equity", "Value": 0.00 },
      { "Name": "RAB - Health  tufts", "Account": "X4998", "Card": "Tufts", "Value": 1500.00 },
      { "Name": "JGB - Health  tufts", "Account": "X5930", "Card": "Tufts", "Value": 1500.00
      }
    ]
  },
  {
    "date_time": "20240720T115000-04",
    "IRA Investments": [
      { "Name": "MassMutual - JGB: NFS - Advisor PM", "Bank": "Investor", "Account": "ME8097403", "Type": "IRA", "Value": 1036453.45 },
      { "Name": "MassMutual - RAB: Ascend Life Ins", "Bank": "Investor", "Account": "4483673899", "Type": "IRA", "Value": 999926.25 },
      { "Name": "Equitable - JGB: Equitable Fin Life Co America", "Bank": "Investor", "Account": "523438892", "Type": "IRA", "Value": 944075.51 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Bank": "Investor", "Account": "ME8097402", "Type": "IRA", "Value": 454028.93 },
      { "Name": "MassMutual - RAB: NFS - Advisor PM", "Bank": "Investor", "Account": "ME8097401", "Type": "Roth IRA", "Value": 360904.65 },
      { "Name": "MassMutual - JGB: NFS - Mutual Fund Strategist", "Bank": "Investor", "Account": "MT3139052", "Type": "Roth IRA", "Value": 20199.66 },
      { "Name": "SecureFore - RAB: Global Atlantic", "Bank": "Investor", "Account": "A010049036", "Type": "Investment", "Value": 518945.28 }
    ],
    "IRA": [
      { "Name": "Ally - RAB", "Bank": "Ally", "Account": "7047034314", "Maturity": "2026-05-26", "Type": "IRA", "Value": 7339.06 },
      { "Name": "Fidelity - RAB: Dell 401(k) PLAN", "Bank": "Fidelity", "Account": "09037", "Type": "IRA", "Value": 33638.79 },
      { "Name": "Fidelity - JGB: STEWARD 401(K) PLAN", "Bank": "Fidelity", "Account": "84832", "Type": "IRA", "Value": 25274.86 }
    ],
    "Brokerage": [
      { "Name": "Investor: Joint NFS", "Bank": "Investor", "Account": "JAV030977", "Rate": 4.29, "Value": 121597.77 },
      { "Name": "Fidelity: Individual - TOD", "Bank": "Fidelity", "Account": "39900000584654009", "Rate": 4.29, "Value": 655601.15 },
      { "Name": "Fidelity: Deferred Compensation", "Bank": "Fidelity", "Account": "NONP: 93296", "Rate": 4.29, "Value": 98851.59 }
    ],
    "Savings": [
      { "Name": "Ally", "Bank": "Ally", "Account": "2172505337", "Rate": 4.20, "Value": 79201.90 },
      { "Name": "360 Performance Savings", "Bank": "Capital One", "Account": "36281011185", "Rate": 4.50, "Value": 33623.01 },
      { "Name": "American JGB", "Bank": "Citi", "Account": "XX6834", "Rate": 2.71, "Value": 10.36 },
      { "Name": "Discover", "Bank": "Discover", "Account": "7032390277", "Rate": 4.50, "Value": 129009.64 },
      { "Name": "Forbright", "Bank": "Forbright", "Account": "48192269001", "Rate": 5.30, "Value": 25000.00 }
    ],
    "Checking": [
      { "Name": "Spending Account", "Bank": "Ally", "Account": "1133204634", "Value": 1.82 },
      { "Name": "Easton", "Bank": "Easton", "Account": "18432127", "Value": 5977.59 }
    ],
    "CD info": [
      { "Name": "24-11-06 (5yr) - XX7352", "Bank": "Ally", "Account": "3079417352", "Term": "5 year", "Maturity": "2024-11-06", "Rate": 2.25, "Deposit": 25000, "Early Cashout": 27013.63, "Value": 27422.20 },
      { "Name": "24-08-17 (18mo) - XX1841", "Bank": "Ally", "Account": "3096591841", "Term": "18 months", "Maturity": "2024-08-17", "Rate": 5.05, "Deposit": 20000, "Early Cashout": 20625.79, "Value": 21066.27 },
      { "Name": "25-07-14 (12mo) - XX6436", "Bank": "Bask Bank", "Account": "7282216436", "Term": "1 year", "Maturity": "2025-07-14", "Rate": 4.75, "Deposit": 25000, "Early Cashout": 25000, "Value": 25000.00 },
      { "Name": "26-07-13 (24mo) - XX7367", "Bank": "Bask Bank", "Account": "8060447367", "Term": "2 year", "Maturity": "2026-07-13", "Rate": 4.75, "Deposit": 25000, "Early Cashout": 25000, "Value": 25000.00 },
      { "Name": "27-07-27 (3yr) - XX2892", "Bank": "BMO Alto", "Account": "349011392892", "Term": "3 year", "Maturity": "2029-07-27", "Rate": 4.60, "Deposit": 60000, "Early Cashout": 25000, "Value": 60000.00 },
      { "Name": "29-07-27 (5yr) - XX1509", "Bank": "BMO Alto", "Account": "349011361509", "Term": "5 year", "Maturity": "2029-07-27", "Rate": 4.80, "Deposit": 25000, "Early Cashout": 25000, "Value": 25000.00 },
      { "Name": "25-01-27 (9mo) - XX8838", "Bank": "Easton", "Account": "XX8838", "Term": "9 months", "Maturity": "2025-01-27", "Rate": 4.75, "Deposit": 20621, "Early Cashout": 20000, "Value": 20978.35 },
      { "Name": "25-02-09 (12mo) - X1046", "Bank": "Capital One", "Account": "36281011046", "Term": "1 year", "Maturity": "2025-02-09", "Rate": 5.10, "Deposit": 100000.00, "Early Cashout": 100000.00, "Value": 101244.45 },
      { "Name": "26-03-05 (2yr) - X5024", "Bank": "Capital One", "Account": "36047455024", "Term": "2 year", "Maturity": "2026-04-05", "Rate": 4.20, "Deposit": 64437.07, "Early Cashout": 98937.73, "Value": 66277.88 },
      { "Name": "28-02-22 (5yr) - X1272", "Bank": "Capital One", "Account": "36045041272", "Term": "5 year", "Maturity": "2028-02-22", "Rate": 4.10, "Deposit": 45588.28, "Early Cashout": 45775.33, "Value": 48091.29 }
    ],
    "CreditCards": [
      { "Name": "1698 - Loft Mastercard", "Card": "Loveloft", "Value": 0.00 },
      { "Name": "1796 - AA RAB (citi)", "Card": "American AAdvantage", "Value": -6173.16 },
      { "Name": "1961 - GAP Card", "Card": "GAP", "Value": 0.00 },
      { "Name": "3299 - Target", "Card": "Target RedCard ", "Value": -80.00 },
      { "Name": "3333 - J Crew", "Card": "J.Crew", "Value": 0.00 },
      { "Name": "3977 - Discover", "Card": "Discover", "Value": -22.99 },
      { "Name": "5780 - Macys amex", "Card": "Macy's Star Rewards", "Value": 0.00 },
      { "Name": "7152 - Capital One (C1)", "Card": "Capital One", "Value": -28.96 },
      { "Name": "7475 - L.L.Bean", "Card": "L.L.Bean", "Value": -33.55 },
      { "Name": "8000 - JGB JetBlue", "Card": "Jetblue", "Value": -130.51 },
      { "Name": "8192 - West Elm (C1)", "Card": "West Elm", "Value": 0.00 },
      { "Name": "8406 - AA JGB (citi)", "Card": "American AAdvantage", "Value": -10120.45 },
      { "Name": "9462 - Pottery Barn (C1)", "Card": "Potterybarn", "Value": 0.00 },
      { "Name": "9932 - Banana Republic", "Card": "Banana Republic", "Value": 0.00 }
    ],
    "DebitCards": [
      { "Name": "RAB - Health alight", "Account": "X1562", "Card": "Alight", "Value": 6096.81 },
      { "Name": "JGB - Health healthequity", "Account": "X8023", "Card": "Health Equity", "Value": 0.00 },
      { "Name": "RAB - Health  tufts", "Account": "X4998", "Card": "Tufts", "Value": 1500.00 },
      { "Name": "JGB - Health  tufts", "Account": "X5930", "Card": "Tufts", "Value": 1500.00 }
    ],
    "Banks": [
      { "Name": "Ally", "Routing": "124003116", "url": "ally.com", "tel": "877-247-2559" },
      { "Name": "Bask Bank", "Routing": "111026177", "url": "baskbank.com", "tel": "833-260-4320" },
      { "Name": "BMO Alto", "Routing": "075906061", "url": "bank.alto.bmo.com", "tel": "855-266-8100" },
      { "Name": "Capital One", "Routing": "031176110", "url": "capitalone.com", "tel": "877-383-4802" },
      { "Name": "Citi", "Routing": "271070801", "url": "citi.com", "tel": "888-248-4226" },
      { "Name": "Easton", "Routing": "211373597", "url": "secure-eastoncoopp.com", "tel": "508-238-1000" },
      { "Name": "Fidelity", "Routing": "101205681", "url": "fidelity.com", "tel": "800-835-5097" },
      { "Name": "Forbright", "Routing": "055003612", "url": "forbrightbank.com", "tel": "800-550-0159" },
      { "Name": "Investor", "Routing": "", "url": "investor360.com", "tel": ""
      }
    ]
  }
]
$$);


DROP TABLE IF EXISTS money_from_indata;
CREATE TEMPORARY TABLE money_from_indata (
    date_time character varying COLLATE pg_catalog."default" NOT NULL,
    payload jsonb NOT NULL,
    CONSTRAINT money_pkey PRIMARY KEY (date_time)
);
ALTER TABLE money_from_indata OWNER TO postgres;
WITH
 a AS (SELECT jsonb_array_elements(payload) as py from indata)
INSERT INTO money_from_indata ( date_time, payload )
SELECT py->>'date_time', py from a;


DROP TABLE IF EXISTS banks;
CREATE TABLE banks (
    name character varying COLLATE pg_catalog."default" NOT NULL,
    url character varying COLLATE pg_catalog."default",
    tel character varying COLLATE pg_catalog."default",
    routing character varying COLLATE pg_catalog."default",
    CONSTRAINT banks_pkey PRIMARY KEY (name)
);
ALTER TABLE banks OWNER TO postgres;
REVOKE ALL ON TABLE banks FROM PUBLIC;
GRANT REFERENCES, SELECT ON TABLE banks TO PUBLIC;
GRANT ALL ON TABLE banks TO postgres;
WITH
 a AS (SELECT jsonb_array_elements(payload) as py from indata)
,b AS (SELECT jsonb_array_elements(py->'Banks') as py
 from a where py->'Banks' is not null)
INSERT INTO banks ( "name", "url", "tel", "routing" )
SELECT py->>'Name' as "name",
       py->>'url' as "url",
       py->>'tel' as "tel",
       py->>'Routing' as "routing"
from b;
DROP TABLE indata;


DROP TABLE IF EXISTS history CASCADE;
CREATE TABLE history (
    date_time character varying COLLATE pg_catalog."default" NOT NULL,
    datetime timestamp with time zone,
	name character varying COLLATE pg_catalog."default",
    value money,
    acct_type character varying COLLATE pg_catalog."default",
    subtype character varying COLLATE pg_catalog."default",
    rate real default 0.0,
    acct_num character varying COLLATE pg_catalog."default",
    bank character varying COLLATE pg_catalog."default",
    info jsonb,
    payload jsonb
);
ALTER TABLE history OWNER TO postgres;
REVOKE ALL ON TABLE history FROM PUBLIC;
GRANT REFERENCES, SELECT ON TABLE history TO PUBLIC;
GRANT ALL ON TABLE history TO postgres;
WITH
 a AS (SELECT date_time, jsonb_object_keys(payload) as acct_type from money_from_indata)
,b AS (SELECT date_time, acct_type, payload->acct_type as accounts from money_from_indata
         left join a using(date_time) where acct_type not in ('date_time', 'Banks'))
,c AS (SELECT date_time, acct_type, jsonb_array_elements(accounts) as account from b)
,d AS (SELECT date_time
            , date_time::timestamp with time zone as datetime
			, account->>'Name' as "name"
            , (account->>'Value')::money as "value"
            , acct_type
            , case
                 when account->>'Type' is null then acct_type
                     else account->>'Type'
              end as subtype
            , case
                 when account->>'Rate' is null then 0.0
                 when (account->>'Rate')::real < 1.0 then (account->>'Rate')::real * 100.0
                 else (account->>'Rate')::real
              end as rate
            , account->>'Account' as acct_num
            , account->>'Bank' as bank
            , (account - 'Name' - 'Value' - 'Type' - 'Rate' - 'Account' - 'Bank' - 'Early Cashout' -'Card') as "info"
            , account as payload
         from c)
INSERT INTO history (date_time, datetime, "name", "value", acct_type, subtype, rate, acct_num, bank, "info", "payload")
SELECT * from d;
DROP TABLE money_from_indata;


UPDATE history set acct_type = type_replacements.replacement
    from type_replacements where history.acct_type = type_replacements.acct_type;
UPDATE history set subtype = subtype_replacements.replacement
    from subtype_replacements where history.subtype = subtype_replacements.subtype;
UPDATE history set ("name", acct_num, bank) = (name_replacements.name_replacement, name_replacements.acct_num_replacement, name_replacements.bank_replacement)
    from name_replacements
    where history.name = name_replacements.name
    and history.acct_type = name_replacements.acct_type
    and history.subtype = name_replacements.subtype;
WITH
 a as (SELECT * from positions)
UPDATE history set info = (info || jsonb_build_object('Account Value', history.value) || (to_jsonb(a.*) - 'date_time' - 'value'))
from a where name ~ 'Individual' and history.date_time = a.date_time;
UPDATE history set value = '$501,256.01' where acct_type = 'Managed Funds'
  and subtype = 'Investment' and value = '$798,219.73';
UPDATE history set value = (info->>'Money Market')::money where name ~ 'Individual' and subtype = 'Brokerage';
INSERT INTO history (
    date_time
  , datetime
  , name
  , value
  , acct_type
  , subtype
  , rate
  , acct_num
  , bank
  , info
  , payload
)
SELECT
    date_time
  , datetime
  , regexp_replace(name, 'Brokerage', 'Stock')
  , (info->>'Num Shares')::real * (info->>'Price')::money
  , 'Managed Funds'
  , 'Stock'
  , rate
  , acct_num
  , bank
  , info
  , payload
from history
  where name ~ 'Individual'
  and acct_type = 'Cash Assets'
  and subtype = 'Brokerage';
UPDATE history set (acct_type, subtype) = ('Cash Assets', 'Deferred Compensation')
  where "name" = 'Fidelity: Brokerage (Deferred Compensation) - X3296';
UPDATE history set payload = info || jsonb_build_object('date_time', date_time,
                                                'Name', name,
                                                'Value', value,
                                                'Type', acct_type,
                                                'Subtype', subtype,
                                                'Bank', bank,
                                                'Account', acct_num,
                                                'Rate', rate);

DROP TABLE name_replacements, type_replacements, subtype_replacements, positions;
ALTER TABLE history
  drop datetime,
  drop name,
  drop value,
  drop acct_type,
  drop subtype,
  drop rate,
  drop acct_num,
  drop bank,
  drop info;
CREATE INDEX history_datetime_name_index
    ON public.history USING btree
    (date_time text_pattern_ops ASC NULLS LAST, (payload->>'Name') text_pattern_ops ASC NULLS LAST)
    WITH (deduplicate_items=True);


DROP VIEW if exists acct_history CASCADE;
CREATE VIEW acct_history AS
 SELECT date_time::timestamp with time zone AS datetime,
    date_time,
    payload->>'Name' AS name,
    (payload->>'Value')::money AS value,
    payload->>'Type' AS acct_type,
    payload->>'Subtype' AS subtype,
    (payload->>'Rate')::real AS rate,
    payload->>'Account' AS acct_num,
    payload->>'Bank' AS bank,
    payload
   FROM history;
ALTER VIEW acct_history OWNER TO postgres;
GRANT SELECT,REFERENCES ON TABLE acct_history TO PUBLIC;


DROP VIEW if exists summary;
CREATE VIEW summary AS
WITH
 a AS (SELECT min(acct_history.datetime) AS firstdate
           , max(acct_history.datetime) AS lastdate
        FROM acct_history)
,b AS (SELECT datetime
            , sum(value) AS networth
         FROM acct_history GROUP BY datetime)
,c AS (SELECT datetime
            , networth
            , networth - lag(networth, 1) OVER (ORDER BY datetime) AS delta
         FROM b)
,d AS (SELECT a.firstdate
            , a.lastdate
            , (SELECT b.networth FROM b WHERE b.datetime = a.lastdate) AS last_networth
            , (SELECT b.networth FROM b WHERE b.datetime = a.firstdate) AS first_networth
            , (SELECT avg(c.delta::numeric)::money FROM c) AS avg_delta
            , (SELECT avg(c.delta::numeric)::money FROM c WHERE c.delta < '$0.00'::money) AS neg_delta
            , (SELECT avg(c.delta::numeric)::money FROM c WHERE c.delta > '$0.00'::money) AS pos_delta
            , (SELECT count(c.delta) FROM c WHERE c.delta < '$0.00'::money) AS neg_count
            , (SELECT count(c.delta) FROM c WHERE c.delta > '$0.00'::money) AS pos_count
            , (SELECT count(*) FROM c) AS total_count
            , (SELECT count(*) FROM b) AS num_records
            , (SELECT delta FROM c where c.datetime = a.lastdate) AS last_delta
         FROM a)
,e AS (SELECT *
            , (last_networth - first_networth) AS net_gain
            , (lastdate - firstdate) AS duration
         FROM d)
,f AS (SELECT 1 AS id
            , 'Total net worth on ' || (SELECT to_char(a.lastdate, 'DD-Mon, YYYY') FROM a)::text AS info
            , (SELECT e.last_networth FROM e)::text AS value)
,g AS (SELECT 4 AS id
            , 'Change in wealth since ' || (SELECT to_char(firstdate, 'DD-Mon, YYYY') FROM a) AS info
            , (SELECT (net_gain::text || '   (' || round((last_networth - first_networth)::numeric * '100'::numeric / e.first_networth::numeric, 2)::real::text || '%)') from e) AS value
        UNION SELECT id, info, value FROM f)
,i AS (SELECT 5 AS id
            , 'Ratio of ' || pos_count::text || ' "upturn weeks" to ' || neg_count::text || ' "downturn weeks"' AS info
            , (round((pos_count::real / neg_count::real)::numeric, 3)::text || ':1') AS value
         FROM d
       UNION SELECT id, info, value FROM g)
,j AS (SELECT 6 AS id
            ,'Average weekly change over last ' || total_count::text || ' weeks' AS info
            , avg_delta::text AS value
         FROM d
        UNION SELECT id, info, value FROM i)
,k AS (SELECT 7 AS id
            , 'Average of ' || pos_count::text || ' weekly +ve changes in wealth' AS info
            , pos_delta::text AS value
         FROM d
        UNION SELECT id, info, value FROM j)
,l AS (SELECT 8 AS id
            , 'Average of ' || neg_count::text || ' weekly -ve changes in wealth' AS info
            , neg_delta::text AS value
         FROM d
        UNION SELECT id, info, value FROM k)
,m AS (SELECT 9 AS id
            , 'Duration tracked' AS info
            , CASE
                WHEN duration > '721 days'::interval THEN to_char(duration / 365.25::double precision, 'W') || ' years'
                ELSE to_char(duration, 'W') || ' weeks (' || num_records || ' data sets)'
              END AS value
          FROM e
       UNION SELECT id, info, value FROM l)
,n as (SELECT MIN((payload->>'Maturity')::date) next_mature from history where payload->>'Subtype' = 'CD' and (payload->>'Maturity')::date > (CURRENT_DATE - 1))
,o as (select payload->>'Name' as name, (payload->>'Maturity')::date as maturity from history where (payload->>'Maturity')::date = (SELECT next_mature from n))
,p as (SELECT DISTINCT name, maturity from o)
,h as (SELECT 3 as id, 'Next CD to mature is "' || name || '"' as info, maturity::text as value from p
       UNION SELECT * from m)
,q as (SELECT 2 as id, 'Last week''s change in net worth' as info, last_delta::text as value from d
       UNION SELECT * from h)
SELECT * FROM q order by id;
ALTER VIEW summary OWNER TO postgres;
GRANT SELECT, REFERENCES ON TABLE summary TO PUBLIC;


with
 a as (select * from (values ($${
  "date_time": "20240727T115000-04",
  "Accounts": [
    { "Name": "Ally: Checking - X4634", "Value": "$1.82", "Type": "Cash Assets", "Subtype": "Checking", "Bank": "Ally", "Account": "1133204634", "Rate": 0 },
    { "Name": "Ally: Savings - X5337", "Value": "$79,201.90", "Type": "Cash Assets", "Subtype": "Savings", "Bank": "Ally", "Account": "2172505337", "Rate": 4.2 },
    { "Name": "Ally: 24-11-06 (5yr) - X7352", "Value": "$27,422.20", "Type": "Cash Assets", "Subtype": "CD", "Bank": "Ally", "Account": "3079417352", "Rate": 2.25, "Deposit": 2500, "Maturity": "2024-11-06", "Term": "5 year" },
    { "Name": "Ally: 24-08-17 (18mo) - X1841", "Value": "$21,066.27", "Type": "Cash Assets", "Subtype": "CD", "Bank": "Ally", "Account": "3096591841", "Rate": 5.05, "Deposit": 2000, "Maturity": "2024-08-17", "Term": "18 months" },
    { "Name": "Ally: 401K (RAB) - X4314", "Value": "$7,339.06", "Type": "Managed Funds", "Subtype": "401K IRA", "Bank": "Ally", "Account": "7047034314", "Rate": 0, "Maturity": "2026-05-26" },
    { "Name": "Bask: 25-07-14 (12mo) - X6436", "Value": "$50000.00", "Type": "Cash Assets", "Subtype": "CD", "Bank": "Bask Bank", "Account": "7282216436", "Rate": 5.16, "Deposit": 2500, "Maturity": "2025-07-14", "Term": "1 year" },
    { "Name": "Bask: 26-07-13 (24mo) - X7367", "Value": "$60,000.00", "Type": "Cash Assets", "Subtype": "CD", "Bank": "Bask Bank", "Account": "8060447367", "Rate": 4.64, "Deposit": 2500, "Maturity": "2026-07-13", "Term": "2 year" },
    { "Name": "BMO: 29-07-27 (5yr) - X1509", "Value": "$25,000.00", "Type": "Cash Assets", "Subtype": "CD", "Bank": "BMO Alto", "Account": "349011361509", "Rate": 4.8, "Deposit": 2500, "Maturity": "2029-07-27", "Term": "5 year" },
    { "Name": "BMO: 27-07-27 (3yr) - X2892", "Value": "$60,000.00", "Type": "Cash Assets", "Subtype": "CD", "Bank": "BMO Alto", "Account": "349011392892", "Rate": 4.6, "Deposit": 6000, "Maturity": "2029-07-27", "Term": "3 year" },
    { "Name": "CapOne: Savings - X1185", "Value": "$33,623.01", "Type": "Cash Assets", "Subtype": "Savings", "Bank": "CapOne (Capital One)", "Account": "36281011185", "Rate": 4.5 },
    { "Name": "CapOne: Savings - X4596", "Value": "$0.00", "Type": "Cash Assets", "Subtype": "Savings", "Bank": "CapOne (Capital One)", "Account": "36043174596", "Rate": 0.8 },
    { "Name": "CapOne: 25-02-09 (12mo) - X1046", "Value": "$101,244.45", "Type": "Cash Assets", "Subtype": "CD", "Bank": "CapOne (Capital One)", "Account": "36281011046", "Rate": 5.1, "Deposit": 10000, "Maturity": "2025-02-09", "Term": "1 year" },
    { "Name": "CapOne: 26-03-05 (2yr) - X5024", "Value": "$66,277.88", "Type": "Cash Assets", "Subtype": "CD", "Bank": "CapOne (Capital One)", "Account": "36047455024", "Rate": 4.2, "Deposit": 64437.0, "Maturity": "2026-04-05", "Term": "2 year" },
    { "Name": "CapOne: 28-02-22 (5yr) - X1272", "Value": "$48,249.95", "Type": "Cash Assets", "Subtype": "CD", "Bank": "CapOne (Capital One)", "Account": "36045041272", "Rate": 4.1, "Deposit": 45588.2, "Maturity": "2028-02-22", "Term": "5 year" },
    { "Name": "Citi: Savings JGB - X6834", "Value": "$10.36", "Type": "Cash Assets", "Subtype": "Savings", "Bank": "Citicard", "Account": "174516834", "Rate": 0.0 },
    { "Name": "Discover: Savings - X0277", "Value": "$129,009.64", "Type": "Cash Assets", "Subtype": "Savings", "Bank": "Discover", "Account": "7032390277", "Rate": 4.25 },
    { "Name": "Easton: Checking - X2127", "Value": "$8277.119", "Type": "Cash Assets", "Subtype": "Checking", "Bank": "Easton", "Account": "18432127", "Rate": 0 },
    { "Name": "Easton: 25-01-27 (9mo) - X8838", "Value": "$20,978.35", "Type": "Cash Assets", "Subtype": "CD", "Bank": "Easton", "Account": "330318838", "Rate": 4.75, "Deposit": 2062, "Maturity": "2025-01-27", "Term": "9 months" },
    { "Name": "Fidelity: Brokerage (Deferred Compensation) - X3296", "Value": "$98,846.96", "Type": "Cash Assets", "Subtype": "Deferred Compensation", "Bank": "Fidelity", "Account": "NONP: 93296", "Rate": 4.29 },
    { "Name": "Fidelity: Brokerage (Individual - TOD)  - X4009", "Value": "$113,572.04", "Type": "Cash Assets", "Subtype": "Brokerage", "Bank": "Fidelity", "Account": "39900000584654009", "Rate": 4.29, "Account Value": "$602,902.08", "Money Market": "$113,572.04", "Num Shares": 4309, "Price": 125.79 },
    { "Name": "Fidelity: Stock (Individual - TOD)  - X4009", "Value": "$489,330.04", "Type": "Managed Funds", "Subtype": "Stock", "Bank": "Fidelity", "Account": "39900000584654009", "Rate": 4.29, "Account Value": "$602,902.08", "Money Market": "$113,572.04", "Num Shares": 4309, "Price": 125.79 },
    { "Name": "Forbright: Savings - X9001", "Value": "$25,000.00", "Type": "Cash Assets", "Subtype": "Savings", "Bank": "Forbright", "Account": "48192269001", "Rate": 5.3 },
    { "Name": "Investor: Brokerage (TOD Joint w/Survivor NFS) - X0977", "Value": "$121,597.77", "Type": "Cash Assets", "Subtype": "Brokerage", "Bank": "Investor", "Account": "JAV030977", "Rate": 4.29 },
    { "Name": "Investor: 401K (JGB) SKG Blue Chip + Tactical ETF + NASDAQ Choice - X7403", "Value": "$1,036,453.45", "Type": "Managed Funds", "Subtype": "401K IRA", "Bank": "Investor", "Account": "ME8097403", "Rate": 0 },
    { "Name": "Investor: 401K (RAB) INDEX SUMMIT 6 PRO - X3899", "Value": "$999,926.25", "Type": "Managed Funds", "Subtype": "401K IRA", "Bank": "Investor", "Account": "4483673899", "Rate": 0 },
    { "Name": "Investor: 401K (JGB) Equitable Fin Life Co America - X8892", "Value": "$944,075.51", "Type": "Managed Funds", "Subtype": "401K IRA", "Bank": "Investor", "Account": "523438892", "Rate": 0 },
    { "Name": "Investor: 401K (RAB) SKG Blue Chip High Income Focus - X7402", "Value": "$454,028.93", "Type": "Managed Funds", "Subtype": "401K IRA", "Bank": "Investor", "Account": "ME8097402", "Rate": 0 },
    { "Name": "Investor: Roth (RAB) SKG Blue Chip + Tactical ETF + NASDAQ Choice - X7401", "Value": "$360,904.65", "Type": "Managed Funds", "Subtype": "Roth IRA", "Bank": "Investor", "Account": "ME8097401", "Rate": 0 },
    { "Name": "Investor: Roth (JGB) NFS - UMA Program - X9052", "Value": "$20,199.66", "Type": "Managed Funds", "Subtype": "Roth IRA", "Bank": "Investor", "Account": "MT3139052", "Rate": 0 },
    { "Name": "Investor: Annuity SecureFore 5YR Global Atlantic - X9036", "Value": "$518,945.28", "Type": "Managed Funds", "Subtype": "Investment", "Bank": "Investor", "Account": "A010049036", "Rate": 0 }
  ],
  "Cards": [
    { "Name": "1698 - Loft Mastercard", "Value": "$0.00", "Type": "Cards", "Subtype": "Credit", "Bank": "Comenity", "Account": "5466 7600 2683 1698", "Rate": 0 },
    { "Name": "1796 - AA RAB (citi)", "Value": "-$6,273.66", "Type": "Cards", "Subtype": "Credit", "Bank": "Citicard", "Account": "5189 4101 2624 1796", "Rate": 0 },
    { "Name": "1961 - GAP Card", "Value": "$0.00", "Type": "Cards", "Subtype": "Credit", "Bank": "GAP", "Account": "4479 9413 1900 1961", "Rate": 0 },
    { "Name": "3299 - Target", "Value": "-$102.12", "Type": "Cards", "Subtype": "Credit", "Bank": "TD Bank", "Account": "5859 7520 6875 3299", "Rate": 0 },
    { "Name": "3333 - J Crew", "Value": "$0.00", "Type": "Cards", "Subtype": "Credit", "Bank": "Synchrony", "Account": "6097 6947 3349 2756", "Rate": 0 },
    { "Name": "3977 - Discover", "Value": "-$19.78", "Type": "Cards", "Subtype": "Credit", "Bank": "Discover", "Account": "6011 0013 2172 3977", "Rate": 0 },
    { "Name": "5780 - Macys amex", "Value": "$0.00", "Type": "Cards", "Subtype": "Credit", "Bank": "Department Stores National Bank", "Account": "3774 811602 45780", "Rate": 0 },
    { "Name": "7152 - Capital One (C1)", "Value": "-$28.96", "Type": "Cards", "Subtype": "Credit", "Bank": "CapOne (Capital One)", "Account": "5178 0573 0698 7152", "Rate": 0 },
    { "Name": "7475 - L.L.Bean", "Value": "-$33.55", "Type": "Cards", "Subtype": "Credit", "Bank": "Citicard", "Account": "5494 6001 2492 7475", "Rate": 0 },
    { "Name": "8000 - JGB JetBlue", "Value": "-$130.51", "Type": "Cards", "Subtype": "Credit", "Bank": "Barclays", "Account": "5378 1100 4732 8000", "Rate": 0 },
    { "Name": "8192 - West Elm (C1)", "Value": "$0.00", "Type": "Cards", "Subtype": "Credit", "Bank": "CapOne (Capital One)", "Account": "6004 3014 3634 8192", "Rate": 0 },
    { "Name": "8406 - AA JGB (citi)", "Value": "-$10,435.07", "Type": "Cards", "Subtype": "Credit", "Bank": "Citicard", "Account": "5189 4100 3067 8406", "Rate": 0 },
    { "Name": "9462 - Pottery Barn (C1)", "Value": "$0.00", "Type": "Cards", "Subtype": "Credit", "Bank": "CapOne (Capital One)", "Account": "6004 3015 1067 9462", "Rate": 0 },
    { "Name": "9932 - Banana Republic", "Value": "$0.00", "Type": "Cards", "Subtype": "Credit", "Bank": "Barclays", "Account": "5106 9001 0862 6071", "Rate": 0 },
    { "Name": "Health: Alight HMO  (RAB) - X1562", "Value": "$6,096.81", "Type": "Cards", "Subtype": "Health", "Bank": "UMB Bank", "Account": "5285 7300 0328 1562", "Rate": 0 },
    { "Name": "Healthy: Healthequity (JGB)  - X8023", "Value": "$0.00", "Type": "Cards", "Subtype": "Health", "Bank": "Bankcorp Bank", "Account": "4231 9052 3845 8023", "Rate": 0 },
    { "Name": "Health: Tufts PPO (RAB) - X4998", "Value": "$1,500.00", "Type": "Cards", "Subtype": "Health", "Bank": "Sutton Bank", "Account": "4143 6416 7030 4998", "Rate": 0 },
    { "Name": "Health: Tufts PPO (JGB) - X5930", "Value": "$1,500.00", "Type": "Cards", "Subtype": "Health", "Bank": "Sutton Bank", "Account": "4143 6416 7038 5930", "Rate": 0 }
  ]
}
$$::jsonb)) as xx(payload))
,b as (select payload->>'date_time' as date_time, jsonb_array_elements(payload->'Accounts') as account from a)
,c as (select payload->>'date_time' as date_time, jsonb_array_elements(payload->'Cards') as account from a)
,d as (select * from b union select * from c)
insert into history (date_time, payload)
select date_time, account from d;

with
 a as (select * from (values ($${
  "date_time": "20240803T115000-04",
  "Accounts": [
    { "Name": "Ally: Checking - X4634", "Value": "$1.82", "Type": "Cash Assets", "Subtype": "Checking", "Bank": "Ally", "Account": "1133204634", "Rate": 0 },
    { "Name": "Ally: Savings - X5337", "Value": "$79,201.90", "Type": "Cash Assets", "Subtype": "Savings", "Bank": "Ally", "Account": "2172505337", "Rate": 4.2 },
    { "Name": "Ally: 24-11-06 (5yr) - X7352", "Value": "$27,422.20", "Type": "Cash Assets", "Subtype": "CD", "Bank": "Ally", "Account": "3079417352", "Rate": 2.25, "Deposit": 2500, "Maturity": "2024-11-06", "Term": "5 year" },
    { "Name": "Ally: 24-08-17 (18mo) - X1841", "Value": "$21,066.27", "Type": "Cash Assets", "Subtype": "CD", "Bank": "Ally", "Account": "3096591841", "Rate": 5.05, "Deposit": 2000, "Maturity": "2024-08-17", "Term": "18 months" },
    { "Name": "Ally: 401K (RAB) - X4314", "Value": "$7,339.06", "Type": "Managed Funds", "Subtype": "401K IRA", "Bank": "Ally", "Account": "7047034314", "Rate": 0, "Maturity": "2026-05-26" },
    { "Name": "Bask: 25-07-14 (12mo) - X6436", "Value": "$50,106.13", "Type": "Cash Assets", "Subtype": "CD", "Bank": "Bask Bank", "Account": "7282216436", "Rate": 5.16, "Deposit": 2500, "Maturity": "2025-07-16", "Term": "1 year" },
    { "Name": "Bask: 26-07-13 (24mo) - X7367", "Value": "$60,114.51", "Type": "Cash Assets", "Subtype": "CD", "Bank": "Bask Bank", "Account": "8060447367", "Rate": 4.64, "Deposit": 2500, "Maturity": "2026-07-16", "Term": "2 year" },
    { "Name": "BMO: 29-07-27 (5yr) - X1509", "Value": "$25,070.75", "Type": "Cash Assets", "Subtype": "CD", "Bank": "BMO Alto", "Account": "349011361509", "Rate": 4.8, "Deposit": 2500, "Maturity": "2029-07-27", "Term": "5 year" },
    { "Name": "BMO: 27-07-27 (3yr) - X2892", "Value": "$60,118.41", "Type": "Cash Assets", "Subtype": "CD", "Bank": "BMO Alto", "Account": "349011392892", "Rate": 4.6, "Deposit": 6000, "Maturity": "2029-07-27", "Term": "3 year" },
    { "Name": "CapOne: Savings - X1185", "Value": "$33,688.14", "Type": "Cash Assets", "Subtype": "Savings", "Bank": "CapOne (Capital One)", "Account": "36281011185", "Rate": 4.5 },
    { "Name": "CapOne: Savings - X4596", "Value": "$0.00", "Type": "Cash Assets", "Subtype": "Savings", "Bank": "CapOne (Capital One)", "Account": "36043174596", "Rate": 0.8 },
    { "Name": "CapOne: 25-02-09 (12mo) - X1046", "Value": "$101,244.45", "Type": "Cash Assets", "Subtype": "CD", "Bank": "CapOne (Capital One)", "Account": "36281011046", "Rate": 5.1, "Deposit": 10000, "Maturity": "2025-02-09", "Term": "1 year" },
    { "Name": "CapOne: 26-03-05 (2yr) - X5024", "Value": "$66,277.88", "Type": "Cash Assets", "Subtype": "CD", "Bank": "CapOne (Capital One)", "Account": "36047455024", "Rate": 4.2, "Deposit": 64437.0, "Maturity": "2026-04-05", "Term": "2 year" },
    { "Name": "CapOne: 28-02-22 (5yr) - X1272", "Value": "$48,249.95", "Type": "Cash Assets", "Subtype": "CD", "Bank": "CapOne (Capital One)", "Account": "36045041272", "Rate": 4.1, "Deposit": 45588.2, "Maturity": "2028-02-22", "Term": "5 year" },
    { "Name": "Citi: Savings JGB - X6834", "Value": "$10.36", "Type": "Cash Assets", "Subtype": "Savings", "Bank": "Citicard", "Account": "174516834", "Rate": 0.0 },
    { "Name": "Discover: Savings - X0277", "Value": "$104,569.35", "Type": "Cash Assets", "Subtype": "Savings", "Bank": "Discover", "Account": "7032390277", "Rate": 4.25 },
    { "Name": "Easton: Checking - X2127", "Value": "$9,304.75", "Type": "Cash Assets", "Subtype": "Checking", "Bank": "Easton", "Account": "18432127", "Rate": 0 },
    { "Name": "Easton: 25-01-27 (9mo) - X8838", "Value": "$21,061.37", "Type": "Cash Assets", "Subtype": "CD", "Bank": "Easton", "Account": "330318838", "Rate": 4.75, "Deposit": 2062, "Maturity": "2025-01-27", "Term": "9 months" },
    { "Name": "Fidelity: Brokerage (Deferred Compensation) - X3296", "Value": "$97,520.29", "Type": "Cash Assets", "Subtype": "Deferred Compensation", "Bank": "Fidelity", "Account": "NONP: 93296", "Rate": 4.29 },
    { "Name": "Fidelity: Brokerage (Individual - TOD)  - X4009", "Value": "$115,968.83", "Type": "Cash Assets", "Subtype": "Brokerage", "Bank": "Fidelity", "Account": "39900000584654009", "Rate": 4.29, "Account Value": "$556,736.44", "Money Market": "$115,968.83", "Num Shares": 4309, "Price": 102.29 },
    { "Name": "Fidelity: Stock (Individual - TOD)  - X4009", "Value": "$440,767.61", "Type": "Managed Funds", "Subtype": "Stock", "Bank": "Fidelity", "Account": "39900000584654009", "Rate": 4.29, "Account Value": "$556,736.44", "Money Market": "$115,968.83", "Num Shares": 4309, "Price": 102.29 },
    { "Name": "Forbright: Savings - X9001", "Value": "$50,063.05", "Type": "Cash Assets", "Subtype": "Savings", "Bank": "Forbright", "Account": "48192269001", "Rate": 5.3 },
    { "Name": "Investor: Brokerage (TOD Joint w/Survivor NFS) - X0977", "Value": "$122,115.85", "Type": "Cash Assets", "Subtype": "Brokerage", "Bank": "Investor", "Account": "JAV030977", "Rate": 4.29 },
    { "Name": "Investor: 401K (JGB) SKG Blue Chip + Tactical ETF + NASDAQ Choice - X7403", "Value": "$999,452.73", "Type": "Managed Funds", "Subtype": "401K IRA", "Bank": "Investor", "Account": "ME8097403", "Rate": 0 },
    { "Name": "Investor: 401K (RAB) INDEX SUMMIT 6 PRO - X3899", "Value": "$960,342.66", "Type": "Managed Funds", "Subtype": "401K IRA", "Bank": "Investor", "Account": "4483673899", "Rate": 0 },
    { "Name": "Investor: 401K (JGB) Equitable Fin Life Co America - X8892", "Value": "$930,866.02", "Type": "Managed Funds", "Subtype": "401K IRA", "Bank": "Investor", "Account": "523438892", "Rate": 0 },
    { "Name": "Investor: 401K (RAB) SKG Blue Chip High Income Focus - X7402", "Value": "$459,867.89", "Type": "Managed Funds", "Subtype": "401K IRA", "Bank": "Investor", "Account": "ME8097402", "Rate": 0 },
    { "Name": "Investor: Roth (RAB) SKG Blue Chip + Tactical ETF + NASDAQ Choice - X7401", "Value": "$348,182.17", "Type": "Managed Funds", "Subtype": "Roth IRA", "Bank": "Investor", "Account": "ME8097401", "Rate": 0 },
    { "Name": "Investor: Roth (JGB) NFS - UMA Program - X9052", "Value": "$19,560.33", "Type": "Managed Funds", "Subtype": "Roth IRA", "Bank": "Investor", "Account": "MT3139052", "Rate": 0 },
    { "Name": "Investor: Annuity SecureFore 5YR Global Atlantic - X9036", "Value": "$518,945.28", "Type": "Managed Funds", "Subtype": "Investment", "Bank": "Investor", "Account": "A010049036", "Rate": 0 }
  ],
  "Cards": [
    { "Name": "1698 - Loft Mastercard", "Value": "$0.00", "Type": "Cards", "Subtype": "Credit", "Bank": "Comenity", "Account": "5466 7600 2683 1698", "Rate": 0 },
    { "Name": "1796 - AA RAB (citi)", "Value": "-$6,509.93", "Type": "Cards", "Subtype": "Credit", "Bank": "Citicard", "Account": "5189 4101 2624 1796", "Rate": 0 },
    { "Name": "1961 - GAP Card", "Value": "$0.00", "Type": "Cards", "Subtype": "Credit", "Bank": "GAP", "Account": "4479 9413 1900 1961", "Rate": 0 },
    { "Name": "3299 - Target", "Value": "-$102.12", "Type": "Cards", "Subtype": "Credit", "Bank": "TD Bank", "Account": "5859 7520 6875 3299", "Rate": 0 },
    { "Name": "3333 - J Crew", "Value": "$0.00", "Type": "Cards", "Subtype": "Credit", "Bank": "Synchrony", "Account": "6097 6947 3349 2756", "Rate": 0 },
    { "Name": "3977 - Discover", "Value": "-$378.86", "Type": "Cards", "Subtype": "Credit", "Bank": "Discover", "Account": "6011 0013 2172 3977", "Rate": 0 },
    { "Name": "5780 - Macys amex", "Value": "$0.00", "Type": "Cards", "Subtype": "Credit", "Bank": "Department Stores National Bank", "Account": "3774 811602 45780", "Rate": 0 },
    { "Name": "7152 - Capital One (C1)", "Value": "$0.00", "Type": "Cards", "Subtype": "Credit", "Bank": "CapOne (Capital One)", "Account": "5178 0573 0698 7152", "Rate": 0 },
    { "Name": "7475 - L.L.Bean", "Value": "-$43.55", "Type": "Cards", "Subtype": "Credit", "Bank": "Citicard", "Account": "5494 6001 2492 7475", "Rate": 0 },
    { "Name": "8000 - JGB JetBlue", "Value": "-$130.51", "Type": "Cards", "Subtype": "Credit", "Bank": "Barclays", "Account": "5378 1100 4732 8000", "Rate": 0 },
    { "Name": "8192 - West Elm (C1)", "Value": "$0.00", "Type": "Cards", "Subtype": "Credit", "Bank": "CapOne (Capital One)", "Account": "6004 3014 3634 8192", "Rate": 0 },
    { "Name": "8406 - AA JGB (citi)", "Value": "-$10,491.51", "Type": "Cards", "Subtype": "Credit", "Bank": "Citicard", "Account": "5189 4100 3067 8406", "Rate": 0 },
    { "Name": "9462 - Pottery Barn (C1)", "Value": "$0.00", "Type": "Cards", "Subtype": "Credit", "Bank": "CapOne (Capital One)", "Account": "6004 3015 1067 9462", "Rate": 0 },
    { "Name": "9932 - Banana Republic", "Value": "$0.00", "Type": "Cards", "Subtype": "Credit", "Bank": "Barclays", "Account": "5106 9001 0862 6071", "Rate": 0 },
    { "Name": "Health: Alight HMO  (RAB) - X1562", "Value": "$6,096.81", "Type": "Cards", "Subtype": "Health", "Bank": "UMB Bank", "Account": "5285 7300 0328 1562", "Rate": 0 },
    { "Name": "Healthy: Healthequity (JGB)  - X8023", "Value": "$0.00", "Type": "Cards", "Subtype": "Health", "Bank": "Bankcorp Bank", "Account": "4231 9052 3845 8023", "Rate": 0 },
    { "Name": "Health: Tufts PPO (RAB) - X4998", "Value": "$1,500.00", "Type": "Cards", "Subtype": "Health", "Bank": "Sutton Bank", "Account": "4143 6416 7030 4998", "Rate": 0 },
    { "Name": "Health: Tufts PPO (JGB) - X5930", "Value": "$1,500.00", "Type": "Cards", "Subtype": "Health", "Bank": "Sutton Bank", "Account": "4143 6416 7038 5930", "Rate": 0 }
  ]
}
$$::jsonb)) as xx(payload))
,b as (select payload->>'date_time' as date_time, jsonb_array_elements(payload->'Accounts') as account from a)
,c as (select payload->>'date_time' as date_time, jsonb_array_elements(payload->'Cards') as account from a)
,d as (select * from b union select * from c)
insert into history (date_time, payload)
select date_time, account from d;