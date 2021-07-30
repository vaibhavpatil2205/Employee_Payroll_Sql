#uc1 Created database payroll_service

create database payroll_service;
show databases;
use payroll_service;

#uc2 Created table employee_payroll for database

create table employee_payroll(
id int unsigned not null auto_increment,
name varchar(150) not null ,
salary double not null,
start date not null,
primary key (id)
);

#uc3 Inserting values into table

insert into employee_payroll (name,salary,start) values
('vaibhav','10000.0','2021-02-03'),
('sunny','20000.0','2021-03-05'),
('sagar','30000.0','2021-04-05');


#uc4 Displayed all table information

select * from employee_payroll;

#uc5 Ability to retrieve salary data for a particular employee as well as all employees who have joined in a particular data range from the payroll service database

select * from employee_payroll where name='Vaibhav';
select * from employee_payroll where start BETWEEN CAST('2021-02-06' AS DATE) AND DATE(NOW());

#uc6 add Gender to Employee Payroll Table and Update the Rows to reflect the correct Employee Gender

alter table employee_payroll add gender char(1);
update  employee_payroll set gender='M' where name ='Vaibhav';

#uc7 find sum, average, min, max and number of male and female employees

select salary from employee_payroll;
select sum(salary) from employee_payroll;  
select min(salary) from employee_payroll;  
select max(salary) from employee_payroll;  
select count(salary) from employee_payroll;  
select avg(salary) from employee_payroll;  
select sum(salary) from employee_payroll where
	gender='M' group by gender;
    
#uc8  To extend employee_payroll data to store employee informationlike employee phone, address and department - Ensure employee department

alter table employee_payroll add phone varchar(15) ,add address varchar(30) default 'address1',add department varchar(20) not null;
UPDATE employee_payroll 
SET 
    department = 'sales'
WHERE
    name IN ('vaibhav' , 'sunny');
SELECT 
    *
FROM
    employee_payroll;    
    
    
#uc9
#Ability to extend employee_payroll table to have Basic Pay,Deductions, Taxable Pay,Income Tax, Net Pay

alter table employee_payroll 
add basic_pay int, 
add deductions int,
add taxable_pay int  ,
add tax int,
add net_pay int;

delete from employee_payroll where id in (1,2,3,4,5,6);


#Uc10
insert into employee_payroll (name,department,gender,basic_pay,deductions,taxable_pay,tax,net_pay,start,salary) values
	('Terissa','Marketing','F',4000000,1000000,2000000,500000,1100000,'2021-07-08',85000);
    
insert into employee_payroll (name,department,gender,basic_pay
,deductions,taxable_pay,tax,net_pay,start,salary) values
	('Terissa','Sales','F',4000000,
    0,0,0,0,'2021-06-01',80000);
    

CREATE TABLE department (
    did INT not null auto_increment,
    dname VARCHAR(30) NOT NULL,
    PRIMARY KEY (did)
);
insert into department (dname) values
	('sales');
insert into department (dname) values
	('marketing');
select * from  department;
    
drop table employee_payroll;
 
CREATE TABLE emp_department(
    dept_id int not null ,
    emp_id int NOT NULL,
    foreign key (emp_id) references employee_payroll(id),
	foreign key (dept_id) references department(did),
    primary key(dept_id,emp_id)
);

create table payroll(
payroll_id int primary key not null auto_increment,
basic_pay int,
deductions int,
taxable_pay int,
tax int,
net_pay int,
emp_id int,
foreign key (emp_id)  references employee_payroll(id)
);    