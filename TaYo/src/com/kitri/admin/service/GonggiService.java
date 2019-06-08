package com.kitri.admin.service;

import java.util.List;

import com.kitri.admin.dao.AdminDAOImpl;
import com.kitri.dto.GonggiBoardDTO;

public class GonggiService {

	public GonggiService() {
		
	}
	
	//공지사항 글 목록 
	
	//공지사항 글 쓰기 
	public GonggiBoardDTO writer(GonggiBoardDTO gonggiBoard) {
		return AdminDAOImpl.getAdminDAO().insert(gonggiBoard);
	}
	
	public List<GonggiBoardDTO> selectGonggi(int startRow, int endRow) {
		return AdminDAOImpl.getAdminDAO().selGonggi(startRow, endRow);
	}

	public int getTotalCnt() {
		return AdminDAOImpl.getAdminDAO().gonggiTotalCnt();
	}
	
	
}
