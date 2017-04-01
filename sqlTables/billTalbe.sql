CREATE SCHEMA IF NOT EXISTS `bar` DEFAULT CHARACTER SET utf8 ;
USE `bar` ;

create table Bill( billNum varchar(100),
c_id int(10),
e_id int(5),
totalprice int(6) not null,
tip int(5) not null,
primary key (billNum));

