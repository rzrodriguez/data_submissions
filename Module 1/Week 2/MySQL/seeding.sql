USE lab_mysql;

CREATE TABLE cars (car_id VARCHAR(20), VIN VARCHAR(20), Manufacturer VARCHAR(20), Model VARCHAR(20), Caryear INT, Color VARCHAR(20));

 CREATE TABLE customers (customer_id VARCHAR(20), Name VARCHAR(20), Phone VARCHAR(20), Email VARCHAR(20), Address VARCHAR(20), City VARCHAR(20), State/Province VARCHAR(20), 
 Country VARCHAR(20), Postal VARCHAR(20));
 
 CREATE TABLE Salesperson (staff_id VARCHAR(20), Employee VARCHAR(20), Store VARCHAR(20));
 
 CREATE TABLE Invoices (invoice_id VARCHAR(20), Sale_date DATE, car_id VARCHAR(20), customer_id VARCHAR(20), staff_id VARCHAR(20));
 
 