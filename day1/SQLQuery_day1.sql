create database mytraining

use mytraining

create table trainer
(id int primary key identity(101,1),
fname varchar(50) not null,
email varchar(50) not null,
phone numeric not null,
experience int check(experience>2),
skills varchar(50) not null,
tlocation varchar(50) default 'blr')

insert into trainer
values('chandan','chandan@gmail.com',12312356,5,'java','chennai');

select * from trainer;

create table saleman
(salesman_id numeric(5) primary key,
s_name varchar(30),
s_city varchar(15),
commission decimal(5,2));

select * from saleman;

create table orders
(ord_no numeric(5) primary key,
purch_amt decimal(8,2),
ord_date date,
customer_id numeric(5) foreign key references customer(customer_id),
salesman_id numeric(5) foreign key references saleman(salesman_id));

--drop table orders;

create table customer
(customer_id numeric(5) primary key,
cust_name varchar(30),
city varchar(15),
grade numeric(3),
salesman_id numeric(5));

insert into saleman values(5001,'James Hoog','New York',0.15);

select * from saleman;

insert into saleman values(5002,'Nail Knite','Paris',0.13);
insert into saleman values(5005,'Pit Alex','London',0.11);
insert into saleman values(5006,'Mc Lyon','Paris',0.14);
insert into saleman values(5007,'Paul Adam','Rome',0.13);
insert into saleman values(5003,'Lauson Hen','San Jose',0.12);

select * from customer;
insert into customer values(3002,'Nick Rimando','New York',100,5001);
insert into customer values(3007,'Brad Davis','New York',200,5001);
insert into customer values(3005,'Graham Zusi','California',200,5002);
insert into customer values(3008,'Julian Green','London',300,5002);
insert into customer values(3004,'Fabian Johnson','Paris',300,5006);
insert into customer values(3009,'Geoff Cameron','Berlin',100,5003);
insert into customer values(3003,'Jozy Altidor','Moscow',200,5007);
insert into customer(customer_id,cust_name,city,salesman_id)
values(3001,'Brad Guzan','London',5005);

select * from orders;
insert into orders values(70001,150.5,'2012-10-05',3005,5002);

insert into orders values(70009,270.65,'2012-09-10',3001,5005);
insert into orders values(70002,65.26,'2012-10-05',3002,5001);
insert into orders values(70004,110.5,'2012-08-17',3009,5003);
insert into orders values(70007,948.5,'2012-09-10',3005,5002);
insert into orders values(70005,2400.6,'2012-07-27',3007,5001);

insert into orders values(70008,5760,'2012-09-10',3002,5001);
insert into orders values(70010,1983.43,'2012-10-10',3004,5006);
insert into orders values(70003,2480.4,'2012-10-10',3009,5003);
insert into orders values(70012,250.45,'2012-06-27',3008,5002);
insert into orders values(70011,75.29,'2012-08-17',3003,5007);
insert into orders values(70013,3045.6,'2012-04-25',3002,5001);

select * from saleman;
select * from customer;
select * from orders;
--All tables

--#1
select * from saleman;
--#2
select s_name,commission
from saleman;

--select*from orders;
--#3
select ord_date,salesman_id,ord_no,purch_amt
from orders
order by ord_date;
--#4
select distinct(salesman_id)
from customer;
--#5
select s_name,s_city
from saleman
where s_city='Paris';
--#6
select * 
from customer
where grade=200;
--#7
select ord_no,ord_date,purch_amt
from orders
where salesman_id=5001;
--#8
select customer_id,cust_name,city,grade,salesman_id
from customer
where city='New York' and grade>100;
--#9
select *
from orders
where ord_date not in('2012-09-10')
and (salesman_id>5005 or purch_amt>1000);
--#10
select *
from orders
where purch_amt<200 and customer_id<3009 or ord_date<'2012-02-10';

