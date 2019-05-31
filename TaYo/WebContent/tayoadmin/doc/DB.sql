
유저기본테이블 생성 
// USER_TAYO
CREATE TABLE user_tayo (
	email VARCHAR2(35) NOT NULL,
	name VARCHAR2(5) NOT NULL,
	pass VARCHAR(50) NOT NULL,
	age NUMBER,
	grade NUMBER NOT NULL,
	gender VARCHAR2(10),
CONSTRAINT email_pk PRIMARY KEY (email)
);

유저상세테이블 생성
//USERDETAIL_TAYO
CREATE TABLE userdetail_tayo(
	email VARCHAR2(35) NOT NULL,
	adrress VARCHAR2(50),
	address_detail VARCHAR2(50),
	joindate DATE,
	outdate	 DATE,
CONSTRAINT email_fk FOREIGN KEY (email) REFERENCES user_tayo(email)
);


유저 테이블 삽입
INSERT INTO user_tayo (email, name, pass, age, grade, gender)
VALUES ('이메일', 'eui', '1234', 31, 1, 'M');

유저 상세테이블 삽입
INSERT INTO userdetail_tayo (email, address, joindate, outdate)
VALUES ('12.12kimiyeon@gmail.com', '서울시', sysdate, 'null');

SELECT *
FROM user_tayo u, userdetail_tayo ud
WHERE u.email = ud.email;

INSERT ALL
			 INTO user_tayo (email, name, pass, age, grade, gender)
			 VALUES ('이메일','이름','패스워드','31',1,'M')
			 INTO userdetail_tayo (email, address, address_detail, joindate, outdate)
			 VALUES('이메일','주소','상세주소',sysdate,null)
SELECT * FROM DUAL;


회원목록테이블 글번호 생성
CREATE SEQUENCE board_seq;

회원목록테이블 생성
CREATE TABLE memberlist (
	board_seq number NOT NULL,
	prarent_seq number,
	email VARCHAR2(35) NOT NULL,
	name VARCHAR2(10) NOT NULL,
	age number,
	address VARCHAR2(30),
	address_detail VARCHAR2(50),
	gender VARCHAR(2),
	grade number,
	CONSTRAINT board_seq_pk PRIMARY KEY (board_seq)
);