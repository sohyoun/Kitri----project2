--memberDetail 테이블 생성
ALTER TABLE Member_detail
	DROP
		CONSTRAINT FK_Member_TO_Member_detail
		CASCADE;

ALTER TABLE Member_detail
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Member_detail;

/* 회원상세 */
DROP TABLE Member_detail 
	CASCADE CONSTRAINTS;

/* 회원상세 */
CREATE TABLE Member_detail (
	email VARCHAR2(32) NOT NULL, /* 이메일 */
	address VARCHAR2(100), /* 주소 */
	address_detail VARCHAR2(100), /* 상세주소 */
	joindate DATE, /* 가입일 */
	outdate DATE /* 탈퇴일 */
);

COMMENT ON TABLE Member_detail IS '회원상세';

COMMENT ON COLUMN Member_detail.email IS '이메일';

COMMENT ON COLUMN Member_detail.address IS '주소';

COMMENT ON COLUMN Member_detail.address_detail IS '상세주소';

COMMENT ON COLUMN Member_detail.joindate IS '가입일';

COMMENT ON COLUMN Member_detail.outdate IS '탈퇴일';

CREATE UNIQUE INDEX PK_Member_detail
	ON Member_detail (
		email ASC
	);

ALTER TABLE Member_detail
	ADD
		CONSTRAINT PK_Member_detail
		PRIMARY KEY (
			email
		);

ALTER TABLE Member_detail
	ADD
		CONSTRAINT FK_Member_TO_Member_detail
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		);