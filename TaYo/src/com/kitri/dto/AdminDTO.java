package com.kitri.dto;

public class AdminDTO {

	private String admin_email; // 이메일
	private String admin_pass; // 패스워드
	private String admin_name; // 이름
	
	public AdminDTO() {
		super();
	}

	
	public AdminDTO(String admin_email) {
		super();
		this.admin_email = admin_email;
	}

	public AdminDTO(String admin_email, String admin_pass, String admin_name) {
		super();
		this.admin_email = admin_email;
		this.admin_pass = admin_pass;
		this.admin_name = admin_name;
	}

	public String getAdmin_email() {
		return admin_email;
	}

	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}

	public String getAdmin_pass() {
		return admin_pass;
	}

	public void setAdmin_pass(String admin_pass) {
		this.admin_pass = admin_pass;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	@Override
	public String toString() {
		return "AdminDTO [admin_email=" + admin_email + ", admin_pass=" + admin_pass + ", admin_name=" + admin_name
				+ "]";
	}

}