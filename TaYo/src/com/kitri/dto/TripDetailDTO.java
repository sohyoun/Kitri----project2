package com.kitri.dto;

import java.sql.Clob;

public class TripDetailDTO {
	private int trip_order; 		//순서
	private int trip_day;			//일자
	private int trip_seq;			//여행id
	private String place_name;		//장소 이름
	private int loc_id;				//지역코드
	private String image;			//이미지
	private String detail_title;	//세부제목
	private String detail_content;	//세부내용
	private float posX;				//x좌표
	private float posY;				//y좌표
	private int content_id;			//관광지id


	public int getContent_id() {
		return content_id;
	}

	public void setContent_id(int content_id) {
		this.content_id = content_id;
	}

	public TripDetailDTO() {
		super();
	}

	@Override
	public String toString() {
		return "TripDetailDTO [trip_order=" + trip_order + ", trip_day=" + trip_day + ", trip_seq=" + trip_seq
				+ ", place_name=" + place_name + ", loc_id=" + loc_id + ", image=" + image + ", detail_title="
				+ detail_title + ", detail_content=" + detail_content + ", posX=" + posX + ", posY=" + posY + "]";
	}

	public TripDetailDTO(int trip_order, int trip_day, int trip_seq, String place_name, int loc_id, String image,
			String detail_title, String detail_content, float posX, float posY,int content_id) {
		super();
		this.trip_order = trip_order;
		this.trip_day = trip_day;
		this.trip_seq = trip_seq;
		this.place_name = place_name;
		this.loc_id = loc_id;
		this.image = image;
		this.detail_title = detail_title;
		this.detail_content = detail_content;
		this.posX = posX;
		this.posY = posY;
		this.content_id= content_id;
	}
	
	public int getTrip_order() {
		return trip_order;
	}
	public void setTrip_order(int trip_order) {
		this.trip_order = trip_order;
	}
	public int getTrip_day() {
		return trip_day;
	}
	public void setTrip_day(int trip_day) {
		this.trip_day = trip_day;
	}
	public int getTrip_seq() {
		return trip_seq;
	}
	public void setTrip_seq(int trip_seq) {
		this.trip_seq = trip_seq;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public int getLoc_id() {
		return loc_id;
	}
	public void setLoc_id(int loc_id) {
		this.loc_id = loc_id;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDetail_title() {
		return detail_title;
	}
	public void setDetail_title(String detail_title) {
		this.detail_title = detail_title;
	}
	
	public String getDetail_content() {
		return detail_content;
	}

	public void setDetail_content(String detail_content) {
		this.detail_content = detail_content;
	}

	public float getPosX() {
		return posX;
	}
	public void setPosX(float posX) {
		this.posX = posX;
	}
	public float getPosY() {
		return posY;
	}
	public void setPosY(float posY) {
		this.posY = posY;
	}



	

	
	
	
}
