select * from dual;
--function_name[(arg1,arg2,...argn)]
--case-manipulation functions: lower, upper, initcap
--character-manipulation functions: concat, substr, length, instr, lpad, rpad, trim, replace
select lower('SQL Course') from dual;

select first_name,
       last_name,
       lower(email) as email,
       phone_number,
       lower(job_id) as job_id 
  from employees
 where last_name = 'king';
  
select upper('SQL Course') from dual;

select upper('SQL Course#235') from dual;

select upper(first_name ||' '|| last_name) as name,
       email,
       hire_date,
       salary
  from employees
 where upper(last_name) = 'KING';

select initcap('SQL Course') from dual;

select first_name, last_name, initcap(email) as email
  from employees
 where initcap(email) = 'Sbaiba';
 
 select Length('Hello World') from dual;
 
 select first_name,
        length(first_name),
        last_name,
        length(last_name)
   from employees
  where length(first_name)>6
    and length(last_name)>6;
    
 select concat('1','2') as concat from dual;
 
 select concat(first_name, last_name)
   from employees
  where concat(first_name, last_name) = 'AmitBanda';

--INSTR(Column|expression,'String', [m],[n])
select instr('database management system','a',1,1) from dual;

select instr('database management system','a') from dual;

select instr('database management system','a',1,2) from dual;

select instr('database management system','a',-1,1) from dual;--axirdan evvele

select instr('database management system','are',1,1) from dual;

select instr('database management system','sys',1,1) from dual;

--LPAD(COLUMN|EXPRESSION,s,'string') doldurur soluna ki uzunlugu s-e catsin
select lpad('100',5,'*') from dual;

select lpad('10000',5,'*') from dual;

--RPAD sagina doldurur
select rpad('100', 5, '*') from dual;
select lpad(rpad('100', 5, '*'),6,'*') from dual;
select lpad('100023',4,'*') from dual;--ilk 4 reqem qalir ancaq
select rpad('100023',4,'*') from dual;--ilk 4 reqem qalir ancaq

--TRIM evvelden ve sondan xususi bir simvolu yigisdirir
select trim ('*' from '*****SQL*') from dual;--her iki terefden
select trim (trailing '*' from '*****SQL*') from dual;--sondan
select trim (leading '*' from '*****SQL*') from dual;--evvelden
select trim (both '*' from '*****S*QL*') from dual;--her iki terefden
select trim ('   SQL ') from dual;

select *
  from employees
 where trim(first_name) = trim('Steven ');
 
--REPLACE('text','searching_text','replacing_text')

select replace('DATA MANAGEMENT SYSTEM','DATA','DATABASE') from dual;
select replace('DATA MANAGEMENT SYSTEM','aaa','DATABASE') from dual;

select first_name,
       last_name,
       replace(email,'D','%')
  from employees;
  
--ROUND(Column|Expression, n)
select round(3.46675634) from dual;
select round(-3.56675634) from dual;
select round(3.46675634,0) from dual;
select round(17.46675634,-1) from dual;

--TRUNC(column|expression,n) yuvarlasdirmir sadece hemin hedde qeder olan hisseni verir
select trunc(369.159) from dual;
select trunc(369.159,2) from dual;
select trunc(369.159,-2) from dual;

--MOD(m,n)
select mod(10,3) from dual;
select mod(-10,3) from dual;--pythondan ferqlidir

--POWER(m,n)
select power(2,3) from dual;
select power(2,-3) from dual;

--ABOUT DATE
select hire_date, 
       hire_date + 5, 
       hire_date - 5
  from employees;
  
--SYSDATE indiki zaman
select sysdate from dual;
select first_name, last_name, hire_date, sysdate
  from employees;
select round(sysdate) from dual; 
select round(sysdate, 'month') from dual; 
select round(sysdate, 'year') from dual; 
  
--MONTHS_BETWEEN
select months_between('17-Jan-26', '17-Nov-25') from dual;
select months_between('17-Jan-26', '16-Nov-25') from dual;
select months_between('17-Jan-26', '17-April-26') from dual;

