--------------------------Data for table admin--------------------------------
insert into admin (admin_id, name, password, hiredate) values ('sso','박소영',1234,'2018-05-24');
insert into admin (admin_id, name, password, hiredate) values ('hee','김희철',1234,'2018-05-24');
insert into admin (admin_id, name, password, hiredate) values ('jin','노진경',1234,'2008-06-01');
insert into admin (admin_id, name, password, hiredate) values ('young','박영민',1234,'2013-07-31');

commit;
--------------------------Data for table member--------------------------------
insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('roma_emo','jmjmhaha','한지민','19820511','017-4567-3241','g', 45000, 55000, '2011-03-03');

insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('yesreal82','rice','손예진','19820303','016-7541-3546','s', 70000, 270000, '2016-05-04');

insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('trust','luvkei','김주영','19800711','010-7814-6572','g', 38000, 210000, '2016-07-27');

insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('doctor_seul','wouldyou123','강예서','20010721','010-7878-1354','s', 10000, 10000, '2011-12-31');

insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('seojin2','agalheadshot','곽미향','19750412','010-4735-2141','s',10000, 10000, '2011-12-31');

insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('harvard17','!breakpyramid','차세리','19980612','010-7878-0101','v',20000, 310000, '2008-06-12');

insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('pyramid_top','chapagook17','차민혁','19730731','010-7541-3456','g', 20000, 120000, '2019-01-20');

insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('jjini83','eomama!3546','진진희','19831212','010-4875-3546','v', 50000, 450000, '2009-10-12');

insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('mamasang','sorryhyena0','강준상','19730909','017-5784-3535','g', 45000, 150000, '2015-06-11');

insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('stealjam','bin22222','강예빈','20070401','010-4577-4586','s', 10000, 10000, '2011-12-31');

commit;

--------------------------Data for table movie-------------------------------------
insert into movie
(movie_code, movie_title, movie_img, genre, country, director, movie_grade, runningtime,
playdate, synopsis, actor, movie_date, admin_id)
values (movie_code,'극한직업','extreme_job.png','다큐멘터리','한국','이병헌','PG','111',
      '2019-01-23','불철주야 달리고 구르지만 바닥, 급기야 해체 위기를 맞는 마약반!
더 이상 물러설 곳이 없는 팀의 맏형 고반장은 국제 범죄조직의 국내 마약 밀반입 정황을 포착하고 장형사, 마형사, 영호, 재훈까지 4명의 팀원들과 함께 잠복 수사에 나선다.
마약반은 24시간 감시를 위해 범죄조직의 아지트 앞 치킨집을 인수해 위장 창업을 하게 되고, 뜻밖의 절대미각을 지닌 마형사의 숨은 재능으로 치킨집은 일약 맛집으로 입소문이 나기 시작한다.
수사는 뒷전, 치킨장사로 눈코 뜰 새 없이 바빠진 마약반에게 어느 날 절호의 기회가 찾아오는데…',
      '류승룡,이하늬','2019-01-21','sso');

insert into movie
(movie_code, movie_title, movie_img, genre, country, director, movie_grade, runningtime,
playdate, synopsis, actor, movie_date, admin_id)
values (movie_code,'뺑반','hit_and_run.png','범죄,액션','한국','한준희','PG','133',
      '2019-01-30','경찰 내 최고 엘리트 조직 내사과 소속 경위 ‘은시연’(공효진).
 조직에서 유일하게 믿고 따르는 ‘윤과장’(염정아)과 함께
 F1 레이서 출신의 사업가 ‘정재철’(조정석)을 잡기 위해 수사망을 조여가던 시연은
 무리한 강압 수사를 벌였다는 오명을 쓰고 뺑소니 전담반으로 좌천된다.

 알고 보면 경찰대 수석 출신, 만삭의 리더 ‘우계장’(전혜진)과
 차에 대한 천부적 감각을 지닌 에이스 순경 ‘서민재’(류준열).
 팀원은 고작 단 두 명, 매뉴얼도 인력도 시간도 없지만 뺑소니 잡는 실력만큼은 최고인 ‘뺑반’.
 계속해서 재철을 예의주시하던 시연은 뺑반이 수사 중인 미해결 뺑소니 사건의 유력한 용의자가 재철임을 알게 된다.

 뺑소니 친 놈은 끝까지 쫓는 뺑반 에이스 민재와
 온갖 비리를 일삼는 재철을 잡기 위해 모든 것을 건 시연.
 하나의 목표를 향해 힘을 합친 그들의 팀플레이가 시작되는 가운데
 방법을 가리지 않고 수사망을 빠져 나가려는 통제불능 스피드광 재철의 반격 역시 점점 과감해지는데…!',
      '공효진,류준열,조정석','2019-01-23','jin');

