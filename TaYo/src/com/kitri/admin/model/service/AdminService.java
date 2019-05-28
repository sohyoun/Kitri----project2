package com.kitri.admin.model.service;
import com.kitri.admin.model.AdminDto;
import com.kitri.admin.model.dao.AdminDAOImpl;

public class AdminService {

	public AdminService() {
		
	}
	
	public AdminDto login(String email, String pass) {
	
		return AdminDAOImpl.getAdminDao().selectByEmail(email);
	}
}
