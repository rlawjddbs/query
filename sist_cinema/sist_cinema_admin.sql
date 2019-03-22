/* 관리자 정보 테이블 삭제 */
DROP TABLE admin 
	CASCADE CONSTRAINTS;
                           
/*  */
create table admin(
	admin_id varchar2(30),
	name varchar2(30),
	password varchar2(30),
	hiredate date	
);