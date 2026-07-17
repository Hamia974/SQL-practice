-- order by
select* from public.employee_demographics order by first_name;
select* from public.employee_demographics order by birth_date desc;
select* from public.employee_demographics order by age desc;
select* from public.employee_demographics order by gender,age;
select first_name,salary from public.employee_salary  order by salary desc;
select* from public.employee_demographics order by first_name;
select occupation from public.employee_salary  order by occupation;
select* from public.employee_demographics order by gender,birth_date,first_name;
select* from public.employee_demographics where gender='Female' order by age desc;
select occupation,avg(salary) from public.employee_salary 
group by occupation having avg(salary)>60000 order by occupation;
select gender,count(gender) from public.employee_demographics group by gender
having count(gender)>4;
select occupation,sum(salary) from public.employee_salary 
group by occupation having sum(salary)>1500000 order by occupation;
select extract(year from birth_date) as birth_year,count(birth_date) from public.employee_demographics
group by birth_year having count(birth_date)>=2;
select occupation,min(salary) from public.employee_salary group by occupation
having min(salary)>45000;
select occupation,max(salary) from public.employee_salary group by occupation
having max(salary)<90000;
