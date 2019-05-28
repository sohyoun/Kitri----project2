ALTER TABLE Member
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Member;

/* 회원 */
DROP TABLE Member 
	CASCADE CONSTRAINTS;

/* 회원 */
CREATE TABLE Member (
	email VARCHAR2(35) NOT NULL, /* 이메일 */
	name VARCHAR2(10) NOT NULL, /* 이름 */
	pass VARCHAR2(35) NOT NULL, /* 패스워드 */
	age NUMBER(3), /* 나이 */
	grade NUMBER(1) NOT NULL, /* 등급 */
	gender VARCHAR2(2) /* 성별 */
);

COMMENT ON TABLE Member IS '회원';

COMMENT ON COLUMN Member.email IS '이메일';

COMMENT ON COLUMN Member.name IS '이름';

COMMENT ON COLUMN Member.pass IS '패스워드';

COMMENT ON COLUMN Member.age IS '나이';

COMMENT ON COLUMN Member.grade IS '등급';

COMMENT ON COLUMN Member.gender IS '성별';

CREATE UNIQUE INDEX PK_Member
	ON Member (
		email ASC
	);

ALTER TABLE Member
	ADD
		CONSTRAINT PK_Member
		PRIMARY KEY (
			email
		);