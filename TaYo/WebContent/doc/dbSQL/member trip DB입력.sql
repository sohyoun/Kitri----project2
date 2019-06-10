--delete
delete from trip_detail;
delete from trip_Basic;
delete from member_detail;
delete from member;

--DB 테스트 데이터 입력

 -- 여행 기간 설정 테스트를 위한 TESTINSERT EX)2
 --member, member_detail, trip_basic,trip_detail 동시 입력
  insert all
 	into member (email, pass, name,age,grade, gender)
	values('email1@day_length', 'pass', 'name', 20, 1,'M')
	into member_detail (email, address, address_detail , joindate, outdate)
	values('email1@day_length', 'address', 'address_detail', sysdate , sysdate )
   	select * from dual;
 commit;
 
 
insert into trip_Basic (trip_seq, email, trip_title, trip_theme, trip_season, trip_num, start_date, end_date, viewCount, likeCount, lastupdate, isComplete) 
    values (sq_tripbasic_tripseq.nextval, 'email1@day_length', 'title', '함께타요', '여름', 3, sysdate+1, sysdate+5, 0, 0, sysdate, 'N')
commit;
 
insert all
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'지역1',1 ,  1, 1, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'지역1',1 ,  1, 2, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'지역1',1 ,  1, 3, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'지역1',1 ,  1, 4, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'지역1',1 ,  1, 5, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'지역1',1 ,  1, 6, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'지역1',1 ,  1, 7, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'지역1',2 ,  1, 8, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'지역2',2 ,  2, 0, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'지역2',2 ,  2, 1, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'지역2',2 ,  2, 2, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'지역3',2 ,  2, 3, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'지역3',2 ,  2, 4, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'지역3',2 ,  2, 5, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'지역3',2 ,  2, 6, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'지역3',2 ,  2, 7, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
    into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
    values (sq_tripbasic_tripseq.currval,'지역4',2 ,  2, 8, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
select * from dual;
 commit;