create table employee (
emp_no int,
dob string,
firs_name string,
last_name string,
gender string,
hire_date date,
primary key ( emp_no )
);

select * from employee;

drop table dept;

create table dept(
dept_no varchar,
dept_name varchar,
primary key (dept_no)
);

select * from dept;


create table dept_employee(
dept_emp_id serial,
emp_no int,
dept_no varchar,
from_date date,
to_date date,
primary key (dept_emp_id),
foreign key(emp_no)references employee (emp_no),
foreign key(dept_no)references dept(dept_no)
);

select * from dept_employee;

create table staging_dept_employee(
emp_no varchar,
dept_no varchar,
from_date varchar,
to_date varchar
);

select * from staging_dept_employee

insert into dept_employee(emp_no,dept_no,from_date,to_date)
select
	cast (emp_no as int),
	dept_no,
	cast (from_date as date),
    cast (to_date as date)
from
	staging_dept_employee;

create table dept_mgr(
dept_mgr_id serial,
dept_no varchar,
emp_no int,
from_date date,
to_date date,
primary key (dept_mgr_id),
foreign key(dept_no)references dept (dept_no),
foreign key(emp_no)references employee(emp_no)
);

select * from dept_mgr;

create table staging_dept_mgr(
dept_no varchar,
emp_no varchar,
from_date varchar,
to_date varchar
);

select * from staging_dept_mgr

insert into dept_mgr(dept_no,emp_no,from_date,to_date)
select
	dept_no,
	cast (emp_no as int),
	cast (from_date as date),
    cast (to_date as date)
from
	staging_dept_mgr;


drop table salaries;

create table salaries (
sal_id serial,
emp_no integer,
salary integer,
from_date date,
to_date date,
primary key(sal_id),
foreign key(emp_no) references employee (emp_no)
);

select * from salaries

create table staging_salaries (
emp_no int,
salary int,
from_date varchar,
to_date varchar
);

select * from staging_salaries;

insert into salaries (emp_no, salary, from_date, to_date)
select
	emp_no,
	salary,
    cast (from_date as date),
    cast (to_date as date)
from
	staging_salaries;
	
select count(*) from staging_salaries;

 create table title(
 title_id serial,
 title varchar (100),
 emp_no integer,
 from_date date,
 to_date date,
 primary key (title_id),
 foreign key (emp_no) references employee(emp_no)
 );
 
 select * from title

drop table staging_title

create table staging_title(
emp_no varchar,
title varchar,
from_date varchar,
to_date varchar
);

----staging_dept_of_each_employee

select * from staging_title;

insert into title(emp_no,title,from_date,to_date)
select
	cast (emp_no as int),
	title,
    cast (from_date as date),
    cast (to_date as date)
from
	staging_title;
	

	
