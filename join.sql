--JOIN
--select from table1.column_name1, table2.column_name2, table2.column_name3
--where table1.common_column = table2.common_column

Create table employees(
  employee_id int PRIMARY KEY,
  Last_Name varchar(255) NOT NULL,
  First_Name varchar(255),
  EMAIL varchar(255),  
  PHONE_NUMBER varchar(255),
  HIRE_DATE date,
  JOB_ID varchar(255),
  Salary int,
  Commission_pct float,
  Manager_id int,
  Department_id int,
  Constraint fr_Department
  Foreign Key (Department_ID)
  References Departments(Department_Id)
);
Drop table employees;
Create table departments(
       department_id int primary key,
       department_name varchar(255),
       Manager_id int,
       location_id int
       );

Create table locations(
       location_id int primary key,
       street_address varchar(255),
       postal_code varchar(255),
       city varchar(255),
       state_province varchar(255),
       country_id varchar(2)
);
select * from employees;
select * from departments;
select * from locations;

--bu iki cedveli birlesdirek
select employees.first_name,
       employees.last_name,
       employees.hire_date,
       employees.salary,
       employees.department_id,
       departments.department_name
  from employees, 
       departments
 where employees.department_id=departments.department_id
   and employees.salary between 5000 and 12000;

--Joinde alias vermek equal
select e.first_name,
       e.last_name,
       e.hire_date,
       e.salary,
       d.department_id,
       d.department_name,
       l.street_address,
       l.city
  from employees e,
       departments d,
       locations l
 where e.department_id=d.department_id
   and l.location_id=d.location_id;
   
--join no equal <,>,<=,>=, in, like, between
select e.first_name,
       e.last_name,
       e.hire_date,
       e.salary,
       j.grade
  from employees e
       job_grades j
 where e.salary between j.lowest_sal and j.highest_sal;

-- left join - nullari da cixisa verir
select e.first_name,
       e.last_name,
       e.hire_date,
       e.salary,
       d.department_id
  from employees e,
       departments d 
 where e.department_id=d.department_id(+);
select e.first_name,
       e.last_name,
       e.hire_date,
       e.salary,
       d.department_id
  from employees e,
       departments d 
 where e.department_id(+)=d.department_id;
 
-- self join meselen iyerarxiya varsa
select worker.first_name,
       worker.employee_id,
       manager.employee_id,
       manager.first_name
  from employees worker,
       employees manager
 where worker.manager_id=manager.employee_id;

--cross join a cedvelinde n, b cedvelinde m setir var, cross joinde n*m setir olur
select count(*)
  from employees;

select count(*)
  from departments;
  
select e.employee_id,
       e.first_name,
       d.department_name
  from employees e,
       departments d
 where e.employee_id=101;
--ansi standarts
select e.employee_id,
       e.first_name,
       d.department_id
  from employees e
  cross join departments d;

-- full outer join
select e.first_name,
       e.last_name,
       d.department_id,
       d.department_name
  from employees e
  full outer join departments d
    on (e.department_id = d.department_id);
    
-- inner join
select e.first_name,
       e.last_name,
       d.department_id,
       d.department_name
  from employees e
  inner join departments d -- inner yerine tekce join de yaza bilerik
    on (e.department_id = d.department_id)
  where e.salary between 5000 and 6000;
  
--3+ table ile join
select e.first_name,
       e.last_name,
       d.department_id,
       d.department_name,
       l.city
  from employees e,
       departments d
    on e.department_id = d.department_id
  join locations l
    on d_location_id=l.location_id;

--left join
select e.first_name,
       e.last_name,
       d.department_id,
       d.department_name
  from employees e,
       departments d
 where e.department_id = d.department_id;
 
-- left outer join
select e.first_name,
       e.last_name,
       d.department_id,
       d.department_name
  from employees e
left outer join departments d
    on e.department_id = d.department_id
  where d.department_id=90;
  
--natural join
select e.first_name,
       e.last_name,
       d.department_id,
       d.department_name
  from employees e
  natural join departments d;
  
select 
  from employees e,
       departments d
 where e.department_id = d.department_id
   and e.manager_id = d.manager_id;
   
--right join
select e.first_name,
       d.department_id,
from employees e, departments d
where e.department_id=d.department_id(+);

select e.first_name,
       e.last_name,
       d.department_id,
       d.department_name
  from employees e
right outer join departments d
    on e.department_id = d.department_id;
    
--sql using
select e.first_name,
       e.last_name,
       department_id,
  from employees e
  join departments
 using (department_id,manager_id)
 where department_id=90;
