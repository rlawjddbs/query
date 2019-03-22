/* 관리자 */
DROP TABLE lunch_admin
   CASCADE CONSTRAINTS;

/* 도시락 */
DROP TABLE lunch
   CASCADE CONSTRAINTS;

/* 주문 */
DROP TABLE ordering
   CASCADE CONSTRAINTS;

---------------------- DDL for table lunch_admin ------------------------
/* 관리자 */
CREATE TABLE lunch_admin (
   id VARCHAR2(20) NOT NULL, /* 아이디 */
   pass VARCHAR2(20) NOT NULL, /* 비밀번호 */
   name VARCHAR2(30) NOT NULL, /* 이름 */
   input_date DATE DEFAULT sysdate /* 입력일 */
);


CREATE UNIQUE INDEX PK_lunch_admin
   ON lunch_admin (
      id ASC
   );

ALTER TABLE lunch_admin
   ADD
      CONSTRAINT PK_lunch_admin
      PRIMARY KEY (
         id
      );

---------------------- DDL for table lunch ------------------------
/* 도시락 */
CREATE TABLE lunch (
   lunch_code CHAR(8) DEFAULT sysdate NOT NULL, /* 도시락의 코드 */
   lunch_name VARCHAR2(60) NOT NULL, /* 도시락명 */
   img VARCHAR2(90) NOT NULL, /* 단가 */
   price NUMBER(5) NOT NULL, /* 특징 */
   spec VARCHAR2(4000) NOT NULL, /* 이미지 */
   input_date DATE DEFAULT sysdate, /* 입력일 */
   id VARCHAR2(20) /* 아이디 */
);


CREATE UNIQUE INDEX PK_lunch
   ON lunch (
      lunch_code ASC
   );

ALTER TABLE lunch
   ADD
      CONSTRAINT PK_lunch
      PRIMARY KEY (
         lunch_code
      );


---------------------- DDL for table ordering ------------------------
/* 주문 */
CREATE TABLE ordering (
   order_num CHAR(12) DEFAULT sysdate NOT NULL, /* 주문번호 */
   quan NUMBER(2) NOT NULL, /* 수량 */
   order_name VARCHAR2(30) NOT NULL, /* 주문자명 */
   phone VARCHAR2(13) NOT NULL, /* 전화번호 */
   ip_address VARCHAR2(15) NOT NULL, /* 주문자의ip */
   order_date DATE DEFAULT sysdate, /* 주문일자 */
   status CHAR(1) DEFAULT  'N', /* 제작상태 */
   lunch_code CHAR(8), /* 도시락의 코드 */
   request VARCHAR2(2000)
);

CREATE UNIQUE INDEX PK_ordering
   ON ordering (
      order_num ASC
   );

ALTER TABLE ordering
   ADD
      CONSTRAINT PK_ordering
      PRIMARY KEY (
         order_num
      );

ALTER TABLE lunch
   ADD
      CONSTRAINT FK_lunch_id
      FOREIGN KEY (
         id
      )
      REFERENCES lunch_admin (
         id
      );

ALTER TABLE ordering
   ADD
      CONSTRAINT FK_lunch_code
      FOREIGN KEY (
         lunch_code
      )
      REFERENCES lunch (
         lunch_code
      );


                                                                                                                                              