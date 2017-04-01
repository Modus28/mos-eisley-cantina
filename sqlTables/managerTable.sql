create database if not exists bar default character set utf8;
use bar;

create table if not exists manager(
m_id int(5) not null,
mname varchar(45) not null,
e_id int(5),
primary key(m_id));





