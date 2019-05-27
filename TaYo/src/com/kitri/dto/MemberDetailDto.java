package com.kitri.dto;

import java.util.Date;

public class MemberDetailDto {
	private String email;			//이메일
	private String address;			//주소
	private String addressDetail;	//상세주소
	private Date joindate;			//가입일
	private Date outdate;			//탈퇴일
	
	public MemberDetailDto() {
	
	}
	public MemberDetailDto(String email, String address, String addressDetail, Date joindate, Date outdate) {
		super();
		this.email = email;
		this.address = address;
		this.addressDetail = addressDetail;
		this.joindate = joindate;
		this.outdate = outdate;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public Date getOutdate() {
		return outdate;
	}
	public void setOutdate(Date outdate) {
		this.outdate = outdate;
	}
	
	
}
