package com.kitri.dto;

import java.util.Date;

public class MemberBoard{

	//회원 목록 테이블 진작에 만들었어야 됬는데.....
	private int board_seq; //글 번호
	private int parent_seq; // 부모 글 번호
	private String email; 
	private String name;
	private int age;
	private String address;
	private String addressDetail;
	private Date joindate;
	private Date outdate;
	private String gender;
	private int grade;
	
	
	public MemberBoard() {
		
	}


	public MemberBoard(int board_seq, int parent_seq, String email, String name, int age, String address,
			String addressDetail, Date joindate, Date outdate, String gender, int grade) {
		super();
		this.board_seq = board_seq;
		this.parent_seq = parent_seq;
		this.email = email;
		this.name = name;
		this.age = age;
		this.address = address;
		this.addressDetail = addressDetail;
		this.joindate = joindate;
		this.outdate = outdate;
		this.gender = gender;
		this.grade = grade;
	}


	public int getBoard_seq() {
		return board_seq;
	}


	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}


	public int getParent_seq() {
		return parent_seq;
	}


	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
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


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public int getGrade() {
		return grade;
	}


	public void setGrade(int grade) {
		this.grade = grade;
	}


	@Override
	public String toString() {
		return "MemberBoard [board_seq=" + board_seq + ", parent_seq=" + parent_seq + ", email=" + email + ", name="
				+ name + ", age=" + age + ", address=" + address + ", addressDetail=" + addressDetail + ", joindate="
				+ joindate + ", outdate=" + outdate + ", gender=" + gender + ", grade=" + grade + "]";
	}
	
	
	
}
