--AND OR NOT
select* from employee_demographics where gender='Female' and birth_date > '1985-01-01';
select* from employee_demographics where first_name like 'A%' and gender='Female';
select* from employee_demographics where birth_date < '1990-01-01' and employee_id >3;
select* from employee_demographics where gender='Male' or birth_date <'1980-01-01';
select* from employee_demographics where first_name='Leslie' or first_name='Ron';
select* from employee_demographics where  gender<>'Female';
select* from employee_demographics where gender='Female' and (first_name='Leslie' or first_name='April');
select* from employee_demographics where gender='Male' and not  birth_date<'1985-01-01';