insert into movie
(movie_code, movie_title, movie_img, genre, country, director, movie_grade, runningtime,
playdate, synopsis, actor, movie_date, admin_id)
values (movie_code,'그린북','greenbook.png','드라마','미국','피터 패럴리','PG','130',
      '2019-01-09','언제 어디서든 바른 생활! 완벽한 천재 뮤지션 ‘돈 셜리’
원칙보다 반칙! 다혈질 운전사 ‘토니’
취향도, 성격도 완벽히 다른 두 남자의 특별한 우정이 시작된다!

1962년 미국, 입담과 주먹만 믿고 살아가던 토니 발레롱가(비고 모텐슨)는 교양과 우아함 그 자체인 천재 피아니스트 돈 셜리(마허샬라 알리) 박사의 운전기사 면접을 보게 된다.
백악관에도 초청되는 등 미국 전역에서 콘서트 요청을 받으며 명성을 떨치고 있는 돈 셜리는 위험하기로 소문난 미국 남부 투어 공연을 떠나기로 결심하고, 투어 기간 동안 자신의 보디가드 겸 운전기사로 토니를 고용한다.
거친 인생을 살아온 토니 발레롱가와 교양과 기품을 지키며 살아온 돈 셜리 박사. 생각, 행동, 말투, 취향까지 달라도 너무 다른 두 사람은 그들을 위한 여행안내서 ‘그린북’에 의존해 특별한 남부 투어를 시작하는데…  ',
      '비고 모텐슨, 마허샬라 알리','2019-01-02','hee');

insert into movie
(movie_code, movie_title, movie_img, genre, country, director, movie_grade, runningtime,
playdate, synopsis, actor, movie_date, admin_id)
values (movie_code,'드래곤 길들이기3','train_your_dragon3.png','애니메이션','미국','딘 데블로이스','PG','104',
      '2019-01-30','영원히 기억될 그들의 마지막 모험이 시작된다!
영원한 친구 히컵과 투슬리스의 활약으로
 사람과 드래곤이 공존하며 평화롭게 살아가는 버크섬.
 새로운 드래곤 ‘라이트 퓨어리’를 쫓아간 투슬리스를 찾다가
 히컵은 누구도 찾지 못했던 드래곤의 파라다이스 ‘히든월드’를 우연히 발견하게 된다.
 하지만 평화도 잠시, 역대 최악의 드래곤 헌터 그리멜의 등장으로
 드래곤들의 안전과 버크섬의 평화까지 위협받기 시작하는데…',
      '제이 바루첼, 아메리카 페레라','2019-01-20','young');

insert into movie
(movie_code, movie_title, movie_img, genre, country, director, movie_grade, runningtime,
playdate, synopsis, actor, movie_date, admin_id)
values (movie_code,'말모이','the_secret_mission.png','드라마','한국이','엄유나','PG','135',
      '2019-01-09','1940년대 우리말이 점점 사라져가고 있는 경성.
 극장에서 해고된 후 아들 학비 때문에 가방을 훔치다 실패한 판수.
 하필 면접 보러 간 조선어학회 대표가 가방 주인 정환이다.
 사전 만드는데 전과자에다 까막눈이라니!
 그러나 판수를 반기는 회원들에 밀려 정환은 읽고 쓰기를 떼는 조건으로 그를 받아들인다.
 돈도 아닌 말을 대체 왜 모으나 싶었던 판수는 난생처음 글을 읽으며 우리말의 소중함에 눈뜨고,
 정환 또한 전국의 말을 모으는 ‘말모이’에 힘을 보태는 판수를 통해 ‘우리’의 소중함에 눈뜬다.
 얼마 남지 않은 시간, 바짝 조여오는 일제의 감시를 피해 ‘말모이’를 끝내야 하는데…

 우리말이 금지된 시대, 말과 마음이 모여 사전이 되다.',
      '유해진,윤계상','2019-01-02','sso');

