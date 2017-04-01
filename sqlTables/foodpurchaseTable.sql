create database if not exists bar default character set utf8;
use bar;

create table if not exists foodpurchase(
c_id int(10) not null,
f_id int(5) not null,
qty int(5),
primary key(c_id, f_id));





