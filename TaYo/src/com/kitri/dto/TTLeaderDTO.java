package com.kitri.dto;

public class TTLeaderDTO {
	private int tripSeq;		//�Բ�Ÿ��id
	private int tripNum;		//��������
	private int nowNum;			//��������
	
	public TripBasicDto tripBasicDTO = new TripBasicDto();
	
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

	public int getNowNum() {
		return nowNum;
	}
	public void setNowNum(int nowNum) {
		this.nowNum = nowNum;
	}
	
	
}
