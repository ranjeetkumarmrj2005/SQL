CREATE database temp2;
USE temp2;
create table account(
	id int primary key,
    name varchar(255) unique,
    balance int not null default 0
);
insert into account(id,name) values
(1,'A');
insert into account(id,name) values
(2,'B');
select * from account;
alter table account add interest float not null default 0;
alter table account modify interest double not null default 0;
desc account;
alter table account change column interest saving_interest float not null default 0;
alter table account modify saving_interest float not null default 0;
alter table account drop column saving_interest;
alter table account RENAME TO account_details;
desc account_details;

select * from account_details;

delete from account where id =1;
