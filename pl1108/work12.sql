--숙제
--1. 아래의 Dictionary테이블을 사용하여
--user_constraints, user_tab_cols=>user_cons_columns, user_tab_columns
--입력된테이블에 대한 제약사항명, 컬럼명, 데이터형
--을 조회하는 쿼리문을 작성 .
--
--2. 위의 작업을 수행하는 Procedure를 생성.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------확인차 만들어본 쿼리 ----------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from user_constraints;
select * from user_cons_columns;
select * from user_tab_columns;

select		uc.constraint_name, utc.column_name, utc.data_type
from	    user_constraints uc, user_tab_cols utc, user_tab_columns utcs
where		(uc.table_name = utc.table_name) and uc.table_name='DEPT' and uc.constraint_name is not null;

select uc.constraint_name, ucc.column_name, utc.data_type
from user_constraints uc, user_cons_columns ucc, user_tab_columns utc
where ((uc.constraint_name = ucc.constraint_name and ucc.column_name = utc.column_name) and (uc.table_name = ucc.table_name and ucc.table_name = utc.table_name)) and uc.table_name='DEPT';

select uc.table_name, ucc.table_name, utc.table_name, uc.constraint_name, ucc.constraint_name, ucc.column_name, utc.column_name, utc.data_type
from user_constraints uc, user_cons_columns ucc, user_tab_columns utc
where (uc.constraint_name = ucc.constraint_name and ucc.column_name = utc.column_name) and uc.table_name='EMP';



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------ 내가 짠 쿼리 ----------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select uc.table_name, ucc.table_name, utc.table_name, uc.constraint_name, ucc.constraint_name, ucc.column_name, utc.column_name, utc.data_type
from user_constraints uc, user_cons_columns ucc, user_tab_columns utc
where ((uc.constraint_name = ucc.constraint_name and ucc.column_name = utc.column_name) and (uc.table_name = utc.table_name)) and uc.table_name='EMP';

select uc.constraint_name, ucc.column_name, utc.data_type
from user_constraints uc, user_cons_columns ucc, user_tab_columns utc
where ((uc.constraint_name = ucc.constraint_name and ucc.column_name = utc.column_name) and (uc.table_name = utc.table_name)) and uc.table_name='DEPT';




---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------ 선생님이 짠 쿼리   ---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select   utc.constraint_name,   utc. column_name,
	    	(select distinct data_type
    		from user_tab_columns
	    	where user_tab_columns.column_name=utc. column_name ) data_type
from user_constraints uc, user_cons_columns utc
where (uc.constraint_name=utc.constraint_name ) and utc.table_name ='DEPT';  
                                                                                                                                                                                                         



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------- 그외 테스트 쿼리 -------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from emp;

select data_type
from user_tab_columns;

select * from user_tab_columns;

select distinct data_type
from user_tab_columns;

select   utc.constraint_name, utc. column_name,
	    	(select data_type
    		from user_tab_columns
	    	where user_tab_columns.column_name=utc. column_name ) data_type
from user_constraints uc, user_cons_columns utc
where (uc.constraint_name=utc.constraint_name ) and utc.table_name ='DEPT';
