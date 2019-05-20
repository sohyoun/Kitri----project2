package com.kitri.member.model;

public class MemberDetailDto {

	private String address; // 주소
	private String addressDetail; // 상세주소
	private int joindate; // 가입일
	private int outdate; // 탈퇴일

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

	public int getOutdate() {
		return outdate;
	}

	public void setOutdate(int outdate) {
		this.outdate = outdate;
	}

}
