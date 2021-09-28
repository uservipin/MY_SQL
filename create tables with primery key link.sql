-- Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that,
-- the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column department_id, reference by the column department_id of departments table, can contain only those
-- values which are exists in the departments table and another foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB
-- Engine have been used to create the tables.

-- "A foreign key constraint is not required merely to join two tables. For storage engines other than InnoDB, it is possible when defining a column to use a REFERENCES tbl_name(col_name) clause, which has no actual
-- effect, and serves only as a memo or comment to you that the column which you are currently defining is intended to refer to a column in another table."

create database emp_01;
use emp_01;

create table if not exists   employees_20( employee_id int primary key ,first_name varchar(30),last_name varchar(30), email varchar(60), phone_no varchar(10), 
hire_date date,job_id int,salary decimal(8,2), commission decimal(4,2), manager_id  int null, departmental_id int null);

-- describe  employees_20;


create table departments( 

department_id decimal(4,0) default null primary key

) 


