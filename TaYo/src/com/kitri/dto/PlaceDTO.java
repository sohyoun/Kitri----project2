package com.kitri.dto;

import java.util.Date;

public class PlaceDTO {
	private String placeId;		//장소id
	private int locId;			//지역id
	private String placeName;	//장소이름
	private String placeCtg;	//장소카테고리
	private int placePrice;		//장소가격
	private Date placeTime;		//장소이용시간
	private String placeWay;	//가는방법
	private String placeInfo;	//장소정보
	
	public LocationDTO locationDTO = new LocationDTO();
	
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
	public LocationDTO getLocationDTO() {
		return locationDTO;
	}
	public void setLocationDTO(LocationDTO locationDTO) {
		this.locationDTO = locationDTO;
	}
	
	
}
