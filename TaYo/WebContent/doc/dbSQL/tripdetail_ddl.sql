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
	trip_seq NUMBER NOT NULL, /* 여행id */
	place_name VARCHAR2(150) NOT NULL, /* 장소이름 */
	loc_id NUMBER NOT NULL, /* 지역코드 */
	image VARCHAR2(200), /* 이미지 */
	detail_title VARCHAR2(50), /* 일정제목 */
	detail_content VARCHAR2(400), /* 일정설명 */
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
		trip_seq ASC,
		trip_order ASC,
		trip_day ASC
	);

ALTER TABLE Trip_Detail
	ADD
		CONSTRAINT PK_Trip_Detail
		PRIMARY KEY (
			trip_order,
			trip_day,
			trip_seq
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