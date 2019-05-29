package com.kitri.admin.model.service;

import java.util.List;

import com.kitri.admin.model.dao.AdminDAOImpl;
import com.kitri.dto.AdminDTO;
import com.kitri.dto.MemberDetailDTO;

public class AdminService {

	public AdminService() {
		
	}

	public AdminDTO login(String email, String pass) {
<<<<<<< HEAD
		return AdminDAOImpl.getAdminDAO().selectByEmail(email);
=======
		return null;
>>>>>>> branch 'master' of https://github.com/sohyoun/Kitri----project2.git
	}
	
<<<<<<< HEAD
	public List<MemberDetailDTO> memeberAll(){
=======

	public List<MemberDetailDTO> memeberAll(String email, String address, String addressDetail, String gender, String grade){
>>>>>>> branch 'master' of https://github.com/sohyoun/Kitri----project2.git
		return AdminDAOImpl.getAdminDAO().selectAll();
	}
	
<<<<<<< HEAD
=======
	
>>>>>>> branch 'master' of https://github.com/sohyoun/Kitri----project2.git
}
