--trip_detail 입력
insert into trip_detail (place_name, loc_id, trip_seq, trip_order, trip_day, image, detail_title, detail_content, posx, posy)
values ('place_name2',2 , sq_tripbasic_tripseq.currval, 2, 0, 'image', 'detail_title', 'detail_content', 1.1, 2.2);

insert into trip_detail (place_name, loc_id, trip_seq, trip_order, trip_day, image, detail_title, detail_content, posx, posy)
values ('place_name1',0 , sq_tripbasic_tripseq.currval, 3, 0, 'image', 'detail_title', 'detail_content', 1.1, 2.2);

select place_name, loc_id, trip_seq, trip_order, trip_day, image, detail_title, detail_content, posx, posy
from trip_detail;