package com.kitri.member.dao;

import com.kitri.dto.MemberDto;

public class MemberDao {
	private static MemberDao MemberDao; 
	static {
		MemberDao = new MemberDao();
	}
	public MemberDao getInstance() {
		return MemberDao;
	}
	
	public String insertMember() {
		return "1";
	}
	
	public MemberDto selectAll() {
		return null;
	}
	

	
	public static void main(String[] args) {
		
		MemberDto member= new MemberDto();
	}
}
