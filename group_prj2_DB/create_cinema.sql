/* 관리자 정보 */
DROP TABLE admin
	CASCADE CONSTRAINTS;

/* 영화 */
DROP TABLE movie
	CASCADE CONSTRAINTS;

/* 예매 */
DROP TABLE book
	CASCADE CONSTRAINTS;

/* 회원 */
DROP TABLE member
	CASCADE CONSTRAINTS;

/* 상영관 */
DROP TABLE theater
	CASCADE CONSTRAINTS;

/* 스낵 */
DROP TABLE snack
	CASCADE CONSTRAINTS;

/* 평가 */
DROP TABLE rating
	CASCADE CONSTRAINTS;

/* 스낵판매정보 */
DROP TABLE snack_sale
	CASCADE CONSTRAINTS;

/* 상영 */
DROP TABLE on_screen
	CASCADE CONSTRAINTS;

/* 스탠다드 좌석 */
DROP TABLE standard_seat
	CASCADE CONSTRAINTS;

/* 프리미엄 좌석 */
DROP TABLE primium_seat
	CASCADE CONSTRAINTS;

/* 관리자 정보 */
CREATE TABLE admin (
	admin_id VARCHAR2(30) NOT NULL, /* 관리자 아이디 */
	name VARCHAR2(30) NOT NULL, /* 이름 */
	password VARCHAR2(30) NOT NULL, /* 비밀번호 */
	hiredate DATE DEFAULT sysdate NOT NULL /* 입사일 */
);

ALTER TABLE admin
	ADD
		CONSTRAINT PK_admin
		PRIMARY KEY (
			admin_id
		);

/* 영화 */
CREATE TABLE movie (
	movie_code CHAR(8) NOT NULL, /* 영화코드 */
	movie_title VARCHAR2(100) NOT NULL, /* 영화 제목 */
	movie_img VARCHAR2(30) NOT NULL, /* 영화 포스터 */
	genre VARCHAR2(30) NOT NULL, /* 장르 */
	country VARCHAR2(20) NOT NULL, /* 제작국가 */
	director VARCHAR2(50) NOT NULL, /* 감독 */
	movie_grade CHAR(2) NOT NULL, /* 영화 등급 */
	runningtime NUMBER(3) NOT NULL, /* 러닝타임 */
	playdate VARCHAR2(10) NOT NULL, /* 개봉일 */
	synopsis VARCHAR2(2000) NOT NULL, /* 줄거리 */
	actor VARCHAR2(50) NOT NULL, /* 출연진 */
	movie_date DATE DEFAULT sysdate NOT NULL, /* 영화 등록일 */
	admin_id VARCHAR2(30) NOT NULL /* 관리자 아이디 */
);

ALTER TABLE movie
	ADD
		CONSTRAINT PK_movie
		PRIMARY KEY (
			movie_code
		);

/* 예매 */
CREATE TABLE book (
	book_number CHAR(12) NOT NULL, /* 예매번호 */
	personnel NUMBER(2) NOT NULL, /* 인원 */
	payment_date DATE DEFAULT sysdate NOT NULL, /* 결제일시 */
	movie_start DATE NOT NULL, /* 영화상영일시 */
	member_id VARCHAR2(30), /* 회원 아이디 */
	screen_num CHAR(12) NOT NULL /* 상영번호 */
);

ALTER TABLE book
	ADD
		CONSTRAINT PK_book
		PRIMARY KEY (
			book_number
		);

/* 회원 */
CREATE TABLE member (
	member_id VARCHAR2(30) NOT NULL, /* 회원 아이디 */
	password VARCHAR2(30) NOT NULL, /* 비밀번호 */
	name VARCHAR2(30) NOT NULL, /* 이름 */
	birthdate VARCHAR2(8) NOT NULL, /* 생년월일 */
	phone VARCHAR2(13) NOT NULL, /* 휴대폰번호 */
	membership CHAR(1) NOT NULL, /* 회원등급 */
	hold_point NUMBER(6), /* 보유 포인트 */
	acc_point NUMBER(6), /* 누적 포인트 */
	input_date DATE DEFAULT sysdate NOT NULL /* 회원가입일 */
);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			member_id
		);

/* 상영관 */
CREATE TABLE theater (
	screen_name CHAR(1) NOT NULL, /* 상영관 이름 */
	screen_price NUMBER(5) NOT NULL, /* 가격 */
	seat_count NUMBER(2) NOT NULL /* 총 좌석수 */
);

ALTER TABLE theater
	ADD
		CONSTRAINT PK_theater
		PRIMARY KEY (
			screen_name
		);