insert into movie
(movie_code, movie_title, movie_img, genre, country, director, movie_grade, runningtime,
playdate, synopsis, actor, movie_date, admin_id)
values (movie_code,'일일시호일','every_day_a_good_day.png','드라마','일본','오모리 타츠시','PG','100',
      '2019-01-17','키키 키린, 그녀가 건넨 일상의 따스함
“당신의 일상이 변하는 차 한 잔의 마법”

스무살의 노리코는 아직 자신이 하고 싶은 것을 찾지 못했다.
우연히 시작하게 된 다도가 그녀의 일상에 스며들면서
취업의 문턱에서 좌절할 때에도
소중한 사람을 잃고 마음의 방황기를 거칠 때에도
따스한 찻물이 그녀의 매일매일을 채우기 시작한다.',
      '키키 키린, 쿠로키 하루','2019-01-10','hee');

commit;

--------------------------Data for table theater-----------------------------------
insert into theater(screen_name, screen_price, seat_count)
values('N', 20000, 20);

insert into theater(screen_name, screen_price, seat_count)
values('P', 40000, 10);

commit;

--------------------------Data for table on_screen---------------------------------
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901290830', '2019-01-29', '0830', '1045', 'M_000020', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901291045', '2019-01-29', '1045', '1300', 'M_000020', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901291300', '2019-01-29', '1300', '1440', 'M_000021', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901291440', '2019-01-29', '1440', '1650', 'M_000018', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901291650', '2019-01-29', '1650', '1911', 'M_000016', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901291911', '2019-01-29', '1911', '2132', 'M_000016', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901292132', '2019-01-29', '2132', '0117', 'M_000016', 'N');

insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901290830', '2019-01-29', '0830', '1045', 'M_000020', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901291045', '2019-01-29', '1045', '1300', 'M_000020', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901291300', '2019-01-29', '1300', '1440', 'M_000021', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901291440', '2019-01-29', '1440', '1650', 'M_000018', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901291650', '2019-01-29', '1650', '1911', 'M_000016', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901291911', '2019-01-29', '1911', '2132', 'M_000016', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901292132', '2019-01-29', '2132', '0117', 'M_000016', 'P');

insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901300900', '2019-01-30', '0900', '1140', 'M_000021', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901301140', '2019-01-30', '1140', '1350', 'M_000021', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901301350', '2019-01-30', '1350', '1604', 'M_000019', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901301604', '2019-01-30', '1604', '1847', 'M_000017', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901301847', '2019-01-30', '1847', '2130', 'M_000017', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901302130', '2019-01-30', '2130', '2344', 'M_000019', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901302344', '2019-01-30', '2344', '0203', 'M_000016', 'N');

insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901300900', '2019-01-30', '0900', '1140', 'M_000021', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901301140', '2019-01-30', '1140', '1350', 'M_000021', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901301350', '2019-01-30', '1350', '1604', 'M_000019', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901301604', '2019-01-30', '1604', '1847', 'M_000017', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901301847', '2019-01-30', '1847', '2130', 'M_000017', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901302130', '2019-01-30', '2130', '2344', 'M_000019', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901302344', '2019-01-30', '2344', '0203', 'M_000016', 'P');

commit;


