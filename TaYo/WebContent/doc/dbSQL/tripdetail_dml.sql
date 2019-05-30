delete from trip_detail;


--sq_tripbasic_tripseq.currval
--trip_detail 입력
insert into trip_detail (trip_seq, place_name, loc_id , trip_order, trip_day, image, detail_title, detail_content, posx, posy)
values (0,'place_name2',2 ,  2, 0, 'image', 'detail_title', 'detail_content', 1.1, 2.2);
 
insert into trip_detail (trip_seq, place_name, loc_id,  trip_order, trip_day, image, detail_title, detail_content, posx, posy)
values (0,'place_name1',0 ,  3, 0, 'image', 'detail_title', 'detail_content', 1.1, 2.2);
commit;

select place_name, loc_id, trip_seq, trip_order, trip_day, image, detail_title, detail_content, posx, posy
from trip_detail;