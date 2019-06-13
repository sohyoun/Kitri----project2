--관리자 테이블 생성
CREATE TABLE admin (
	admin_email VARCHAR2(35) NOT NULL,
	admin_name VARCHAR2(20) NOT NULL,
	admin_pass VARCHAR(50) NOT NULL,
CONSTRAINT admin_email_pk PRIMARY KEY (admin_email)
);

--관리자테이블 삽입
INSERT INTO admin(admin_email, admin_name, admin_pass)
VALUES ('email', '김', 1234);