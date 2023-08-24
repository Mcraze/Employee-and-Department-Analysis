-- Show all data from emp table
select * from emp;

-- Display unique jobs from emp table
select distinct job from emp;

-- List employee in ascending order of their salaries
select ename, sal from emp order by sal desc;

-- employee details in ascending order of deptno and descending of jobs
select ename, deptno, job from emp order by deptno asc, job desc;

-- list all unique job groups in descending order
select distinct job from emp order by job desc;

-- display details of all mgrs
select * from emp where empno in (select mgr from emp);

-- list employees who joined before 1981
select * from emp where hiredate < '1981-01-01';

-- list empno, ename, sal, dailysal in asc order of their annual salary
select empno, ename, sal, sal/30 as daily_sal, sal*12 as annual_salary from emp order by annual_salary;

-- display empno, ename, job, hiredate and experience of all mgrs
select empno, ename, job, hiredate, (year(sysdate())-year(hiredate)) as exp_in_years from emp where empno in (select mgr from emp);

-- list employee details of employees working for mgr 7698
select * from emp where mgr = 7698;

-- list details of employee whose comission is more than their salary
select * from emp where comm > sal;

-- list employees in ascending order of their designation and those who joined in second half of 1981
select * from emp where hiredate > '1981-06-30' and year(hiredate) = 1981 order by job;

-- list employee with their exp and where daily salary is more than 100
select * from emp where (sal/30) > 100;

-- list employees who are either clerk or analyst in job descending
select * from emp where job in ('Clerk', 'Analyst') order by job desc;

-- list employees who joined on 1 May 1981, 3 Dec 1981, 17 Dec 1981 and 19 Jan 1980 by ascending of seniority
select * from emp where hiredate in ('1981-05-01','1981-12-03','1981-12-17','1980-01-19') order by hiredate;

-- list employees who work in department number 10 or 20
select * from emp where deptno in (10, 20);

-- list employees who joined in the year 1981
select * from emp where year(hiredate) = 1981;

-- list employees who joined in the month of December 1981
select * from emp where year(hiredate) = 1981 and month(hiredate) = 12;

-- list employees whose annual salary ranges between 22000 and 45000
select *,(sal*12) as annual_salary from emp where (sal*12) between 22000 and 45000;

-- select ename of employee who have 5 characters in their names
select ename from emp where length(ename) = 5;

-- list enames which start with the letter s and have 5 characters total
select ename from emp where length(ename) = 5 and ename like 'S%';

-- list employee names who have 4 characters and contains r as their third character
select * from emp where length(ename) = 4 and ename like '__r%';

-- list 5 character names starting with s and ending with h
select * from emp where length(ename) = 5 and ename like 'S%h';

-- list all employees who joined in january
select * from emp where month(hiredate) = 1;

-- list employees who joined in the months where second character is a
select *, monthname(hiredate) from emp where monthname(hiredate) like '_a%';

-- list employee details whose salary is a 4 digit number ending with 0
select * from emp where length(sal) = 4 and sal like '%0';

-- list employee names who have ll - double l together
select * from emp where ename like '%ll%';

-- list all the employees who joined in the 80's basically from 80-89
select * from emp where year(hiredate) < 1990;

-- select employees who do not belong to department no 20
select * from emp where deptno != 20;

-- list all employees except president and managers in ascending orders of their salaries
select * from emp where job not in ('President','Manager') order by sal;

-- list all employees who joined before and after 1981
select * from emp where year(hiredate) != 1981;

-- list employee whose employee id doesn't start with 78
select * from emp where empno not like '78%';

-- list all the employees who works for managers who are available in the list
-- Select their names
select e.ename as Employee, m.ename as Manager from emp as e, emp as m where e.mgr = m.empno;

-- list employees who joined in any year but not in the month of April
select * from emp where monthname(hiredate) != 'April';

-- list all clerks of department no 20
select * from emp where deptno = 20 and job = 'Clerk';

-- list employee of department 30 or 10 who joined in the year 1981
select * from emp where deptno in (10,30) and year(hiredate) = 1981;

-- display details of an employee called as smith including department details
select emp.empno, emp.ename, emp.job, emp.sal, emp.deptno, dept.dname, dept.loc 
from emp inner join dept 
on emp.deptno = dept.deptno 
where emp.ename = 'Smith';

-- list all details from emp table along with department name and location of all employees working under Research and Accounting
-- Arrange the results in ascending order of the department name
select * from emp inner join dept on emp.deptno = dept.deptno 
where dept.dname in ('Accounting', 'Research') 
order by dept.deptno;

-- list empno, ename, sal, dname of all the managers and analyst working in New York and Dallas with experience more than 40 years
-- without receiving any comissions in ascending order of their location
select e.empno, e.ename, e.sal, e.job, d.dname, d.loc 
from emp as e inner join dept as d on e.deptno = d.deptno
where e.job in ('Manager', 'Analyst') 
and d.loc in ('New York', 'Dallas') 
and (year(sysdate())-year(hiredate)) > 10
and e.comm is null
order by d.loc;

-- display details of employee working at Chicago or working in accounting department with annual salary more than 28000
-- Salary should not be 3000 or 2800 and must not be a Manager also empno number should not have 7 or 8 in 3rd position of their id
-- order in ascending order of deptno as ascending and job title as descending
select *, emp.sal*12 from emp inner join dept on emp.deptno = dept.deptno
where (dept.loc = 'Chicago' or dept.dname = 'Accounting')
and (emp.sal*12) > 28000 
and emp.sal not in (2800,3000)
and emp.job != 'Manager' 
and (emp.empno not like '__7%' or emp.empno not like '__8%')
order by emp.deptno desc, emp.job asc;

-- display total information of the employee working for department no 10 or 20
select e.empno, e.ename, e.sal, d.dname, (year(sysdate())-year(hiredate)) as experience, (sal*12) as annual_salary
from emp as e inner join dept as d on e.deptno = d.deptno where e.deptno in (10,20);

-- show details of employees whos salaries are more than the employee named Blake
select * from emp where sal > (select sal from emp where ename = 'Blake');

-- list the employees whose jobs are same as Allen
select * from emp where job = (select job from emp where ename = 'Allen');

-- list all the details of the employees who are senior to king
select * from emp where hiredate < (select hiredate from emp where ename = 'King');

-- list employees who are senior to their own managers
select * from emp e inner join emp m on m.empno = e.mgr where e.hiredate < m.hiredate;