package com.kitri.admin.service;



import com.kitri.admin.dao.AdminDAOImpl;
import com.kitri.dto.*;

public class AdminService {

	public AdminService() {
		
	}
	//로그인 
	public AdminDTO login(String admin_email, String admin_pass) {
		return AdminDAOImpl.getAdminDAO().selectByEmail(admin_email);
	}
	
}
