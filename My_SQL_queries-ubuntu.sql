create database practise;
-- use statement is ussed to activate database 
use practise;
-- create table and assign column name and data type 


-- https://www.w3resource.com/mysql-exercises/create-table-exercises/



create table countries(country_id int, country_name varchar(50), region_id int);

-- change or alter table 
alter table countries change region_id region_id varchar(50);

-- show data type of columns of table
select data_type from information_schema.columns where table_schema = 'practise' and table_name = 'countries';

-- insert data inside table
insert into countries values(1,'India',"Asia");
insert into countries values(2,'China',"Asia");
insert into countries values(3,'Russia',"Asia");
insert into countries values(4,'Japan',"Asia");

-- display data inside table
select * from countries;

-- write sql statement to create structure of table dup_cuntries similar to countries
create table if not exists dup_countries  like countries;


-- write sql statement to create structure of table dup_cuntries similar to countries
create table if not exists dup_countries_01  like countries;
select * from dup_countries_01;



-- write sql statement to copy table with data.
create table if not exists dup_countries_02  As select * from countries;
select * from dup_countries_02;

-- show tables;
select * from dup_countries;

-- Dissplay No. of tables inside particular database
show tables;


-- 
create table jobs (job_id int, job_title varchar(50), main_salary int, max_salary int );
select * from jobs;

alter table jobs change job_id job_id varchar(50) not null;
alter table jobs change min_salary min_salary decimal(6,0) not null;
alter table jobs change max_salary max_salary decimal(6,0) not null;

describe jobs;

create table jobs_01 (job_id int, job_title varchar(50), main_salary int, max_salary int check(max_salary<=25000));
select * from jobs_01;


-- >> 07 Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy,
-- India and China will be entered in the table.


create table if not exists countries_03( country_id int,country_name varchar(50) check (country_name in ('Italy','India','China')), region_name varchar(20));
describe countries_03;


-- >> 08 Write a SQL statement to create a table named job_histry including columns employee_id, start_date, end_date, job_id and department_id and make sure that the value against
-- column end_date will be entered at the time of insertion to the format like '--/--/----'.

create table if not exists job_history_04 ( employee_id int not null, start_date date not null, 
end_date date not null check( end_date like '--/--/----'), jon_id int not null, department_id decimal(4,2) not null );
describe job_history_04;


-- >> 09 Write a SQL statement to create a table named countries including columns country_id,country_name and region_id and 
-- make sure that no duplicate data against column country_id will be allowed at the time of insertion.

CREATE TABLE IF NOT EXISTS countries_05 ( 
COUNTRY_ID  varchar(2) NOT NULL,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID decimal(10,0) NOT NULL,
UNIQUE(COUNTRY_ID)
);

-- this is alternate way of creating unique column
CREATE TABLE IF NOT EXISTS countries_06 ( 
COUNTRY_ID varchar(2) NOT NULL unique,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID decimal(10,0) NOT NULL
);

-- >> 10 Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, 
-- and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered
-- automatically at the time of insertion if no value assigned for the specified columns.

create table jobs_05 (
job_id int, 
job_title varchar(50),
 main_salary int default 8000,
 max_salary int default null
 );
 

 insert into jobs_05 (job_id , job_title, main_salary, max_salary) values (23,'Design Engineer', 10000,32909);
 insert into jobs_05 (job_id , job_title,max_salary ) values (24,'Design Engineer', 32909);
 insert into jobs_05 (job_id , job_title, main_salary) values (23,'Design Engineer', 10000);
 -- desc jobs_05;  
 select * from jobs_05;
 
 
 -- >> 11 Write a SQL statement to create a table named countries including columns country_id, country_name and 
 -- region_id and make sure that the country_id column will be a key field which will not contain any duplicate 
 -- data at the time of insertion.
 

CREATE TABLE IF NOT EXISTS countries_07 ( 
COUNTRY_ID varchar(2) NOT NULL UNIQUE PRIMARY KEY,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID decimal(10,0) NOT NULL
);

-- >> 12  Write a SQL statement to create a table countries including columns country_id, country_name and region_id
--  and make sure that the column country_id will be unique and store an auto incremented value.

CREATE TABLE IF NOT EXISTS countries_08 ( 
COUNTRY_ID int NOT NULL auto_increment UNIQUE ,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID decimal(10,0) NOT NULL
);
desc countries_08;

-- >> 13 Write a SQL statement to create a table countries including columns country_id, country_name and region_id and 
-- make sure that the combination of columns country_id and region_id will be unique.


CREATE TABLE IF NOT EXISTS countries_09 (
COUNTRY_ID varchar(2) NOT NULL UNIQUE DEFAULT '',
COUNTRY_NAME varchar(40) DEFAULT NULL,
REGION_ID decimal(10,0) NOT NULL,
PRIMARY KEY (COUNTRY_ID,REGION_ID));

-- >> 14  Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id
-- and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of
-- insertion and the foreign key column job_id contain only those values which are exists in the jobs table.

CREATE TABLE job_history ( 
EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY, 
START_DATE date NOT NULL, 
END_DATE date NOT NULL, 
JOB_ID varchar(10) NOT NULL, 
DEPARTMENT_ID decimal(4,0) DEFAULT NULL, 
FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);



-- 16. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email,
-- phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id
-- column does not contain any duplicate value at the time of insertion, and the foreign key column department_id,
-- reference by the column department_id of departments table, can contain only those values which are exists in the
-- departments table and another foreign key column job_id, referenced by the column job_id of jobs table, can contain
-- only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables.

-- "A foreign key constraint is not required merely to join two tables. For storage engines other than InnoDB,
-- it is possible when defining a column to use a REFERENCES tbl_name(col_name) clause, which has no actual effect,
-- and serves only as a memo or comment to you that the column which you are currently defining is intended to refer
-- to a column in another table




-- employees
create table  if not exists employees( employee_id int , first_name varchar(20), last_name varchar(20), 
email varchar(40), phone_no int , hire_date date, job_id int  ,salary decimal(7,2), commission varchar(30), manager_id int ,
department_id int,
primary key (employee_id,job_id,department_id)
);

-- Department table 
create	table if not exists departments( depertment_id int primary key, depertment_name varchar(50), manager_id int,
 location_id decimal(4,2));
 
-- jobs
create table if not exists jobs_05(job_id int primary key, job_title varchar(30), min_salary decimal(6,0) ,max_salary
 decimal(6,0) );
 
drop table departments;
drop table jobs_05;
drop table employees;

alter table employees
add foreign key (department_id) references  jobs_05 (job_id) ;

alter table employees
add foreign key (job_id) references  departments (depertment_id) ;

-- If you want to alter primary key  ,First delete Primary key again add list of primary key column
alter table employees 
drop primary key ,
add primary key (employee_id,job_id,department_id, phone_no);
 

 