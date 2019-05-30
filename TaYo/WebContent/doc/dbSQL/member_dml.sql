-- member입력
insert into member (email, pass, name,age,grade, gender)
values('email', 'pass', 'name', 20, 1,'M');
commit;
-- 출력
select name, email, pass, age, grade, gender, address, address_detail, joindate, outdate
from member JOIN member_detail using(email);