package com.kitri.admin.model.service;



import com.kitri.admin.model.dao.AdminDAOImpl;
import com.kitri.dto.*;

public class AdminService {

	public AdminService() {
		
	}
	//로그인 
	public AdminDTO login(String admin_email, String admin_pass) {
		return AdminDAOImpl.getAdminDAO().selectByEmail(admin_email);
	}
	
}
