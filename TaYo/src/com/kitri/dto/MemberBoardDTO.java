package com.kitri.dto;

import java.util.Date;

public class MemberBoardDTO {

	// 회원 목록 테이블 진작에 만들었어야 됬는데.....
	private int mboard_seq; // 글 번호
	private String member_email;
	private String member_name;
	private int member_age;
	private String member_address;
	private String member_addressDetail;
	private Date member_joindate;
	private Date member_outdate;
	private String member_gender;
	private int member_grade;
	private JavaBean javaBean;

	public MemberBoardDTO() {

	}

	public int getMboard_seq() {
		return mboard_seq;
	}

	public void setMboard_seq(int mboard_seq) {
		this.mboard_seq = mboard_seq;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getMember_age() {
		return member_age;
	}

	public void setMember_age(int member_age) {
		this.member_age = member_age;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_addressDetail() {
		return member_addressDetail;
	}

	public void setMember_addressDetail(String member_addressDetail) {
		this.member_addressDetail = member_addressDetail;
	}

	public Date getMember_joindate() {
		return member_joindate;
	}

	public void setMember_joindate(Date member_joindate) {
		this.member_joindate = member_joindate;
	}

	public Date getMember_outdate() {
		return member_outdate;
	}

	public void setMember_outdate(Date member_outdate) {
		this.member_outdate = member_outdate;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public int getMember_grade() {
		return member_grade;
	}

	public void setMember_grade(int member_grade) {
		this.member_grade = member_grade;
	}

	public JavaBean getJavaBean() {
		return javaBean;
	}

	public void setJavaBean(JavaBean javaBean) {
		this.javaBean = javaBean;
	}

	public MemberBoardDTO(int mboard_seq, String member_email, String member_name, int member_age, String member_address,
			String member_addressDetail, Date member_joindate, Date member_outdate, String member_gender,
			int member_grade, JavaBean javaBean) {
		super();
		this.mboard_seq = mboard_seq;
		this.member_email = member_email;
		this.member_name = member_name;
		this.member_age = member_age;
		this.member_address = member_address;
		this.member_addressDetail = member_addressDetail;
		this.member_joindate = member_joindate;
		this.member_outdate = member_outdate;
		this.member_gender = member_gender;
		this.member_grade = member_grade;
		this.javaBean = javaBean;
	}

	@Override
	public String toString() {
		return "MemberBoard [mboard_seq=" + mboard_seq + ", member_email=" + member_email + ", member_name=" + member_name
				+ ", member_age=" + member_age + ", member_address=" + member_address + ", member_addressDetail="
				+ member_addressDetail + ", member_joindate=" + member_joindate + ", member_outdate=" + member_outdate
				+ ", member_gender=" + member_gender + ", member_grade=" + member_grade + ", javaBean=" + javaBean
				+ "]";
	}

}