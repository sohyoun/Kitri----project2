package com.kitri.admin.model.service;

import java.util.List;

import com.kitri.admin.model.dao.AdminDAOImpl;
import com.kitri.dto.MemberBoard;
import com.kitri.dto.MemberDetailDTO;

public class MemberListService {

	
	public MemberListService() {
	}
	
	public List<MemberBoard> findByRows(int startRow, int endRow){
		return AdminDAOImpl.getAdminDAO().selectByRows(startRow, endRow);
	}
}
