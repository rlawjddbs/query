----------------------- Data for table lunch_admin ------------------------
insert into lunch_admin( ID, PASS, NAME)
values('admin','1234','김정윤');

insert into lunch_admin( ID, PASS, NAME)
values('lunch','1234','김희철');

insert into lunch_admin( ID, PASS, NAME)
values('root','1234','박영민');
commit;
-------------------------- Data for table lunch ----------------------------
insert into lunch( LUNCH_CODE, LUNCH_NAME, IMG, PRICE, SPEC, ID )
values( lunch_code, '포크칠리', 'm1_l1.gif', 4500, '돈까스와 떡갈비에 탕수육까지 환상의 조합으로
 다양한 맛을 느끼실 수 있는 부분 인지용.', 'admin' );
insert into lunch( LUNCH_CODE, LUNCH_NAME, IMG, PRICE, SPEC, ID )
 values( lunch_code, '돈까스', 'm1_l2.gif', 4500, '누구나 좋아하는 돈까스!
바삭튀겨낸 튀김옷안에 숨겨진 고기를 한입 베어물면
오지마을 이장님도  울고갈 감동실화인 부분 인지용.
소스맛도 끝내줍니다.', 'admin' );
commit;

select * from lunch;
------------------------ Data for table ordering ---------------------------
insert into ordering( ORDER_NUM, QUAN, ORDER_NAME, PHONE, IP_ADDRESS, LUNCH_CODE )
values(order_code, 1, '김정윤', '010-3456-4567', '211.63.89.133', 'L_000067');

insert into ordering( ORDER_NUM, QUAN, ORDER_NAME, PHONE, IP_ADDRESS, LUNCH_CODE )
values(order_code, 3, '공선의', '010-5436-2455', '211.63.89.157', 'L_000068');

insert into ordering( ORDER_NUM, QUAN, ORDER_NAME, PHONE, IP_ADDRESS, LUNCH_CODE )
values(order_code, 1, '이재현', '010-2314-8781', '211.63.89.135', 'L_000067');

select * from ordering;

commit;
