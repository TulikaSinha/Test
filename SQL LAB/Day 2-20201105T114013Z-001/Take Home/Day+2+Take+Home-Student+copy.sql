# Use bank_inventory, cricket_1 and cricket_2 tables from Online_Day1_InClass and Online_Day2_InClass to solve the queries.
use bank;
select * from cricket_1;
select * from cricket_2;
select * from bank_inventory;
# # Question 1:
# Q1.Write MySQL query to find highest priced product
select Product,max(Price) from bank_inventory;
# Question 2:

# Q2.Write MySQL query to find third lowest run scorer.

select Player_Id,Runs 
from cricket_1
order by Runs
LIMIT 3;

# Question 3:
# Q3. Write MySQL query to find player_ID and Player_name which contains “D”.

select player_ID,Player_name from cricket_1 where Player_name like '%d%';

# Question 4:

# Q4.Write MySQL query to extract Player_Name whose name is having second character as 'R'

select Player_name from cricket_2 where Player_name like '_r%';

# Question 5:

# Q5.Write MySQL query to extract Player_Name whose name whose popularity is grater than 10 or charisma is greater than 50
# from tables cricket_1 and cricket_2 using set operator

select Player_Name
from cricket_1
where Popularity > 10
union
select Player_Name
from cricket_2
where Charisma > 50;

/* Prerequisites */
-- Use the bank_inventory table from Online_Day1_Inclass file to answer the below questions
# Question 6:
# 6) Display the Geo_locations in capital letters from the table Bank_Holiday.
select upper(Geo_location) from Bank_inventory;
# Question 7:
# 7) Display the position of occurance of the string ‘City’ in the column  Geo_location from the table Bank_Inventory.
select position('City' in Geo_location) from Bank_Inventory;
# Question 8:
# 8) Display the column Quantity from the table Bank_Inventory by applying the below formatting: 
-- a) convert the data type from numeric to character 
select CONVERT(Quantity,CHAR) from Bank_Inventory;
-- b) Pad the column with 0's  
select LPAD(Quantity,6,0) from Bank_Inventory;
# To answer 9th question there are few prerquisites to be followed
# PRE - REQUISITE:
Insert into bank_Inventory values ( 'MaxGain',    6 , 220.39, 4690.67, 4890 , 'Riverdale-village' ) ;
Insert into bank_Inventory values ( 'SuperSave', 7 , 290.30, NULL, 3200.13 ,'Victoria-Town') ;


# Question 9:
# 9) Display the column Geo_location by replacing the underscores with spaces (" ").
select replace(Geo_location,'-',' ') from bank_Inventory;
-- Use the cricket2 table to answer the below questions

# Question 10:

# Q10. Display the columns Player_Name, charisma and Runs by combining into a single comma seperated output. (Name the column as : 'Details')
select concat(Player_Name,',',charisma,',',Runs) as Details from cricket_2;