package com.kitri.dto;

import java.util.*;

public class TripBasicDTO {
	private int tripSeq;		//여행아이디
	private String email;		//이메일
	private String tripTitle;	//여행이름
	private String tripTheme;	//여행테마
	private String tripSeason;	//여행시즌
	private Date startDate;		//출발일
	private Date endDate;		//종료일
	private int viewCount;		//조회수
	private int likeCount;		//추천수
	private int lastUpDate;		//최종수정일
	
	List<TripDetailDTO> tripDetailDTO;
	
	public TripBasicDTO() {
		super();
	}

	public TripBasicDTO(int tripSeq, String email, String tripTitle, String tripTheme, String tripSeason,
			Date startDate, Date endDate, int viewCount, int likeCount, int lastUpDate, TripDetailDTO tripDetailDTO) {
		super();
		this.tripSeq = tripSeq;
		this.email = email;
		this.tripTitle = tripTitle;
		this.tripTheme = tripTheme;
		this.tripSeason = tripSeason;
		this.startDate = startDate;
		this.endDate = endDate;
		this.viewCount = viewCount;
		this.likeCount = likeCount;
		this.lastUpDate = lastUpDate;
		this.tripDetailDTO = new ArrayList<TripDetailDTO>();
	}

	
	public int getLastUpDate() {
		return lastUpDate;
	}


	public void setLastUpDate(int lastUpDate) {
		this.lastUpDate = lastUpDate;
	}

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
