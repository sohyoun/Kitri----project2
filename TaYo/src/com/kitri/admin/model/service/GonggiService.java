package com.kitri.admin.model.service;

import com.kitri.admin.model.dao.AdminDAOImpl;
import com.kitri.dto.GonggiBoard;

public class GonggiService {

	public GonggiService() {
		
	}
	
	//공지사항 글 목록 
	
	//공지사항 글 쓰기 
	public GonggiBoard writer(GonggiBoard gonggiBoard) {
		return AdminDAOImpl.getAdminDAO().insert(gonggiBoard);
	}
	
	
}
