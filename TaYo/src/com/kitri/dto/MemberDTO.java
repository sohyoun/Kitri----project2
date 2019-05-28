package com.kitri.dto;

public class MemberDTO {
	private String email;	//이메일
	private String name;	//이름
	private String pass;	//비밀번호
	private int age;		//나이
	private int grade;		//등급
	private String gender;	//성별
	private MemberDetailDTO memberDetailDto; //상세정보
	
	public MemberDTO() {
		super();
	}

	public MemberDTO(String email, String name, String pass, int age, int grade, String gender,
			MemberDetailDTO memberDetailDto) {
		super();
		this.email = email;
		this.name = name;
		this.pass = pass;
		this.age = age;
		this.grade = grade;
		this.gender = gender;
		this.memberDetailDto = memberDetailDto;
	}

	public MemberDetailDTO getMemberDetailDto() {
		return memberDetailDto;
	}

	public void setMemberDetailDto(MemberDetailDTO memberDetailDto) {
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

	@Override
	public String toString() {
		return "MemberDto [email=" + email + ", name=" + name + ", pass=" + pass + ", age=" + age + ", grade=" + grade
				+ ", gender=" + gender + ", memberDetailDto=" + memberDetailDto + "]";
	}	
	
	
}
