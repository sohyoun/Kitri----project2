package com.kitri.dto;

public class TTLeaderDTO {
	private int tripSeq;		//함께타요id
	private String partyEmail;	//참여자이메일
	private int tripNum;		//여행정원
	private int partyOK;		//가입수락여부
	public int getTripSeq() {
		return tripSeq;
	}
	public void setTripSeq(int tripSeq) {
		this.tripSeq = tripSeq;
	}
	public String getPartyEmail() {
		return partyEmail;
	}
	public void setPartyEmail(String partyEmail) {
		this.partyEmail = partyEmail;
	}
	public int getTripNum() {
		return tripNum;
	}
	public void setTripNum(int tripNum) {
		this.tripNum = tripNum;
	}
	public int getPartyOK() {
		return partyOK;
	}
	public void setPartyOK(int partyOK) {
		this.partyOK = partyOK;
	}
	
	
}
