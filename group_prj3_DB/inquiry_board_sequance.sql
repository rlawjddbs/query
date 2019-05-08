drop sequence seq_inquiry_num;


--------------------------DDL for sequence seq_inquiry_num--------------------------------
create sequence seq_inquiry_num
start with 1
maxvalue 9999999999 /* 4°³ */
increment by 1
cycle
cache 15;

-------------------------DDL for sequence seq_inquiry_views-------------------------------

create sequence seq_inquiry_views
start with 1
maxvalue 9999
increment by 1;
