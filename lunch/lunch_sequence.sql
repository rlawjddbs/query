drop sequence seq_lunch;
drop sequence seq_order;
-------------------------- DDL for sequence seq_lunch ----------------------------

create sequence seq_lunch
start with 1
maxvalue 9999999999
increment by 1
nocycle
cache 20;



-------------------------- DDL for sequence seq_order ----------------------------

create sequence seq_order
start with 1
maxvalue 99999999999
increment by 1
nocycle
cache 25;
