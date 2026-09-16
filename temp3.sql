CREATE database temp3;
USE temp3;
CREATE TABLE Customer(
	id integer PRIMARY KEY,
	cname varchar(255),
    address varchar(255),
    gender char(2),
	city varchar(255),
    pincode integer
);
INSERT INTO Customer(id,cname,address,gender,city,pincode) VALUE
(122,'Ram','Dilbagh Nagar','M','Jalandhar',344);

SELECT * FROM Customer;
INSERT INTO Customer VALUES 
   (1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
   (1300, 'Shayam Singh', 'Ludhiana H.O', 'M', 'Ludhiana', 141001),
   (245, 'Neelabh Shah', 'Ashok Nagar', 'M', 'Jalandhar', 144003),
   (210, 'Barkha Singh', 'Dilbagh Nagar', 'F', 'Jalandhar', 144002),
   (500, 'Rohan Aroa H.O', 'Ludhiana', 'F', 'Ludhiana', 141001);
   
   REPLACE INTO Customer (id,City) VALUE
	(1251,'Colony');
	REPLACE INTO Customer (id,City) VALUE
	(1250,'Gorakhput');
REPLACE INTO Customer SET id=1400,cname ='Mac',City ='Utah';
REPLACE INTO Customer (id,cname,City) SELECT id,cname,City FROM Customer WHERE id=500;
INSERT INTO Customer(id,cname) VALUE
(121,'Bob');
   INSERT INTO Customer VALUES 
   (1252, 'Ram Kumar3', 'Dilbagh Nagar', 'M', 'Jalandhar', NULL);

UPDATE Customer SET Address='Mumbai',Gender='M' WHERE id = 121;
SET SQL_SAFE_UPDATES=1;

UPDATE Customer SET Pincode=1000;
UPDATE Customer SET Pincode=Pincode+1;
UPDATE Customer SET Pincode =110000 WHERE id IN (122,1251,1300,245,210,500,121,1252);

SELECT * FROM Customer;
DELETE FROM Customer WHERE id=121;
DELETE FROM Customer;

   
