create database mar21;

use mar21;
use hr;

create table Person
(
pid int primary key auto_increment,
name varchar(20)
);

insert into Person(name) values('Tulika');

select * from Person;

select substr('123456789',instr('abcabcabc','b'),4) as EMP;

select employee_id,first_name,last_name,email,phone_number,e.job_id,j.job_title
from employees e
join jobs j
on e.job_id=j.job_id;

select employee_id,first_name,last_name,e.job_id,e.department_id,j.job_title,d.department_name
from employees e
join departments d
on e.department_id=d.department_id
join jobs j
on e.job_id=j.job_id;

select first_name,last_name,e.department_id,l.city
from employees e
join departments d
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id
where city='Seattle';

#WAQ to display the names of the departments and the 
#count of employees working in them.

select d.department_name,count(e.employee_id)
from employees e
join departments d
on e.department_id=d.department_id
group by d.department_name;

#WAQ to display the names of the departments, job titles and the 
#average salary drawn by each of the category.
#Also filter such jobs which have an average of more than 5000$ per month.

select d.department_name,j.job_title,avg(e.salary)
from employees e
join departments d
on e.department_id=d.department_id
join jobs j
on j.job_id=e.job_id
group by d.department_name
having avg(e.salary) > 5000;


#WAQ to list all the available departments in the company along with
#head count in them.

select d.department_name,count(e.employee_id)
from employees e
left join departments d
on e.department_id=d.department_id
group by d.department_name;

select e.employee_id,concat(e.first_name,' ',e.last_name) as employee_name,concat(m.first_name,' ',m.last_name) as manager_name
from employees e
join employees m
on e.employee_id=m.manager_id
group by concat(m.first_name,' ',m.last_name); 

#Q5.  WAQ to calculate the minimum and the maximum salary drawn by employees 
# who are working in seattle.

select min(e.salary),max(e.salary),l.city
from employees e
join departments d
on d.department_id=e.department_id
join locations l
on d.location_id=l.location_id
where l.city like '%Seattle%';

#Q6. WAQ to get the total count of departments located in each city.
# sort the results with the city with highest number of departments first.

select l.city,count(d.department_id) as total_count
from departments d
join locations l
on d.location_id=l.location_id
group by l.city;






