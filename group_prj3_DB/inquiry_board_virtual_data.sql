-------------------------------------------- ADMIN TABLE Data --------------------------------------------------
/* admin 테이블 authority(권한) 컬럼 값 - admin, manager */
insert into admin(admin_id, password, authority, inputdate, isremoved) values('admin', '1234', 'ADMIN', sysdate, 'N');
-------------------------------------------- MEMBER TABLE Data --------------------------------------------------
insert into member(user_id, password, name, birth, phone, inputdate, isbanned, isdropped) values('user', 'qwer', '뚫값뗅', '1989-09-06', '010-1234-1234', sysdate, 'N', 'N');
-------------------------------------------- INQUIRY_BOARD TABLE Data --------------------------------------------
insert into inquiry_board(num, user_id, subject, user_contents, status, w_date, views) values(seq_inquiry_num.nextval, 'user', '이게 뭔가요?', '사용방법 매뉴얼 같은건 없나요?', 'W', sysdate, 1);


select * from admin;
select * from member;
select * from inquiry_board;




