create database if not exists bar default character set utf8;
use bar;

create table if not exists drinkpurchase(
c_id int(10) not null,
d_id int(15) not null,
qty int(5),
primary key(c_id, d_id));




