# Question 1:
# 1) Create a Database Bank.

create database Bank;
use Bank;

# Question 2:
# 2) Create a table with the name “Bank_Inventory” with the following columns
-- Product  with string data type and size 10 --
-- Quantity with numerical data type --
-- Price with data type that can handle all real numbers
-- purcahase_cost with data type which always shows two decimal values --
-- estimated_sale_price with data type float --

create table Bank_Inventory
(
Product varchar(10),
Quantity int,
Price real,
purcahase_cost decimal(5,2),
estimated_sale_price float
);

ALTER TABLE Bank_Inventory
MODIFY COLUMN purcahase_cost decimal(9,2);

# Question 3:
# 3) Display all column names and their datatype and size in Bank_Inventory.
desc Bank_Inventory;
# Question 4:
# 4) Insert the below two records into Bank_Inventory table .
-- 1st record with values --
			-- Product : PayCard
			-- Quantity: 2 
			-- price : 300.45 
			-- Puchase_cost : 8000.87
			-- estimated_sale_price: 9000.56 --
-- 2nd record with values --
			-- Product : PayPoints
			-- Quantity: 4
			-- price : 200.89 
			-- Puchase_cost : 7000.67
			-- estimated_sale_price: 6700.56
            
insert into Bank_Inventory(Product,Quantity,Price,purcahase_cost,estimated_sale_price) values('PayCard',2,300.45,8000.87,9000.56);
insert into Bank_Inventory(Product,Quantity,Price,purcahase_cost,estimated_sale_price) values('PayPoints',4,200.89,7000.67,6700.56);

select * from Bank_Inventory;

# Question 5:
# 5) Add a column : Geo_Location to the existing Bank_Inventory table with data type varchar and size 20 .

ALTER TABLE Bank_Inventory
ADD Geo_Location varchar(20);
desc Bank_Inventory;

# Question 6:
# 6) What is the value of Geo_Location for product : ‘PayCard’?
select Geo_Location from Bank_Inventory where Product='PayCard';
# Question 7:
# 7) How many characters does the  Product : ‘PayCard’ store in the Bank_Inventory table.
select length(Product) from Bank_Inventory where Product='PayCard';
# Question 8:
# a) Update the Geo_Location field from NULL to ‘Delhi-City’ 
UPDATE Bank_Inventory
SET Geo_Location='Delhi-City';

select * from Bank_Inventory;

# b) How many characters does the  Geo_Location field value ‘Delhi-City’ stores in the Bank_Inventory table
select length(Geo_Location) from Bank_Inventory where Geo_Location='Delhi-City';
# Question 9:
# 9) update the Product field from CHAR to VARCHAR size 10 in Bank_Inventory 
alter table Bank_Inventory modify Product varchar(10);
# Question 10:
# 10) Reduce the size of the Product field from 10 to 6 and check if it is possible. 

alter table Bank_Inventory modify Product varchar(6); 
#Product field in any data size can not be decreased

# Question 11:
# 11) Bank_inventory table consists of ‘PayCard’ product details .
-- For ‘PayCard’ product, Update the quantity from 2 to 10 
 
UPDATE Bank_Inventory
SET Quantity=10
where Product='PayCard';

select * from Bank_Inventory;
 # Question 12:
# 12) Create a table named as Bank_Holidays with below fields 
-- a) Holiday field which displays or accepts only date 
-- b) Start_time field which also displays or accepts date and time both.  
-- c) End_time field which also displays or accepts date and time along with the timezone also. 

create table Bank_Holidays
(
Holiday date,
Start_time datetime,
End_time timestamp
);

 # Question 13:
# 13) Step 1: Insert today’s date details in all fields of Bank_Holidays 

insert into Bank_Holidays(Holiday,Start_time,End_time) values(curdate(),curdate(),curdate());
select * from Bank_Holidays;

-- Step 2: After step1, perform the below 
-- Postpone Holiday to next day by updating the Holiday field 

update Bank_Holidays set Holiday= ADDDATE(curdate(), 1);

# Question 14:
# 14) Modify  the Start_time data with today's datetime in the Bank_Holidays table 

update Bank_Holidays
set Start_time= NOW();

# Question 15:
# 15) Update the End_time with UTC time(GMT Time) in the Bank_Holidays table. 

update Bank_Holidays
set End_time= utc_timestamp();

# Question 16:
# 16) Select all columns from Bank_Inventory without mentioning any column name

select * from Bank_Inventory;

# Question 17:
# 17)  Display output of PRODUCT field as NEW_PRODUCT in  Bank_Inventory table 
select Product as NEW_PRODUCT from Bank_Inventory;
# Question 18:
# 18)  Display only one record from bank_Inventory 
select * from Bank_Inventory LIMIT 0,1;
# Question 19:
# 19) Modify  the End_time data with today's datetime in the Bank_Holidays table 
update Bank_Holidays
set End_time= current_timestamp();
select * from Bank_Holidays;
# Question 20:
# 20) Display the first five rowss of the Geo_location field of Bank_Inventory.
select Geo_location from Bank_Inventory LIMIT 0,5;