--------------------------Data for table book--------------------------------------
insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000016',trim(to_char(seq_book.nextval,'000'))),2,to_date('2019-01-22 11:20:45','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-29 16:50','yyyy-mm-dd hh24:mi'),'harvard17','N_1901291650');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000016',trim(to_char(seq_book.nextval,'000'))),3,to_date('2019-01-23 15:15:15','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-29 16:50','yyyy-mm-dd hh24:mi'),'seojin2','N_1901291650');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000016',trim(to_char(seq_book.nextval,'000'))),1,to_date('2019-01-22 08:29:15','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-29 16:50','yyyy-mm-dd hh24:mi'),'jjini83','N_1901291650');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000016',trim(to_char(seq_book.nextval,'000'))),1,to_date('2019-01-28 19:35:55','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-29 16:50','yyyy-mm-dd hh24:mi'),'pyramid_top','N_1901291650');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000021',trim(to_char(seq_book.nextval,'000'))),7,to_date('2019-01-24 20:20:35','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-30 11:40','yyyy-mm-dd hh24:mi'),'mamasang','N_1901301140');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000021',trim(to_char(seq_book.nextval,'000'))),3,to_date('2019-01-26 16:35:56','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-30 11:40','yyyy-mm-dd hh24:mi'),'pyramid_top','N_1901301140');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000021',trim(to_char(seq_book.nextval,'000'))),2,to_date('2019-01-29 12:20:35','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-30 11:40','yyyy-mm-dd hh24:mi'),'doctor_seul','N_1901301140');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000021',trim(to_char(seq_book.nextval,'000'))),2,to_date('2019-01-30 11:03:35','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-30 11:40','yyyy-mm-dd hh24:mi'),'','N_1901301140');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000020',trim(to_char(seq_book.nextval,'000'))),2,to_date('2019-01-24 09:07:05','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-29 08:30','yyyy-mm-dd hh24:mi'),'stealjam','P_1901290830');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000020',trim(to_char(seq_book.nextval,'000'))),2,to_date('2019-01-29 08:17:05','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-29 08:30','yyyy-mm-dd hh24:mi'),'','P_1901290830');

commit;

--------------------------Data for table standard_seat-----------------------------
insert into standard_seat(seat_num, book_number)
values(11,'NM_000016091');

insert into standard_seat(seat_num, book_number)
values(12,'NM_000016091');

insert into standard_seat(seat_num, book_number)
values(5,'NM_000021097');

insert into standard_seat(seat_num, book_number)
values(6,'NM_000021097');

commit;

--------------------------Data for table primium_seat------------------------------
insert into primium_seat(seat_num, book_number)
values(10,'NM_000020099');

insert into primium_seat(seat_num, book_number)
values(11,'NM_000020099');

insert into primium_seat(seat_num, book_number)
values(19,'NM_000020102');

insert into primium_seat(seat_num, book_number)
values(20,'NM_000020102');

commit;

--------------------------Data for table rating------------------------------------
insert into rating(book_number, movie_rate, review, member_id)
values('NM_000020099',8,'보통사람의 작은힘이모여 큰뜻을 이루는 우리이야기 독립이 총칼로만 하는게 아니라 우리가모여 우리의 말과 글로 할수있다는거 일깨워준다. 너무 감명깊다!!','stealjam');

insert into rating(book_number, movie_rate, review, member_id)
values('NM_000016091',7,'가볍게 보기 좋은 영화인거같아요~~ 웃으면서 보고 나왔네요 ㅎㅎ','harvard17');

insert into rating(book_number, movie_rate, review, member_id)
values('NM_000021095',10,'작은 찻잔과 좁은 다실 안에 계절과 세월 그리고 인생과 성장을 차곡차곡 쌓아올린 영화... 키키 키린님의 극중 대사들이 마치 마지막 작별인사인 듯 해서 너무 슬프네요ㅠㅠ','mamasang');

insert into rating (book_number, movie_rate, review, member_id)
values('NM_000016092', '7',
'개인적으로 이번 작품은 쉴 새없이 몰아치는 유머들로 약간 지치는 감이 없지 않아 있다. 적절한 사운드 활용으로 액션 시에서의 시원함이 배가 된다. 가볍에 즐기기에 좋은 영화이다.','seojin2');

insert into rating (book_number, movie_rate, review, member_id)
values('NM_000016093', 8, '러닝 타임 내내 웃으며 스트레스 날려버릴 수 있는 영화입니다!! 뻔한 코미디 영화일까봐 볼까 말까 고민하시는 분들, 그냥 믿고 보셔도 후회 없으실거라고 생각합니다~! 쬰잼!','jjini83');

