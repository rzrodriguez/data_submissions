CREATE DATABASE proj4;

USE proj4;

SELECT COUNT(*) FROM trans;

SELECT * FROM district LIMIT 10;

#Setting primary keys

ALTER TABLE `proj4`.`account` 
CHANGE COLUMN `account_id` `account_id` INT(11) NOT NULL ,
ADD PRIMARY KEY (`account_id`);

ALTER TABLE `proj4`.`card` 
CHANGE COLUMN `card_id` `card_id` INT(11) NOT NULL ,
ADD PRIMARY KEY (`card_id`);

ALTER TABLE `proj4`.`client` 
CHANGE COLUMN `client_id` `client_id` INT(11) NOT NULL ,
ADD PRIMARY KEY (`client_id`);

ALTER TABLE `proj4`.`disp` 
CHANGE COLUMN `disp_id` `disp_id` INT(11) NOT NULL ,
ADD PRIMARY KEY (`disp_id`);

ALTER TABLE `proj4`.`district` 
CHANGE COLUMN `A1` `A1` INT(11) NOT NULL ,
ADD PRIMARY KEY (`A1`);

ALTER TABLE `proj4`.`loan` 
CHANGE COLUMN `loan_id` `loan_id` INT(11) NOT NULL ,
ADD PRIMARY KEY (`loan_id`);

ALTER TABLE `proj4`.`order` 
CHANGE COLUMN `order_id` `order_id` INT(11) NOT NULL ,
ADD PRIMARY KEY (`order_id`);

ALTER TABLE `proj4`.`trans` 
CHANGE COLUMN `trans_id` `trans_id` INT(11) PRIMARY KEY;

#Fixing tables names
ALTER TABLE proj4.order 
RENAME TO  proj4.orders;

ALTER TABLE proj4.trans 
RENAME TO  proj4.transactions;

#Fixing columns name from district to english

ALTER TABLE district RENAME COLUMN A1 TO district_id;

ALTER TABLE district RENAME COLUMN A2 TO district_name;

ALTER TABLE district RENAME COLUMN A3 TO district_region;

ALTER TABLE district RENAME COLUMN A4 TO no_inhabitants;

ALTER TABLE district RENAME COLUMN A5 TO no_inhabitants499;

ALTER TABLE district RENAME COLUMN A6 TO no_inhabitants1999;

ALTER TABLE district RENAME COLUMN A7 TO no_inhabitants9999;

ALTER TABLE district RENAME COLUMN A8 TO no_inhabitants10000;

ALTER TABLE district RENAME COLUMN A9 TO no_cities;

ALTER TABLE district RENAME COLUMN A10 TO ratio_urban_inhabitants;

ALTER TABLE district RENAME COLUMN A11 TO avg_salary;

ALTER TABLE district RENAME COLUMN A12 TO unemployment_rate95;

ALTER TABLE district RENAME COLUMN A13 TO unemployment_rate96;

ALTER TABLE district RENAME COLUMN A14 TO rate_entrepreneurs;

ALTER TABLE district RENAME COLUMN A15 TO no_crimes95;

ALTER TABLE district RENAME COLUMN A16 TO no_crimes96;
​

#Fixing account strings to english
SET SQL_SAFE_UPDATES = 0;
UPDATE account
SET frequency =
CASE
 WHEN frequency = 'POPLATEK MESICNE' THEN 'monthly issuance'
 WHEN frequency = 'POPLATEK TYDNE' THEN 'weekly issuance'
 WHEN frequency = 'POPLATEK PO OBRATU' THEN 'issuance after transaction'
END;

#Fixing order strings to english
UPDATE orders
SET k_symbol =
CASE
 WHEN k_symbol = 'POJISTNE' THEN 'insurrance payment'
 WHEN k_symbol = 'SIPO' THEN 'household payment'
 WHEN k_symbol = 'LEASING' THEN 'leasing'
 wHEN k_symbol = 'UVER' THEN 'loan payment'
END;

#Fixing trans strings to english
UPDATE transactions
SET transac_type =
CASE
 WHEN transac_type = 'PRIJEM' THEN 'credit'
 WHEN transac_type = 'VYDAJ' THEN 'withdrawal'
END;

UPDATE transactions
SET operation =
CASE
 WHEN operation = 'VYBER KARTOU' THEN 'credit card withdrawal'
 WHEN operation = 'VKLAD' THEN 'credit in cash'
 WHEN operation = 'PREVOD Z UCTU' THEN 'collection from another bank'
 WHEN operation = 'VYBER' THEN 'withdrawal in cash'
 WHEN operation = 'PREVOD NA UCET' THEN 'remittance to another bank'
END;

UPDATE transactions
SET k_symbol =
CASE
 WHEN k_symbol = 'POJISTNE' THEN 'insurrance payment'
 WHEN k_symbol = 'SLUZBY' THEN 'payment for statement'
 WHEN k_symbol = 'UROK' THEN 'interest credited'
 WHEN k_symbol = 'SANKC. UROK' THEN 'sanction interest if negative balance'
 WHEN k_symbol = 'SIPO' THEN 'household'
 WHEN k_symbol = 'DUCHOD' THEN 'old­age pension'
 WHEN k_symbol = 'UVER' THEN 'loan payment'
END;

#Fixing dates
ALTER TABLE card 
ADD COLUMN issue_date date;

UPDATE card
SET issue_date = date(insert(insert(CONCAT('19',LEFT(issued,6)),5,0,'-'),8,0,'-'));

ALTER TABLE card DROP COLUMN issued;

-- Fixing date of account table
ALTER TABLE account
ADD COLUMN account_date date;

UPDATE account
SET account_date = date(insert(insert(CONCAT('19',LEFT(date,6)),5,0,'-'),8,0,'-'));

ALTER TABLE account DROP COLUMN date;

ALTER TABLE client
ADD COLUMN gender char(1);

UPDATE client
SET gender = if((right(left(birth_number,4),2))-50 < 1, 'M', 'F');

UPDATE client
SET birth_number = if((right(left(birth_number,4),2))-50 < 1, birth_number, birth_number-5000);

ALTER TABLE loan
ADD COLUMN date_loan date;

UPDATE loan
SET date_loan = date(insert(insert(CONCAT('19',LEFT(date,6)),5,0,'-'),8,0,'-'));

ALTER TABLE loan DROP COLUMN date;

ALTER TABLE transactions
ADD COLUMN date_trans date;

UPDATE transactions
SET date_trans = date(insert(insert(CONCAT('19',LEFT(date,6)),5,0,'-'),8,0,'-'));

ALTER TABLE transactions DROP COLUMN date;

