package com.kitri.admin.model.service;

import java.util.List;

import com.kitri.admin.model.dao.AdminDAOImpl;
import com.kitri.dto.MemberBoard;
import com.kitri.dto.MemberDetailDTO;

public class MemberListService {

	
	public MemberListService() {
	}
	
	//회원목록테이블 전체목록 출력
	public List<MemberBoard> memeberAll(){
		return AdminDAOImpl.getAdminDAO().selectAll();
	}
	
	//회원목록테이블 원하는 행 반환 
	public List<MemberBoard> findByRows(int startRow, int endRow){
		return AdminDAOImpl.getAdminDAO().selectByRows(startRow, endRow);
	}
	
	//회원목록테이블 페이징처리 
	public int getTotalCnt(){
		return AdminDAOImpl.getAdminDAO().selectTotalCnt();
	}
	
	//회원목록 가입일 기준 회원 수 반환 
	public int getJoindateCnt() {
		return AdminDAOImpl.getAdminDAO().joindateTotalCnt();
	}
	
	//블랙회원 수 
	public int getBlackCnt() {
		return AdminDAOImpl.getAdminDAO().blackTotalCnt();
	}
	
	
}
