package com.kitri.admin.model;

public class AdminDto {

	private String adminEmail; // 관리자 이메일
	private String adminPass; // 관리자 패스워드
	private String adminName; // 관리자 이름
	
	// 기본 생성자
	public AdminDto() {

	}
	
	// 필드 값 초기화 
	public AdminDto(String adminEmail, String adminPass, String adminName) {
		this.adminEmail = adminEmail;
		this.adminName = adminName;
		this.adminPass = adminPass;
	}

	public String getAdminEmail() {
		return adminEmail;
	}

	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}

	public String getAdminPass() {
		return adminPass;
	}

	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

}
