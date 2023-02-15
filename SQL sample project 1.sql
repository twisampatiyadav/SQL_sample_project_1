## create a database called 'world' 
create database world;
use world;


## Create a table called countries with the following columns : (name, population, capital ) 
create table countries(
name varchar(50),
population int unsigned,
capital varchar(50)
);
describe countries;


## Insert the some data into the table
insert into countries values ('china',1382,'beijing'),
('india',1326,'delhi'),
('united states', 324,'washington d.c.'),
('indonesia',260,'	Jakarta'),
('brazil',209,'brasilia'),
('Pakistan',193,'Islamabad'),
('Nigeria',187,'Abuja'),
('Bangladesh',163,'Dhaka'),
('Russia',143,'Moscow'),
('Moscow',128,'Mexico City'),
('Japan',126,'Tokyo'),
('Philippines',102,'Manila'),
('Ethiopia',101,'Addis Ababa'),
('Vietnam',94,'Hanoi'),
('Egypt',93,'Cairo'),
('Germany',81,'Berlin'),
('iran',80,'Tehran'),
('Turkey',79,'Ankara'),
('Congo	',79,'Kinshasa'),
('France',64,'Paris'),
('United Kingdom',64,'London'),
('Italy',60,'Rome'),
('South Africa',55,'Pretoria'),
('Myanmar',54,'Naypyidaw');
select * from countries;

## Add a country zimbabwe having population 212 and capital harare
insert into countries values('zimbabwe',212,'harare');

## Change ‘Delhi' to ‘New Delhi'
update countries set capital = 'New Delhi' where population = 1326;

## Rename the table countries to big_countries .
alter table countries rename to big_countries;


## Create a table named 'suppliers' having columns supplier_id, supplier_name, location. Use auto increment wherever applicable
create table suppliers ( supplier_id int auto_increment primary key, supplier_name varchar(30) , location varchar(30));

## Create a table named 'product' having columns product_id, product_name, supplier_id. Use auto increment wherever applicable
create table products(product_id int auto_increment  primary key, product_name varchar(30) not
null unique, supplier_id int,foreign key (supplier_id) references suppliers(supplier_id) on delete cascade on update cascade);

## Create a table named 'stock' having columns id, product_id, balance_stock. Use auto increment wherever applicable
create table stock(id int auto_increment primary key, product_id int, balance_stock int, foreign key(product_id) references
products(product_id) on delete cascade on update cascade );


## Enter some records into the three tables.
insert into suppliers values(1,'sri jagannath','puri'),(2,'baba lingaraj','bhubaneswar'),(3,'maa tarini','keonjhar');
select * from suppliers;
insert into products values(1,'nuts',1),(2,'side_stand', 1), (3,'headlight',2), (4,'mirrors',2), (5,'tyers',3), (6,'gloves',3);
select * from products;
insert into stock values(1,1,5),(2,2,8),(3,3,13),(4,4,6),(5,5,8),(6,6,16);
select * from stock;


## Modify the supplier table to make supplier name unique and not null.
alter table suppliers modify supplier_name varchar(30) not null unique;

## create a emp table and insert some data
create table emp(emp_id int ,
first_name varchar(50) not null,
last_name varchar(50) not null,
salary decimal(10,2));
describe emp;
insert into emp(emp_id,first_name,last_name,salary) values
(10000,'twisampati','yadav',50000),
(10012,'abinash','nayak',25000),
(10008,'deepak','banerjee',20000),
(10015,'dinesh','nayak',45500),
(10010,'hrishikesh','sahoo',35000),
(10044,'bhupesh','acharya',18000),
(10111,'pankaj','sahu',9000);

## Add a column called deptno
alter table emp add column deptno int unsigned;
desc emp;

## Set the value of deptno in the following order
## deptno = 20 where emp_id is divisible by 2
## deptno = 30 where emp_id is divisible by 3
## deptno = 40 where emp_id is divisible by 4
## deptno = 50 where emp_id is divisible by 5
## deptno = 10 for the remaining records.

select * from emp;
update emp set deptno=20 where (emp_id%2)=0;
select * from emp;
update emp set deptno=30 where (emp_id%3)=0;
select * from emp;
update emp set deptno=40 where (emp_id%4)=0;
select * from emp;
update emp set deptno=50 where (emp_id%5)=0;
select * from emp;
update emp set deptno=10 where deptno is null;
select * from emp;

## Create a unique index on the emp_id column.
create unique index unq_empid on emp (emp_id);

## Create a view called 'emp_sal' on the emp table by selecting the following fields in the order of highest salary to the lowest salary.(emp_id, first_name, last_name, salary)
create view emp_sal as select emp_id,first_name,last_name,salary from emp order by salary desc;
select * from emp_sal;



















