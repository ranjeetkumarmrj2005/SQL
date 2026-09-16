CREATE database temp;
USE temp;
CREATE TABLE Customer(
	id integer PRIMARY KEY,
	cname varchar(255),
    address varchar(255),
    gender char(2),
	city varchar(255),
    pincode integer
);
INSERT INTO Customer VALUES 
   (1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
   (1300, 'Shayam Singh', 'Ludhiana H.O', 'M', 'Ludhiana', 141001),
   (245, 'Neelabh Shah', 'Ashok Nagar', 'M', 'Jalandhar', 144003),
   (210, 'Barkha Singh', 'Dilbagh Nagar', 'F', 'Jalandhar', 144002),
   (500, 'Rohan Aroa H.O', 'Ludhiana', 'F', 'Ludhiana', 141001);
   
   INSERT INTO Customer VALUES 
   (1252, 'Ram Kumar3', 'Dilbagh Nagar', 'M', 'Jalandhar', NULL);
   
SELECT * from Customer;

CREATE TABLE Order_details (
    order_id integer primary key,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES Customer(id)
);

create table account(
	id int primary key,
    name varchar(255) unique,
    balance int,
    constraint acc_balance_chk check(balance>1000)
);
insert into account(id,name,balance) values
(1,'A',10000);
insert into account(id,name,balance) values
(2,'B',2000);
select * from account;
delete from account where id =1;
