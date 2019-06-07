package com.kitri.member.service;

import java.util.Calendar;
import java.util.Date;

import com.kitri.dto.MemberDTO;
import com.kitri.member.dao.MemberDao;

public class MemberService {

	public String login(String email, String pass) {
		MemberDTO m = MemberDao.getInstance().selectById(email);
		if (m!=null && m.getPass().equals(pass)) {
			// return "로그인 성공";
			return "1";
		} else {
			// return "로그인 실패";
			return "-1";
		}
	}

	public String register(String name, String email, String pass, int age, int grade, String gender, String address,
			String address_detail, Date joindate, Date outdate) {
		String result = MemberDao.getInstance().insertMember(name, email, pass, age, grade, gender, address,
				address_detail, joindate, outdate);
		return result;
	}

	public String register(String name, String email, String pass, String gender) {
		String result = MemberDao.getInstance().insertMember(name, email, pass, gender);
		return result;
	}
}
