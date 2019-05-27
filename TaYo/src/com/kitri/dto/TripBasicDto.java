package com.kitri.dto;

import java.util.Date;

public class TripBasicDto {
	private int tripSeq;		//������̵�
	private String email;		//�̸���
	private String tripTitle;	//�����̸�
	private String tripTheme;	//�����׸�
	private String tripSeason;	//�������
	private Date startDate;		//�����
	private Date endDate;		//������
	private int viewCount;		//��ȸ��
	private int likeCount;		//��õ��
	
	public TripDetailDTO tripDetailDTO = new TripDetailDTO();
	
	public int getTripSeq() {
		return tripSeq;
	}
	public void setTripSeq(int tripSeq) {
		this.tripSeq = tripSeq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTripTitle() {
		return tripTitle;
	}
	public void setTripTitle(String tripTitle) {
		this.tripTitle = tripTitle;
	}
	public String getTripTheme() {
		return tripTheme;
	}
	public void setTripTheme(String tripTheme) {
		this.tripTheme = tripTheme;
	}
	public String getTripSeason() {
		return tripSeason;
	}
	public void setTripSeason(String tripSeason) {
		this.tripSeason = tripSeason;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	
}