/* 스낵 */
CREATE TABLE snack (
	snack_name VARCHAR2(20) NOT NULL, /* 스낵명 */
	snack_price NUMBER(5) NOT NULL, /* 가격 */
	snack_img VARCHAR2(30) NOT NULL, /* 이미지 */
	snack_info VARCHAR2(600), /* 스낵정보 */
	snack_date DATE NOT NULL /* 스낵등록일 */
);

ALTER TABLE snack
	ADD
		CONSTRAINT PK_snack
		PRIMARY KEY (
			snack_name
		);

/* 평가 */
CREATE TABLE rating (
	book_number CHAR(12) NOT NULL, /* 예매번호 */
	movie_rate NUMBER(2) NOT NULL, /* 평점 */
	review VARCHAR2(600), /* 평가내용 */
	member_id VARCHAR2(30) NOT NULL /* 회원 아이디 */
);

ALTER TABLE rating
	ADD
		CONSTRAINT PK_rating
		PRIMARY KEY (
			book_number
		);

/* 스낵판매정보 */
CREATE TABLE snack_sale (
	snack_order_num CHAR(12) NOT NULL, /* 스낵주문번호 */
	quan NUMBER(2) NOT NULL, /* 수량 */
	exchange CHAR(1) NOT NULL, /* 교환여부 */
	snack_sale_date DATE NOT NULL, /* 스낵판매일 */
	snack_name VARCHAR2(20) NOT NULL, /* 스낵명 */
	member_id VARCHAR2(30) /* 회원 아이디 */
);

ALTER TABLE snack_sale
	ADD
		CONSTRAINT PK_snack_sale
		PRIMARY KEY (
			snack_order_num
		);

/* 상영 */
CREATE TABLE on_screen (
	screen_num CHAR(12) NOT NULL, /* 상영번호 */
	screen_date VARCHAR2(10) NOT NULL, /* 상영날짜 */
	start_time VARCHAR2(4) NOT NULL, /* 상영 시작시간 */
	end_time VARCHAR2(4) NOT NULL, /* 상영 종료시간 */
	movie_code CHAR(8) NOT NULL, /* 영화코드 */
	screen_name CHAR(1) NOT NULL /* 상영관 이름 */
);

ALTER TABLE on_screen
	ADD
		CONSTRAINT PK_on_screen
		PRIMARY KEY (
			screen_num
		);

/* 스탠다드 좌석 */
CREATE TABLE standard_seat (
	seat_num NUMBER(2) NOT NULL, /* 좌석번호 */
	book_number CHAR(12) NOT NULL /* 예매번호 */
);

ALTER TABLE standard_seat
	ADD
		CONSTRAINT PK_standard_seat
		PRIMARY KEY (
			seat_num
		);

/* 프리미엄 좌석 */
CREATE TABLE primium_seat (
	seat_num NUMBER(2) NOT NULL, /* 좌석번호 */
	book_number CHAR(12) NOT NULL /* 예매번호 */
);

ALTER TABLE primium_seat
	ADD
		CONSTRAINT PK_primium_seat
		PRIMARY KEY (
			seat_num
		);

ALTER TABLE movie
	ADD
		CONSTRAINT FK_admin_TO_movie
		FOREIGN KEY (
			admin_id
		)
		REFERENCES admin (
			admin_id
		);

ALTER TABLE book
	ADD
		CONSTRAINT FK_member_TO_book
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE book
	ADD
		CONSTRAINT FK_on_screen_TO_book
		FOREIGN KEY (
			screen_num
		)
		REFERENCES on_screen (
			screen_num
		);

ALTER TABLE rating
	ADD
		CONSTRAINT FK_book_TO_rating
		FOREIGN KEY (
			book_number
		)
		REFERENCES book (
			book_number
		);

ALTER TABLE rating
	ADD
		CONSTRAINT FK_member_TO_rating
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE snack_sale
	ADD
		CONSTRAINT FK_snack_TO_snack_sale
		FOREIGN KEY (
			snack_name
		)
		REFERENCES snack (
			snack_name
		);

ALTER TABLE snack_sale
	ADD
		CONSTRAINT FK_member_TO_snack_sale
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE on_screen
	ADD
		CONSTRAINT FK_movie_TO_on_screen
		FOREIGN KEY (
			movie_code
		)
		REFERENCES movie (
			movie_code
		);

ALTER TABLE on_screen
	ADD
		CONSTRAINT FK_theater_TO_on_screen
		FOREIGN KEY (
			screen_name
		)
		REFERENCES theater (
			screen_name
		);

ALTER TABLE standard_seat
	ADD
		CONSTRAINT FK_book_TO_standard_seat
		FOREIGN KEY (
			book_number
		)
		REFERENCES book (
			book_number
		);

ALTER TABLE primium_seat
	ADD
		CONSTRAINT FK_book_TO_primium_seat
		FOREIGN KEY (
			book_number
		)
		REFERENCES book (
			book_number
		);
