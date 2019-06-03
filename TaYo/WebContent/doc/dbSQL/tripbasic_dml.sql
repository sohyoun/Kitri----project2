

--delete
delete from trip_Basic;

 
-- trip_Basic 입력
insert into trip_Basic (trip_seq, email, trip_title, trip_theme, trip_season, trip_num, start_date, end_date, viewCount, likeCount, lastupdate, isComplete)
  values (0, 'email', 'title', 'theme', '시즌', 3, sysdate, sysdate, 0, 0, sysdate, 'N');
 --sq_tripbasic_tripseq.nextval
 commit;
 --탐색
 select trip_seq, email, trip_title, trip_theme, trip_season, trip_num, start_date, end_date, viewCount, likeCount, lastupdate, isComplete
 from trip_Basic;
 
 
 --member, member_detail, trip_basic,trip_detail 동시 입력
 insert all
 	into member (email, pass, name,age,grade, gender)
	values('email', 'pass', 'name', 20, 1,'M')
	into member_detail (email, address, address_detail , joindate, outdate)
	values('email', 'address', 'address_detail', sysdate , sysdate )
 	into trip_Basic (trip_seq, email, trip_title, trip_theme, trip_season, trip_num, start_date, end_date, viewCount, likeCount, lastupdate, isComplete) 
	values (sq_tripbasic_tripseq.nextval, 'email', 'title', 'theme', '시즌', 3, sysdate, sysdate, 0, 0, sysdate, 'N')
	into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
	values (sq_tripbasic_tripseq.currval,'place_name2',2 ,  2, 0, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
	into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
	values (sq_tripbasic_tripseq.currval,'place_name2',2 ,  2, 1, 'image', 'detail_title', 'detail_content', 1.1, 2.2);
	select * from dual;
 commit;
 
 
 -- 여행 기간 설정 테스트를 위한 insert
 --member, member_detail, trip_basic,trip_detail 동시 입력
  insert all
 	into member (email, pass, name,age,grade, gender)
	values('email1@day_length', 'pass', 'name', 20, 1,'M')
	into member_detail (email, address, address_detail , joindate, outdate)
	values('email1@day_length', 'address', 'address_detail', sysdate , sysdate )
   	select * from dual;
 commit;
 
 
insert all
    into trip_Basic (trip_seq, email, trip_title, trip_theme, trip_season, trip_num, start_date, end_date, viewCount, likeCount, lastupdate, isComplete) 
    values (sq_tripbasic_tripseq.nextval, 'email1@day_length', 'title', '함께타요', '여름', 3, sysdate+1, sysdate+5, 0, 0, sysdate, 'N')
select * from dual;
 commit;
 
insert all
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'서울',2 ,  2, 0, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'서울',2 ,  2, 1, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
select * from dual;
 commit;