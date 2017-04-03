CREATE SCHEMA IF NOT EXISTS `bar` DEFAULT CHARACTER SET utf8 ;
USE `bar` ;

create table priceTable(p_id int(10) not null,
price float not null,
primary key(p_id));


