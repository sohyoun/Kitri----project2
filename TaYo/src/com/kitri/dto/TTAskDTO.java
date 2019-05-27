package com.kitri.dto;

public class TTAskDTO {
	private int tripSeq;		//함께타요id
	private String askTitle;	//문의제목
	private String askContents;	//문의내용
	public int getTripSeq() {
		return tripSeq;
	}
	public void setTripSeq(int tripSeq) {
		this.tripSeq = tripSeq;
	}
	public String getAskTitle() {
		return askTitle;
	}
	public void setAskTitle(String askTitle) {
		this.askTitle = askTitle;
	}
	public String getAskContents() {
		return askContents;
	}
	public void setAskContents(String askContents) {
		this.askContents = askContents;
	}
	
	
}
