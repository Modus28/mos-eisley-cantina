create database if not exists bar default character set utf8;
use bar;

create table if not exists drinkpurchase(
billNum int(10) not null,
d_id int(5) not null,
qty int(5),
primary key(billNum, d_id));




