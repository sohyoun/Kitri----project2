package com.kitri.dto;

public class TTLeaderDTO {
	private int tripSeq;		//함께타요 여행id
	private int nowNum;			//현재 Num
	
	public TripBasicDTO tripBasicDTO = new TripBasicDTO();
	
	public int getTripSeq() {
		return tripSeq;
	}
	public void setTripSeq(int tripSeq) {
		this.tripSeq = tripSeq;
	}


	public int getNowNum() {
		return nowNum;
	}
	public void setNowNum(int nowNum) {
		this.nowNum = nowNum;
	}
	public TripBasicDTO getTripBasicDTO() {
		return tripBasicDTO;
	}
	public void setTripBasicDTO(TripBasicDTO tripBasicDTO) {
		this.tripBasicDTO = tripBasicDTO;
	}
	
	
}
