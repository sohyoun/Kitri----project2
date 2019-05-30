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
	trip_num NUMBER(3) NOT NULL, /* 여행정원 */
	start_date DATE DEFAULT sysdate NOT NULL, /* 출발일 */
	end_date DATE DEFAULT sysdate NOT NULL, /* 종료일 */
	viewCount NUMBER, /* 조회수 */
	likeCount NUMBER, /* 추천수 */
	lastUpDate DATE NOT NULL, /* 최종수정일 */
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

COMMENT ON COLUMN Trip_Basic.trip_num IS '여행정원';

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