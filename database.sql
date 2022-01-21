--creates database 

CREATE DATABASE CarDealership


--creates dealership table

CREATE TABLE dealership (
dealership_id INTEGER PRIMARY KEY,
dealership_location VARCHAR(30),
dealership_manager INTEGER
);


--creates sales table

CREATE TABLE sale(
receipt_number INTEGER PRIMARY KEY,
dealership_id INTEGER,
employee_id INTEGER,
customer_id INTEGER,
profit INTEGER
);


--creates employees table

CREATE TABLE employee(
employee_id INTEGER PRIMARY KEY,
dealership_id INTEGER,
salary INTEGER,
first_name VARCHAR(30),
last_name VARCHAR(30)
);




--creates car table

CREATE TABLE car(
	license_plate_number VARCHAR(30) PRIMARY KEY,
	dealership_id INTEGER,
	car_model VARCHAR(30),
	car_year INTEGER,
	car_color VARCHAR(30)
);


--creates customer table

CREATE TABLE customer(
	customer_id INTEGER PRIMARY KEY,
	first_name VARCHAR(30),
last_name VARCHAR(30),
sex VARCHAR(30)
);


--inserts data for dealership table

INSERT INTO dealership (dealership_id, dealership_location, dealership_manager) VALUES
(1, 'Queens', 10),
(2, 'Brooklyn', 20),
(3, 'Manhattan', 30),
(4, 'Bronx', 40);



--inserts data for sales table

INSERT INTO sales (receipt_number, dealership_id, employee_id, customer_id, profit) VALUES
(123, 1, 1111, 500, 3000),
(456, 2, 2222, 550, 3001),
(789, 4, 3333, 600, 3002),
(101112, 3, 4444, 650, 3003);




--inserts data for employees table

INSERT INTO employee (employee_id, dealership_id, salary, first_name, last_name) VALUES
(1111, 1, 20000, 'Brian', 'Glaws'),
(2222, 2, 35000, 'Mohammed', 'Alam'),
(3333, 3, 40000, 'Shakhram', 'Gafurov'),
(4444, 4, 50000, 'Zelda', 'Shwarzberg');


--insert date for car table

INSERT INTO car (license_plate_number, dealership_id, car_model, car_year, car_color) VALUES
('VXS12AQ', 1, 'Civic', 2010, 'Black'),
('ZXJ16RQ', 3, 'Accord', 2015, 'White'),
('VGS17AW', 2, 'Camry', 2004, 'Blue'),
('QGS87W', 4, 'Corolla', 2000, 'Red');


--insert date for customer table 

INSERT INTO customer (customer_id, first_name, last_name, sex) VALUES
(5555, 'ariel', 'avshalom', 'm'),
(6666, 'Tenzin', 'Jamyang', 'm'),
(7777, 'Ariel', 'Benzur', 'm'),
(8888, 'Yasmine', 'Kamel', 'f');


--inner join on customer and employees

SELECT * FROM customer
	INNER JOIN employee b ON a.customer_id=b.customer_id;


--inner join on customer, employees and car

SELECT * FROM customer
	INNER JOIN employees b ON a.customer_id=b.customer_id
	INNER JOIN car c ON a.customer_id=c.customer_id;
--inner join on customer, employees, car and dealership

SELECT * FROM customer
	INNER JOIN employees b ON a.customer_id=b.customer_id
	INNER JOIN car c ON a.customer_id=c.customer_id
	INNER JOIN dealership d ON a.customer_id=d.customer_id;
