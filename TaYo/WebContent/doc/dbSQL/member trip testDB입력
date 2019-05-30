--DB 테스트 데이터 입력

-- member입력
insert into member (email, pass, name,age,grade, gender)
values('email', 'pass', 'name', 20, 1,'M');

-- member_detail 삽입
insert into member_detail (email, address, address_detail , joindate, outdate)
values('email', 'address', 'address_detail', SYSTIMESTAMP , SYSTIMESTAMP );

-- trip_Basic 삽입
--sq_tripbasic_tripseq.nextval
insert into trip_Basic (trip_seq, email, trip_title, trip_theme, trip_season, start_date, end_date, viewCount, likeCount, lastupdate, isComplete)
  values (0 , 'email', 'title', 'theme', '시즌', sysdate, sysdate, 0, 0, sysdate, 'N');
 

--trip_detail 입력
--sq_tripbasic_tripseq.currval
insert into trip_detail (trip_seq, loc_id, place_name , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
values (0 ,2 , 'place_name2', 2, 0, 'image', 'detail_title', 'detail_content', 1.1, 2.2);

--sq_tripbasic_tripseq.currval
insert into trip_detail (trip_seq, loc_id,place_name , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
values (0 ,0 ,'place_name1', 3, 0, 'image', 'detail_title', 'detail_content', 1.1, 2.2);
