create database assignment1;

create database org;

use org;

CREATE TABLE Worker (
	WORKER_ID numeric NOT NULL PRIMARY KEY,
	FIRST_NAME VARCHAR(25),
	LAST_NAME VArCHAR(25),
	SALARY numeric,
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

drop table worker;

INSERT INTO Worker VALUES
		(001, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR');
INSERT INTO Worker  VALUES(002, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin');
INSERT INTO Worker  VALUES(003, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR');
INSERT INTO Worker  VALUES(004, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00.00', 'Admin');
INSERT INTO Worker  VALUES(005, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin');
INSERT INTO Worker  VALUES(006, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account');
INSERT INTO Worker  VALUES(007, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account');
INSERT INTO Worker  VALUES(008, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

select * from worker;

CREATE TABLE Bonus (
	WORKER_REF_ID numeric,
	BONUS_AMOUNT numeric(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus VALUES(001, 5000, '2016-02-20');
INSERT INTO Bonus VALUES(002, 3000, '2016-06-11');
INSERT INTO Bonus VALUES(003, 4000, '2016-02-20');
INSERT INTO Bonus VALUES(001, 4500, '2016-02-20');
INSERT INTO Bonus VALUES(002, 3500, '2016-06-11');

select * from bonus;

CREATE TABLE Title (
	WORKER_REF_ID numeric,
	WORKER_TITLE VARCHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)      
);

INSERT INTO Title VALUES(001, 'Manager', '2016-02-20 00:00:00');
INSERT INTO Title VALUES(002, 'Executive', '2016-06-11 00:00:00');
INSERT INTO Title VALUES(008, 'Executive', '2016-06-11 00:00:00');
INSERT INTO Title VALUES(005, 'Manager', '2016-06-11 00:00:00');
INSERT INTO Title VALUES(004, 'Asst. Manager', '2016-06-11 00:00:00');
INSERT INTO Title VALUES(007, 'Executive', '2016-06-11 00:00:00');
INSERT INTO Title VALUES(006, 'Lead', '2016-06-11 00:00:00');
INSERT INTO Title VALUES(003, 'Lead', '2016-06-11 00:00:00');


select * from worker;
select * from bonus;
select * from title;



--#1
select first_name as 'WORKER_NAME'
from worker;

--#2
select upper(first_name)
from worker;

--#3
select distinct(department)
from worker;

--#4
select SUBSTRING(first_name,1,3)
from worker;

--#5
select CHARINDEX('a',first_name)
from worker
where first_name='Amitabh';

--#6
select rtrim(first_name)
from worker;

--#7
select ltrim(department)
from worker;

--#8
select distinct(department),len(department)
from worker;

--#9
select replace(first_name,'a','A')
from worker;

--#10
select concat(first_name,' ',last_name) as 'FULL_NAME'
from worker;

--#11
select *
from worker
order by first_name;

--#12
Select *
from Worker
order by FIRST_NAME asc,DEPARTMENT desc;


--#13
Select * 
from Worker
where FIRST_NAME in ('Vipul','Satish');

--#14
Select * 
from Worker 
where FIRST_NAME not in ('Vipul','Satish');

--#15
Select *
from Worker 
where DEPARTMENT like 'Admin%';

--#16
Select *
from Worker
where FIRST_NAME like '%a%';

--#17
Select *
from Worker
where FIRST_NAME like '%a';

--#18
Select *
from Worker
where FIRST_NAME like '_____h';

--#19
Select *
from Worker
where SALARY between 100000 and 500000;

--#20
Select * 
from Worker
where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;

--#21
select count(*) 
from worker 
where department = 'Admin';

--#22
select concat(first_name,' ',last_name) as 'name',salary
from worker
where salary between 50000 and 100000;

--#23
select department, count(worker_id)
from worker 
group by department
order by count(worker_id) desc;

--#24
select distinct(w.first_name),t.worker_title
from worker w
join title t
on w.worker_id=t.WORKER_REF_ID
and t.WORKER_TITLE ='Manager';

--#25
select worker_title,affected_from,count(*)
from title
group by worker_title,affected_from
having count(*)>1;

--#26
SELECT * 
FROM  worker
WHERE worker_id%2 != 0;

--#27
SELECT * 
FROM  worker
WHERE worker_id%2 = 0;

--#28
select * into duplicatworker from worker;
select * from duplicatworker;

--#29
select * from worker
intersect
select * from duplicatworker;

--#30
select * from duplicatworker
minus
select * from worker;

--#31
select top 10 * from worker;

--#32
select salary
from worker w1
where 4=(select count(distinct(w2.salary))
		 from worker w2
		 where w2.salary>=w1.salary);

--#33
SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary
from(SELECT max(Salary) as TotalSalary,DEPARTMENT
	 from Worker
	 group by DEPARTMENT)
as TempNew 
Inner Join Worker t
on TempNew.DEPARTMENT=t.DEPARTMENT 
and TempNew.TotalSalary=t.Salary;

--#34
select distinct top 3 salary as max_salary
from worker
order by salary desc;

--#35
select worker_title,count(*)
from title
group by WORKER_TITLE;






select * from worker;
select * from bonus;
select * from title;
select * from worker;
