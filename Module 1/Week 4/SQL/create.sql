CREATE DATABASE IF NOT EXISTS lab_mysql;

CREATE TABLE lab_mysql.Cars
(
	ID INT NOT NULL PRIMARY KEY,
   VIN VARCHAR(50),
   Manufacturer VARCHAR(50),
   Model VARCHAR(50),
   Year_Factor INT(4),
   Color VARCHAR(50)
);

CREATE TABLE lab_mysql.Customers
(
	ID INT NOT NULL,
   Customer_ID varchar(17) PRIMARY KEY,
   Cust_name varchar(50),
   Phone VARCHAR(20),
   Email varchar(30),
   Address varchar(50),
   City varchar(20),
   State_Province varchar(15),
   Country varchar(20),
   Postal int(20)
);

CREATE TABLE lab_mysql.Salespersons
(
    ID INT NOT NULL PRIMARY KEY,
   Staff_ID int(5),
   Sale_name varchar(50),
   Store VARCHAR(20)
   );

   CREATE TABLE lab_mysql.Invoices
(
    ID INT NOT NULL PRIMARY KEY,
   Invoice_number int(10),
   Invoice_date date,
   Car int(3),
   Customer int(6),
   Sales_person int(6)
);