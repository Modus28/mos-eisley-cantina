create database if not exists bar default character set utf8;
use bar;

create table if not exists customer(
c_id int(10) not null,
cname varchar(45) not null,
age int(3),
primary key(c_id));

