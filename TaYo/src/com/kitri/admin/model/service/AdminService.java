package com.kitri.admin.model.service;
import java.util.List;

import com.kitri.admin.model.dao.AdminDAOImpl;
import com.kitri.dto.AdminDTO;
import com.kitri.dto.MemberDetailDTO;

public class AdminService {

	public AdminService() {
		
	}
	
	public AdminDTO login(String email, String pass) {
		return AdminDAOImpl.getAdminDAO().selectByEmail(email);
	}
	
	public List<MemberDetailDTO> memeberAll(){
		return AdminDAOImpl.getAdminDAO().selectAll();
	}
	
}
