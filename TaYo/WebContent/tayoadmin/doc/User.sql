
//유저기본테이블 생성 
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

//유저상세테이블 생성
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
