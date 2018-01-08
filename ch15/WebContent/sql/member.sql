select * from user_tables where table_name like upper('%member%');

drop table member;

create table member2 (
id varchar2(12) primary key,
password varchar2(12) not null,
name varchar2(20) not null,
zipno varchar2(7),
address1 varchar2(80),
address2 varchar2(50),
tel varchar2(20),
regdate date default sysdate,
use_flag char(1) default 0
);

select * from member2;