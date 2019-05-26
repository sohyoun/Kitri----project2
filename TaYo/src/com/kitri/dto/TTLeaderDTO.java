package com.kitri.dto;

public class TTLeaderDTO {
	private int tripSeq;		//함께타요id
	private int tripNum;		//여행정원
	public TripBasicDTO tripBasicDTO = new TripBasicDTO();
	
	public int getTripSeq() {
		return tripSeq;
	}
	public void setTripSeq(int tripSeq) {
		this.tripSeq = tripSeq;
	}

	public int getTripNum() {
		return tripNum;
	}
	public void setTripNum(int tripNum) {
		this.tripNum = tripNum;
	}

	
	
}
