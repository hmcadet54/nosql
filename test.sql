use hr;


select min(min_salary),max(max_salary)  from jobs where job_title='President';

select * from jobs order by min_salary desc;

select job_id from employees where salary>=15000;

select job_title from jobs where job_id in (select job_id from employees where salary>=15000;

--20. Write a query to find total salary along with salary &amp; commission_pct Total salary formula =
--commission_pct, salary+(commission_pct*salary)

select salary, commission_pct, salary+(commission_pct*salary) as total_salary from employees;

SELECT 
    first_name, 
    last_name, 
    job_id 
FROM 
    employees 
WHERE 
    employee_id > 100 
    AND employee_id < 150 
    AND department_id > 90 
    AND department_id < 100;


select first_name from employees where hire_date in ('1994-12-8');

SELECT first_name || salary as 'Employees and Salaries' FROM employees;

select e.first_name, e.salary, j.job_title, d.department_name
    from employees as e
    right join jobs as j
    on e.job_id=j.job_id
    inner join departments as d
    on e.manager_id=d.manager_id;
    


select distinct e.first_name, e.salary, j.job_title, d.department_name
    from employees as e
    right join jobs as j
    on e.job_id=j.job_id
    inner join departments as d
    on e.manager_id=d.manager_id
    order by salary desc limit 3;
    
    
select distinct e.employee_id,j.job_title
    from employees as e
    inner join jobs as j
    on e.job_id=j.job_id
    inner join departments as d
    on e.manager_id=d.manager_id;
    where j.job_title = NULL;
    


select employee_id, count(department_id) from employees group by employee_id;





SELECT d.department_id, d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
INNER JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) = 0
ORDER BY employee_count DESC;



select distinct e.first_name, e.salary, j.job_title, d.department_name
    from employees as e
    right join jobs as j
    on e.job_id=j.job_id
    FULL OUTER JOIN departments as d
    on e.manager_id=d.manager_id
    where job_title not like ('Programmer') and salary > 6000;


select d.department_id, d.department_name, count(e.employee_id) from departments as d
inner join employees as e on d.department_id = e.department_id
group by d.department_id, d.department_name
having count(e.employee_id)=0;




select * from jobs;
select * from employees;
select * from departments;    
select * from locations;      
\

--11. Write a query to list the name, job title, department name, and location of employees who have a salary higher
--than the average salary in their department.



select e.first_name, j.job_title, d.department_name, l.city, e.salary
    from employees as e
    inner join jobs as j
    on e.job_id=j.job_id
    inner join departments as d
    on e.manager_id=d.manager_id
    inner join locations as l
    on d.location_id=l.location_id
    where e.location_id=d.location_id;
    
    
    
    
SELECT 
    e.employee_id,
    e.first_name,
    j.job_title,
    d.department_name,
    l.city,
    e.salary,
    AVG(e.salary) OVER () as company_average_salary
FROM 
    employees e
INNER JOIN 
    jobs j ON e.job_id = j.job_id
INNER JOIN 
    departments d ON e.department_id = d.department_id
INNER JOIN 
    locations l ON d.location_id = l.location_id
WHERE 
    e.salary > (SELECT AVG(salary) FROM employees)
ORDER BY 
    e.salary DESC;

