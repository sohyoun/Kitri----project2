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
	CONSTRAINT mboard_seq_pk PRIMARY KEY (mboard_seq),
	CONSTRAINT grade_ck CHECK (member_grade <= 3)
);

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

//회원목록테이블 가입일을 기준으로 가입 회원수 체크
SELECT COUNT(joindate)
FROM memberboard;

//회원목록테이블 삭제
DROP TABLE memberboard;





현재페이지//이전//시작페이지///끝페이지//다음 
1	     X	     1		3	  O
4	     O       4		6	  O
7	     O       7		9      	  O
10	     O	     10		10	  x 

총 페이지 계산 작업이 필요 
