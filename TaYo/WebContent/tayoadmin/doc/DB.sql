관리자 테이블 생성
CREATE TABLE admin (
	admin_email VARCHAR2(35) NOT NULL,
	admin_name VARCHAR2(20) NOT NULL,
	admin_pass VARCHAR(50) NOT NULL,
CONSTRAINT admin_email_pk PRIMARY KEY (admin_email)
);

관리자테이블 삽입
INSERT INTO admin(admin_email, admin_name, admin_pass)
VALUES ('email', '김', 1234);

유저기본테이블 생성 
CREATE TABLE user_tayo (
	email VARCHAR2(35) NOT NULL,
	name VARCHAR2(5) NOT NULL,
	pass VARCHAR(50) NOT NULL,
	age NUMBER,
	gender VARCHAR2(10),
	grade NUMBER NOT NULL, 
CONSTRAINT email_pk PRIMARY KEY (email),
CONSTRAINT grade_ck CHECK (grade <= 3)
);

//유저테이블 삭제
DROP TABLE user_tayo;

유저상세테이블 생성
//USERDETAIL_TAYO
CREATE TABLE userdetail_tayo(
	email VARCHAR2(35) NOT NULL,
	address VARCHAR2(50),
	address_detail VARCHAR2(50),
	joindate DATE DEFAULT sysdate,
	outdate	 DATE,
CONSTRAINT email_fk FOREIGN KEY (email) REFERENCES user_tayo(email)
);

//유저상세테이블 삭제
DROP TABLE userdetail_tayo;

유저 테이블 삽입
INSERT INTO user_tayo (email, name, pass, age, grade, gender)
VALUES ('이메일', 'eui', '1234', 31, 1, 'M');

유저 상세테이블 삽입
INSERT INTO userdetail_tayo (email, address, address_detail, outdate)
VALUES ('12.12kimiyeon@gmail.com', '서울시', '금천구', 'null');


SELECT *
FROM user_tayo u, userdetail_tayo ud
WHERE u.email = ud.email;

INSERT ALL
	INTO user_tayo (email, name, pass, age, grade, gender)
	VALUES ('이메일','이름','패스워드', 31, 1, 'M')
	INTO userdetail_tayo (email, address, address_detail, outdate)
	VALUES('이메일','주소','상세주소',null)
SELECT * FROM DUAL;


//회원목록테이블 글번호 생성
CREATE SEQUENCE mboard_seq;

//회원목록테이블 글번호 삭제 
DROP SEQUENCE mboard_seq;

//회원목록테이블 생성
CREATE TABLE MEMBERBOARD (
	mboard_seq number NOT NULL,
	member_email VARCHAR2(35) NOT NULL,
	member_name VARCHAR2(10) NOT NULL,
	member_age number,
	member_address VARCHAR2(30),
	member_address_detail VARCHAR2(50),
	member_joindate DATE DEFAULT sysdate,
	member_outdate DATE,
	member_grade number,
	member_gender VARCHAR(2),
	CONSTRAINT mboard_seq_pk PRIMARY KEY (mboard_seq)
	CONSTRAINT grade_ck CHECK (member_grade <= 3)
);

회원목록테이블계산 
SELECT *
FROM(SELECT rownum r, memberboard.* 
	 FROM memberboard
	 START WITH parent_seq = 0 
	 CONNECT BY PRIOR board_seq = parent_seq 
	 ORDER SIBLINGS BY board_seq DESC)
WHERE r BETWEEN ? AND ?;


회원목록테이블 가입일을 기준으로 가입 회원수 체크
SELECT COUNT(joindate)
FROM memberboard;

//회원목록테이블 삽입
INSERT INTO memberboard (mboard_seq, member_email, member_name, member_age, member_address, member_address_detail, member_outdate, member_grade, member_gender)
VALUES (mboard_seq.nextval, '1', '이름', 31, '3', '4', NULL, 0, 'M');

INSERT INTO memberboard (mboard_seq, member_email, member_name, member_age, member_address, member_address_detail, member_outdate, member_grade, member_gender)
VALUES (mboard_seq.nextval, '2', '이름2', 28, '4', '5', NULL, 1, 'F');

INSERT INTO memberboard (mboard_seq, member_email, member_name, member_age, member_address, member_address_detail, member_outdate, member_grade, member_gender)
VALUES (mboard_seq.nextval, '3', '이름3', 25, '5', '6', NULL, 2, 'M');

INSERT INTO memberboard (mboard_seq, member_email, member_name, member_age, member_address, member_address_detail, member_outdate, member_grade, member_gender)
VALUES (mboard_seq.nextval, '4', '이름4', 31, '6', '7', NULL, 3, 'M');

INSERT INTO memberboard (mboard_seq, member_email, member_name, member_age, member_address, member_address_detail, member_outdate, member_grade, member_gender)
VALUES (mboard_seq.nextval, '5', '이름5', 36, '7', '8', NULL, 0, 'M');

//회원목록테이블 삭제
DROP TABLE memberboard;

//공지게시판테이블 생성
CREATE TABLE GONGGIBOARD(
 GBOARD_SEQ              NUMBER(10)  primary key,
 GBOARD_GROUP VARCHAR2(10), 
 GBOARD_SUBJECT        VARCHAR2(255),
 GBOARD_WRITER          VARCHAR2(100),
 GBOARD_CONTENTS     VARCHAR2(4000),
 GBOARD_DATE            TIMESTAMP(6),
 GBOARD_VIEWCOUNT    NUMBER(6)
);

CREATE sequence gboard_seq;

현재페이지//이전//시작페이지///끝페이지//다음 
1	     X	     1		3	  O
4	     O       4		6	  O
7	     O       7		9      	  O
10	     O	     10		10	  x 

총 페이지 계산 작업이 필요 