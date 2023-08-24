-- Creating database
create database sqlpractice;
use sqlpractice;

-- Creating employees table
create table emp (empno int, ename varchar(50), job varchar(50), mgr int, hiredate date, sal int, comm int, deptno int);

-- Inserting values into the emp table
insert into emp values (7369, 'Smith', 'Clerk', 7902, '1980-12-17', 800, null, 20);
insert into emp values (7499, 'Allen', 'Salesman', 7698, '1981-02-20', 1600, 300, 30);
insert into emp values (7521, 'Ward', 'Salesman', 7698, '1981-02-22', 1250, 500, 30);
insert into emp values (7566, 'Jones', 'Manager', 7839, '1981-04-02', 2975, null, 20);
insert into emp values (7654, 'Martin', 'Salesman', 7698, '1981-09-28', 1250, 1400, 30);
insert into emp values (7698, 'Blake', 'Manager', 7839, '1981-05-01', 2850, null, 30);
insert into emp values (7782, 'Clark', 'Manager', 7839, '1981-06-09', 2450, null, 10);
insert into emp values (7788, 'Scott', 'Analyst', 7566, '1982-12-01', 3000, null, 20);
insert into emp values (7839, 'King', 'President', null, '1981-11-17', 5000, null, 10);
insert into emp values (7844, 'Turner', 'Salesman', 7698, '1981-09-08', 1500, 0, 30);
insert into emp values (7876, 'Adams', 'Clerk', 7788, '1983-01-12', 1100, null, 20);
insert into emp values (7900, 'James', 'Clerk', 7698, '1981-12-03', 950, null, 30);
insert into emp values (7802, 'Ford', 'Analyst', 7566, '1981-12-03', 3000, null, 20);
insert into emp values (7934, 'Miller', 'Clerk', 7782, '1982-01-23', 1300, null, 10);

-- Creating deptartment table
create table dept (deptno int, dname varchar(50), loc varchar(50));

-- Inserting values into the dept table
insert into dept values (10, 'Accounting', 'New York');
insert into dept values (20, 'Research', 'Dallas');
insert into dept values (30, 'Sales', 'Chicago');
insert into dept values (40, 'Operations', 'Boston');

-- Checking if data is inserted or not
select * from emp;
select * from dept;