insert into rating (book_number, movie_rate, review, member_id)
values('NM_000021096', 9, '선에 입각하여 육신의 희노애락에 집착을 벚어 던지면 슬픔과 기쁨을 초월한다.
슬픔도 계속 슬프지 않고 기쁨도 계속 기쁘지 않다. 시간은 흐르고 항상변화하여 다르다.
때문에 슬픔에 집착하지 않고 기쁨에 집착하지 않으면 지금에 충실하게 된다.
영화에서는 이러한 다도의 선사상을 일일시호일의 선문으로서 말한다. 침묵하고 행동하며 느낀다. 다도란 선의 수행이다.','pyramid_top');

commit;

--------------------------Data for table snack--------------------------------
insert into snack(snack_name, snack_price, snack_img, snack_info, snack_date)
values('카라멜팝콘',6000,'caramel_popcorn.png','달콤한 카라멜 향이 가득한 카라멜팝콘을 즐겨보세요!', '2016-08-14');
insert into snack(snack_name, snack_price, snack_img, snack_info, snack_date)
values('콜라',2000,'cola.png','언제 어디서나 이 맛, 이 느낌!', '2017-04-25');
insert into snack(snack_name, snack_price, snack_img, snack_info, snack_date)
values('고소팝콘',5000,'normal_popcorn.png','옥수수 본연의 맛을 즐길 수 있는 짭짜름한 클래식 고소팝콘!', '2018-05-12');
insert into snack(snack_name, snack_price, snack_img, snack_info, snack_date)
values('나쵸',4500,'nacho.png','바삭바삭한 나쵸에 칠리치즈 조합, 여기가 바로 멕시코!?', '2018-01-08');
insert into snack(snack_name, snack_price, snack_img, snack_info, snack_date)
values('맥반석오징어',7000,'grilled_squid.png','씹고 뜯고 맛보고 즐기고~!', '2019-01-24');
insert into snack(snack_name, snack_price, snack_img, snack_info, snack_date)
values('물',2000,'water.png','아무것도 싫은 당신, 물이라도 드시옵소서', '2018-06-04');
insert into snack(snack_name, snack_price, snack_img, snack_info, snack_date)
values('아메리카노',3500,'americano.png','졸지말고 커피 한 잔', '2019-01-02');

commit;

--------------------------Data for table snack_sale--------------------------------
insert into snack_sale(snack_order_num, quan, exchange, snack_sale_date, snack_name, member_id)
values('SOR_01231901', 2, 'Y', to_date('2019-01-23 15:15:15','yyyy-mm-dd hh24:mi:ss'), '콜라','seojin2');
insert into snack_sale(snack_order_num, quan, exchange, snack_sale_date, snack_name, member_id)
values('SOR_01281902', 4, 'Y', to_date('2019-01-29 12:20:35','yyyy-mm-dd hh24:mi:ss'), '카라멜팝콘','doctor_seul');
insert into snack_sale(snack_order_num, quan, exchange, snack_sale_date, snack_name, member_id)
values('SOR_01031903', 1, 'N', to_date('2019-01-29 16:37:15','yyyy-mm-dd hh24:mi:ss'), '맥반석오징어','');
insert into snack_sale(snack_order_num, quan, exchange, snack_sale_date, snack_name, member_id)
values('SOR_01141904', 2, 'N', to_date('2019-01-30 11:19:49','yyyy-mm-dd hh24:mi:ss'), '나쵸','');
insert into snack_sale(snack_order_num, quan, exchange, snack_sale_date, snack_name, member_id)
values('SOR_01111905', 1, 'N', to_date('2019-01-30 11:31:24','yyyy-mm-dd hh24:mi:ss'), '카라멜팝콘','');
insert into snack_sale(snack_order_num, quan, exchange, snack_sale_date, snack_name, member_id)
values('SOR_01191906', 3, 'Y', to_date('2019-01-24 20:20:35','yyyy-mm-dd hh24:mi:ss'), '나쵸','mamasang');
select * from snack_sale;

commit;

