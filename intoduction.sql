use classicmodels;
create table test (id int, name varchar(50),marks int);

select * from test;

insert into test values (
id= 12 
name =vipin,
marks= 50
)

-- alter table means add | remove | Update data 

-- data added
alter table test add phone_No varchar(50)      
Describe test;
-- this query drop specific column
alter table test drop phone_No;

Describe test;
