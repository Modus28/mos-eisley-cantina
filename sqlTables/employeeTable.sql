create database if not exists bar default character set utf8;
use bar;

create table if not exists employee(
e_id int(5) not null,
ename varchar(45) not null,
salary float,
datehired varchar(10),
primary key(e_id));



