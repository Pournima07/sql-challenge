....activity 1

Select e.emp_no,e.last_name,e.first_name,e.gender,s.salary
From employee e
Left Join Salaries s
on e.emp_no = s.emp_no

.....activities 2

Select * from employee
where hire_date between '1986-01-01' and '1986-12-31' 

.....activity#3

Select dm.dept_no,d.dept_name,e.emp_no,e.Last_name,e.first_name,dm.from_date,dm.to_date
From dept_mgr dm
left Join employee e 
on e.emp_no = dm.emp_no
Left Join dept d on
dm.dept_no = d.dept_no

....activity 4

Select e.emp_no, e.first_name, e.last_name, d.dept_name
From employee e
left Join dept_employee de
on e.emp_no = de.emp_no
left join dept d
on de.dept_no = d.dept_no

activity....5

Select * from employee
where first_name ='Hercules' and last_name like 'B%'

activity....6
Select de.emp_no,e.last_name,e.first_name,d.dept_name
From dept d
Left Join dept_of_each_employee de 
on de.dept_no = d.dept_id
Left Join employee e
on de.emp_no = e.emp_no
where dept_name = 'Sales'


activity...7

select distinct dept_name from dept

Select de.emp_no,e.last_name,e.first_name,d.dept_name
From dept d
Left Join dept_employee de 
on de.dept_no = d.dept_no
Left Join employee e
on de.emp_no = e.emp_no
where dept_name = 'Sales' or dept_name = 'Development'


activity...8

Select last_name, count(1) as num_employees from employee
group by last_name
order by num_employees desc




