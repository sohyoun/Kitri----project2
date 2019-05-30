--Member생성

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
		
		
----memberDetail 테이블 생성
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
		
		
--여행 DB 생성
create SEQUENCE sq_tripbasic_tripseq;
ALTER TABLE Trip_Basic
	DROP
		CONSTRAINT FK_Member_TO_Trip_Basic
		CASCADE;

ALTER TABLE Trip_Basic
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Trip_Basic;

/* 여행일정 */
DROP TABLE Trip_Basic 
	CASCADE CONSTRAINTS;

/* 여행일정 */
CREATE TABLE Trip_Basic (
	trip_seq NUMBER NOT NULL, /* 여행id */
	email VARCHAR2(35) NOT NULL, /* 이메일 */
	trip_title VARCHAR2(50) NOT NULL, /* 여행이름 */
	trip_theme VARCHAR2(15) NOT NULL, /* 여행테마 */
	trip_season VARCHAR2(4) NOT NULL, /* 여행시즌 */
	start_date DATE DEFAULT sysdate NOT NULL, /* 출발일 */
	end_date DATE DEFAULT sysdate NOT NULL, /* 종료일 */
	viewCount NUMBER, /* 조회수 */
	likeCount NUMBER, /* 추천수 */
	lastUpDate DATE NOT NULL /* 최종수정일 */,
	isComplete VARCHAR2(1) NOT NULL /* 완료여부 */
);

COMMENT ON TABLE Trip_Basic IS '여행일정';

COMMENT ON COLUMN Trip_Basic.trip_seq IS '여행id';

COMMENT ON COLUMN Trip_Basic.email IS '이메일';

COMMENT ON COLUMN Trip_Basic.trip_title IS '여행이름';

COMMENT ON COLUMN Trip_Basic.trip_theme IS '여행테마';

COMMENT ON COLUMN Trip_Basic.trip_season IS '여행시즌';

COMMENT ON COLUMN Trip_Basic.start_date IS '출발일';

COMMENT ON COLUMN Trip_Basic.end_date IS '종료일';

COMMENT ON COLUMN Trip_Basic.viewCount IS '조회수';

COMMENT ON COLUMN Trip_Basic.likeCount IS '추천수';

COMMENT ON COLUMN Trip_Basic.lastUpDate IS '최종수정일';

COMMENT ON COLUMN Trip_Basic.isComplete IS '완료여부';

CREATE UNIQUE INDEX PK_Trip_Basic
	ON Trip_Basic (
		trip_seq ASC
	);

ALTER TABLE Trip_Basic
	ADD
		CONSTRAINT PK_Trip_Basic
		PRIMARY KEY (
			trip_seq
		);

ALTER TABLE Trip_Basic
	ADD
		CONSTRAINT FK_Member_TO_Trip_Basic
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		);
		
--여행상세 테이블 생성
ALTER TABLE Trip_Detail
	DROP
		CONSTRAINT FK_Trip_Basic_TO_Trip_Detail
		CASCADE;

ALTER TABLE Trip_Detail
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Trip_Detail;

/* 여행일정_상세 */
DROP TABLE Trip_Detail 
	CASCADE CONSTRAINTS;

/* 여행일정_상세 */
CREATE TABLE Trip_Detail (
	trip_order NUMBER NOT NULL, /* 순서 */
	trip_day NUMBER NOT NULL, /* 일차 */
	place_name VARCHAR2(50) NOT NULL, /* 장소이름 */
	loc_id NUMBER NOT NULL, /* 지역코드 */
	trip_seq NUMBER, /* 여행id */
	image VARCHAR2(200), /* 이미지 */
	detail_title VARCHAR2(50) NOT NULL, /* 일정제목 */
	detail_content CLOB, /* 일정설명 */
	posx FLOAT, /* x좌표 */
	posy FLOAT /* y좌표 */
);

COMMENT ON TABLE Trip_Detail IS '여행일정_상세';

COMMENT ON COLUMN Trip_Detail.trip_order IS '순서';

COMMENT ON COLUMN Trip_Detail.trip_day IS '일차';

COMMENT ON COLUMN Trip_Detail.place_name IS '장소이름';

COMMENT ON COLUMN Trip_Detail.loc_id IS '지역코드';

COMMENT ON COLUMN Trip_Detail.trip_seq IS '여행id';

COMMENT ON COLUMN Trip_Detail.image IS '이미지';

COMMENT ON COLUMN Trip_Detail.detail_title IS '일정제목';

COMMENT ON COLUMN Trip_Detail.detail_content IS '일정설명';

COMMENT ON COLUMN Trip_Detail.posx IS 'x좌표';

COMMENT ON COLUMN Trip_Detail.posy IS 'y좌표';

CREATE UNIQUE INDEX PK_Trip_Detail
	ON Trip_Detail (
		trip_order ASC,
		trip_day ASC
	);

ALTER TABLE Trip_Detail
	ADD
		CONSTRAINT PK_Trip_Detail
		PRIMARY KEY (
			trip_order,
			trip_day
		);

ALTER TABLE Trip_Detail
	ADD
		CONSTRAINT FK_Trip_Basic_TO_Trip_Detail
		FOREIGN KEY (
			trip_seq
		)
		REFERENCES Trip_Basic (
			trip_seq
		);