select trunc(sysdate)-trunc(hire_date) from employees;

--ADD_Months(date, n)
select hire_date,
       add_months(hire_date,2),
       add_months(hire_date,-2)
  from employees;
  
--NEXT_DAY(Date,'char')
select hire_date, next_day(hire_date,'monday') from employees;

--LAST_DAY(DATE)
select last_day(sysdate) from dual;

--TO_CHAR,TO_CHAR,TO_DATE
select sysdate, to_char(sysdate,'MM,YY') from dual;
select sysdate, to_char(sysdate,'YYYY') from dual;
select sysdate, to_char(sysdate,'YEAR') from dual;
select sysdate, to_char(sysdate,'DAY') from dual;
select sysdate, to_char(sysdate,'DY') from dual;
select sysdate, to_char(sysdate,'DD') from dual;
select sysdate, to_char(sysdate,'dd.mm.yyyy hh24:mi:ss') from dual;
select sysdate from dual where sysdate=to_date('17.06.03','dd-mm-yyyy');
select sysdate from dual where sysdate=to_date('14.04.26','dd-mm-yyyy');

--NVL(ARG1,ARG2)
select first_name,
       salary,
       NVL(commission_pct,0)--null deyer sifirla evez olunur, null olmayan ozunu cixardir
  from employees;
  
--NVL2(ARG1,ARG2,ARG3) arg1 null deyilse arg2ni nulldursa arg 3u qaytarir.
select first_name,
       salary,
       NVL2(commission_pct,'salary+commission', 'salary')--null deyer sifirla evez olunur, null olmayan ozunu cixardir
  from employees;
  
--nullif(arg1,arg2) arg1 arg2e beraberdirse null, deyilse arg1 qaytarir.
select nullif(1,1) from dual;
select nullif(1,2) from dual;

--coalesce(arg1,arg2,arg3, argn) ilk null olmayan argumenti qaytarir.
select coalesce(null ,null ,1,2,null) from dual;

--case
select first_name,
       last_name,
       salary
       case
         when salary between 2000 and 5000 then
         'asagi emek haqqi alanlar'
         when salary between 5001 and 10000 then
         'orta emek haqqi alanlar'
         else
         'yuksek emek haqqi alanlar'
         end salary_category
  from employees;
         
--decode
select first_name,
       last_name,
       department_id,
       decode(department_id,90, '90 nomreli',
                            30, '30 nomreli',
                            60,'60 nomreli',
                            'diger departament')
  from employees;
  
--sum([distinct|ALL]n)
select sum(salary)
  from employees;
select sum(all salary)
  from employees;
select sum(distinct salary)
  from employees;
  
--avg([distinct|all],n)
select avg(salary)
  from employees;
  
--min([distinct, all]expr),max([distinct,all]expr)
select min(salary)
  from employees;
select *
  from employees
  where min(salary);
select min(hire_date)
  from employees;
select min(last_name)
  from employees;
  
--count(*|Distinct|all  expr)
select count(*) from employees;
select count(Distinct first_name) from employees;--ferqli olanlarin sayini qaytarir

--desc employees; sutunlarin tipini verir
select count(EMPLOYEE_ID)
       from employees;
select count(commission_pct)--null deyerler nezere alinmir
       from employees;
       
--group by
  select avg(salary) as avg_salary,
         department_id,
         sum(salary) as total_salary
    from employees
group by department_id
order by department_id;

  select department_id,
         round(avg(salary),2) as avg_salary,
         sum(salary) as total_salary,
         min(salary) as min_salary,
         max(salary) as max_salary,
         count(*) as cnt_worker
    from employees
group by department_id
order by department_id;

--having - funksiya olan halda (meselen count(*)) isledilir where kimidir
  select department_id,
         min(salary) as min_saalry,
         max(salary) as max_salary,
         round(avg(salary),2) as average,
         sum(salary) as total_salary,
         count (*) as isci_sayi
    from employees
  having count(*) >6--havingde isci_sayi yox funksiyanin ozu olmalidir
group by department_id
order by department_id;
