CREATE SCHEMA IF NOT EXISTS `bar` DEFAULT CHARACTER SET utf8 ;
USE `bar` ;

create table Drinks(d_id int(15) not null,
dname varchar(25) not null unique,
p_id int(10),
alchohol boolean,
primary key(d_id));
