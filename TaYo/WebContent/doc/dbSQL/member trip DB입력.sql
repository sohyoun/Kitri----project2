--DB 테스트 데이터 입력

  -- member member detail trip_basic,trip_detail 입력
  -- pk, fk인 email과 sequance값 입력에 주의
  
 insert all
 	into member (email, pass, name,age,grade, gender)
	values('email3', 'pass', 'name', 20, 1,'M')
	into member_detail (email, address, address_detail , joindate, outdate)
	values('email3', 'address', 'address_detail', SYSTIMESTAMP , SYSTIMESTAMP )
 	into trip_Basic (trip_seq, email, trip_title, trip_theme, trip_season, trip_num, start_date, end_date, viewCount, likeCount, lastupdate, isComplete) 
	values (sq_tripbasic_tripseq.nextval, 'email3', 'title', 'theme', '시즌', 3, sysdate, sysdate, 0, 0, sysdate, 'N')   
select * from dual;
commit;

insert all
	into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
	values (sq_tripbasic_tripseq.currval,'place_name2',2, 1, 0, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
	into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
	values (sq_tripbasic_tripseq.currval,'place_name2',2, 2, 0, 'image', 'detail_title', 'detail_content', 1.1, 2.2)
    select * from dual;
commit;
 
 select * from member;
 select * from member_detail;
 select * from trip_basic;
 select * from trip_detail;
 select sq_tripbasic_tripseq.currval from dual;