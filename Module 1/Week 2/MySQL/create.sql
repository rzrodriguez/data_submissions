USE lab_mysql;
SHOW TABLES;

CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1),
birth DATE, death DATE);

SHOW TABLES;

DESCRIBE pet;
