package com.kitri.admin.model.service;
import com.kitri.admin.model.dao.AdminDAOImpl;
import com.kitri.dto.AdminDTO;

public class AdminService {

	public AdminService() {
		
	}
	
	public AdminDTO login(String email, String pass) {
	
		return AdminDAOImpl.getAdminDAO().selectByEmail(email);
	}
}
