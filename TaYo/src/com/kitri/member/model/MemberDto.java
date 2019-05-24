package com.kitri.member.model;

public class MemberDto {

	private String email; // 이메일
	private String name; // 이름
	private String pass; // 패스워드
	private int age; // 나이
	private int grade; // 등급
	private String gender; // 성별
	private MemberDetailDto memberDetailDto;
	
	// 기본 생성자
	public MemberDto() {
		
	}

	
	public MemberDto(String email, String name, String pass, int age, int grade, String gender, MemberDetailDto memberDetailDto) {
		super();
		this.email = email;
		this.name = name;
		this.pass = pass;
		this.age = age;
		this.grade = grade;
		this.gender = gender;
		this.memberDetailDto = memberDetailDto;
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

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

}
