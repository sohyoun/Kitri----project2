package com.kitri.member.model;

import java.util.Date;

public class MemberDetailDto {

	private String address; // 주소
	private String addressDetail; // 상세주소
	private Date joindate; // 가입일
	private Date outdate; // 탈퇴일

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

	public Date getOutdate() {
		return outdate;
	}

	public void setOutdate(Date outdate) {
		this.outdate = outdate;
	}

}
