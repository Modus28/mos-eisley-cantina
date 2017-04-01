CREATE SCHEMA IF NOT EXISTS `bar` DEFAULT CHARACTER SET utf8 ;
USE `bar` ;

create table Drinks(did varchar(15) not null,
dname varchar(25) not null unique,
pid varchar(20),
alchohol boolean,
primary key(did));
