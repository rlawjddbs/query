drop sequence seq_movie;
drop sequence seq_book;
drop sequence seq_snack;
--------------------------DDL for sequence seq_movie--------------------------------
create sequence seq_movie
start with 1
maxvalue 99999999     /*8°³*/
increment by 1
nocycle
cache 15;


--------------------------DDL for sequence seq_order--------------------------------
create sequence seq_book
start with 1
maxvalue 999	/*3°³*/
increment by 1
nocycle
cache 30;

--------------------------DDL for sequence seq_snack--------------------------------
create sequence seq_snack
start with 1
maxvalue 99	/*2°³*/
increment by 1
nocycle
cache 25;



