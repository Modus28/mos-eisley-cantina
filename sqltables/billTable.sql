CREATE SCHEMA IF NOT EXISTS `bar` DEFAULT CHARACTER SET utf8 ;
USE `bar` ;

create table Bill( billNum int(10) not null,
c_id int(10),
e_id int(5),
tip int(5) not null,
primary key (billNum));
