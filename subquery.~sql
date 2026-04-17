select salary
  from employees
 where first_name = "Diana";
 
select *
  from employees
 where salary > 4200
 
select *
  from employees
 where salary > (select salary from employees where first_name = 'Diana')
 and job_id = (select job_id from employees where first_name = 'Ismael')
 and department_id = (select department_id from employees where first_name = 'Luis');

select* from employees where salary>(select avg(salary)from employees where department_id=60);
 
