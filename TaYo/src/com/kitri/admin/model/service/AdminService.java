package com.kitri.admin.model.service;

import java.util.List;

import com.kitri.admin.model.dao.AdminDAOImpl;
import com.kitri.dto.AdminDTO;
import com.kitri.dto.MemberDetailDTO;

public class AdminService {

	public AdminService() {
		
	}
<<<<<<< HEAD
	
	//관리자 로그인 
=======

>>>>>>> branch 'master' of https://github.com/sohyoun/Kitri----project2.git
	public AdminDTO login(String email, String pass) {
		return AdminDAOImpl.getAdminDAO().selectByEmail(email);
	}
	
<<<<<<< HEAD
	//회원 목록 
	public List<MemberDetailDTO> memeberAll(String email, String address, String addressDetail, String gender, String grade){
=======

	public List<MemberDetailDTO> memeberAll(){
>>>>>>> branch 'master' of https://github.com/sohyoun/Kitri----project2.git
		return AdminDAOImpl.getAdminDAO().selectAll();
	}

}
