관리자 테이블 생성
CREATE TABLE admin (
	admin_email VARCHAR2(35) NOT NULL,
	admin_name VARCHAR2(20)) NOT NULL,
	admin_pass VARCHAR(50) NOT NULL,
CONSTRAINT admin_email_pk PRIMARY KEY (admin_email)
);

관리자테이블 삽입
INSERT INTO admin(admin_email, admin_name, admin_pass)
VALUES ('email', '김', 1234);

유저기본테이블 생성 
// USER_TAYO
CREATE TABLE user_tayo (
	email VARCHAR2(35) NOT NULL,
	name VARCHAR2(5) NOT NULL,
	pass VARCHAR(50) NOT NULL,
	age NUMBER,
	gender VARCHAR2(10),
	grade NUMBER NOT NULL,
CONSTRAINT email_pk PRIMARY KEY (email)
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
CREATE SEQUENCE board_seq;

DELETE SEQUENCE board_seq;

//회원목록테이블 생성
CREATE TABLE memberlist (
	board_seq number NOT NULL,
	parent_seq number,
	email VARCHAR2(35) NOT NULL,
	name VARCHAR2(10) NOT NULL,
	age number,
	address VARCHAR2(30),
	address_detail VARCHAR2(50),
	joindate DATE DEFAULT sysdate,
	outdate DATE,
	grade number,
	gender VARCHAR(2),
	CONSTRAINT board_seq_pk PRIMARY KEY (board_seq)
);

회원목록테이블계산 
SELECT *
FROM(SELECT rownum r, memberlist.* 
	 FROM memberlist
	 START WITH parent_seq = 0 
	 CONNECT BY PRIOR board_seq = parent_seq 
	 ORDER SIBLINGS BY board_seq DESC)
WHERE r BETWEEN ? AND ?;


회원목록테이블 가입일을 기준으로 가입 회원수 체크
SELECT COUNT(joindate)
FROM memberlist;

//회원목록테이블 삽입
INSERT INTO memberlist (board_seq, parent_seq, email, name, age, address, address_detail, outdate, grade, gender)
VALUES (board_seq.nextval, 0, '1', '2', 31, '3', '4', NULL, 0, 'M');

INSERT INTO memberlist (board_seq, parent_seq, email, name, age, address, address_detail, outdate, grade, gender)
VALUES (board_seq.nextval, 0, '2', '3', 28, '4', '5', NULL, 1, 'F');

INSERT INTO memberlist (board_seq, parent_seq, email, name, age, address, address_detail, outdate, grade, gender)
VALUES (board_seq.nextval, 0, '3', '4', 25, '5', '6', NULL, 2, 'M');

INSERT INTO memberlist (board_seq, parent_seq, email, name, age, address, address_detail, outdate, grade, gender)
VALUES (board_seq.nextval, 0, '4', '5', 31, '6', '7', NULL, 3, 'M');

//회원목록테이블 삭제
DROP TABLE memberlist;