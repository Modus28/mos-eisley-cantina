create database if not exists bar default character set utf8;
use bar;

create table if not exists fooditem(
f_id int(5) not null,
fname varchar(45) not null unique,
p_id int(10),
vegan bool,
glutenfree bool,
primary key(f_id));
