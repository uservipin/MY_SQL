use company;

CREATE TABLE employee (
emp_id INT primary key,
first_name varchar(50),
last_name varchar(50),
birth_dat date,
sex varchar(1),
salary  int,
super_id int,
branch_id int
);

create table branch (
branch_id int primary key,
branch_name varchar(50),
mgr_id int,
mgr_start_date DATE,
foreign key (mgr_id) references employee(emp_id) on delete set null
);


alter table employee 
add foreign key (branch_id) references branch(branch_id) 
on delete set null;

alter table employee 
add foreign key(super_id) references employee(emp_id)
on delete set null;

CREATE TABLE client (
	client_id INT PRIMARY KEY,
	client_name  VARCHAR(50),
	branch_id INT,
	FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);


CREATE TABLE work_with (
emp_id int,
client_id int,
totla_sales int,
primary key (emp_id,client_id),
FOREIGN KEY(emp_id) references employee(emp_id) on delete cascade,
FOREIGN KEY(client_id) references client(client_id) on delete cascade
);


create table branch_supplier (
branch_id int,
supplier_name varchar(50),
supply_type varchar(40),
primary key( branch_id,supplier_name),
foreign key(branch_id) references branch(branch_id) on delete cascade
);

-- Corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');



