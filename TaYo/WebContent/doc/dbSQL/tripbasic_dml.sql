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