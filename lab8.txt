CREATE DATABASE lab8_1;


CREATE INDEX first0 ON countries(name) WHERE name = "string";
CREATE INDEX first1 ON employees(name,surname) WHERE name = "string" AND surname = "string";
CREATE INDEX first2 ON employees(salary,value1,value2) WHERE salary < value1 AND salary>value2;
CREATE INDEX first3 ON employees(name) WHERE name = (SELECT name from employees LIMIT 4);
CREATE INDEX first4 ON employees(department_id,salary,value2) WHERE salary < value2;
CREATE INDEX first5 ON departments(department_id,budget,value2) WHERE budget < value2;

CREATE TABLE salesman(
  salesman_id int PRIMARY KEY ,
  name varchar(255) NOT NULL,
  city varchar(255),
  commission float
);
DROP TABLE salesman;

CREATE TABLE customers(
  customer_id int primary key ,
  cust_name varchar(255) NOT NULL,
  city varchar(255),
  grade int,
  salesman_id int REFERENCES salesman(salesman_id)
);
DROP table customers;
CREATE TABLE orders(
  ord_no int,
  purch_amt float,
  ord_date varchar(255),
  customer_id int references customers(customer_id),
  salesman_id int references salesman(salesman_id)
);

CREATE ROLE "junior_dev" LOGIN;
CREATE VIEW task4 AS SELECT * FROM salesman WHERE city = 'New York';
CREATE VIEW task5 AS (SELECT E.name, E.city,E.commission,C.customer_id,C.cust_name,C.grade FROM salesman E CROSS JOIN customers C on E.salesman_id = C.salesman_id);
GRANT ALL PRIVILEGES ON task5 TO junior_dev;

CREATE VIEW task6 AS SELECT * FROM customers WHERE grade = (SELECT max(grade) FROM customers);
CREATE VIEW task7 AS SELECT count(salesman_id) FROM salesman GROUP BY city;
CREATE VIEW task8 AS SELECT * FROM salesman Group By salesman_id HAVING count(salesman_id)>1;
CREATE ROLE "intern";
GRANT junior_dev TO intern WITH ADMIN OPTION;