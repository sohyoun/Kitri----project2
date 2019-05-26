package com.kitri.dto;

import java.util.Date;

public class PlaceDTO {
	private String placeId;		//장소코드
	private int locId;			//지역코드
	private String placeName;	//장소이름
	private String placeCtg;	//장소종류
	private int placePrice;		//장소입장료
	private Date placeTime;		//장소영업시간
	private String placeWay;	//장소가는방법
	private String placeInfo;	//장소세부정보
	public String getPlaceId() {
		return placeId;
	}
	public void setPlaceId(String placeId) {
		this.placeId = placeId;
	}
	public int getLocId() {
		return locId;
	}
	public void setLocId(int locId) {
		this.locId = locId;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getPlaceCtg() {
		return placeCtg;
	}
	public void setPlaceCtg(String placeCtg) {
		this.placeCtg = placeCtg;
	}
	public int getPlacePrice() {
		return placePrice;
	}
	public void setPlacePrice(int placePrice) {
		this.placePrice = placePrice;
	}
	public Date getPlaceTime() {
		return placeTime;
	}
	public void setPlaceTime(Date placeTime) {
		this.placeTime = placeTime;
	}
	public String getPlaceWay() {
		return placeWay;
	}
	public void setPlaceWay(String placeWay) {
		this.placeWay = placeWay;
	}
	public String getPlaceInfo() {
		return placeInfo;
	}
	public void setPlaceInfo(String placeInfo) {
		this.placeInfo = placeInfo;
	}
	
	
}
