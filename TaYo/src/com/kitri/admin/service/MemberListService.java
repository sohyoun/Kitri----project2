package com.kitri.admin.service;

import java.util.List;

import com.kitri.admin.dao.AdminDAOImpl;
import com.kitri.dto.MemberBoardDTO;

public class MemberListService {

	
	public MemberListService() {
		
	}
	
	//회원목록테이블 페이징처리 
	public List<MemberBoardDTO> selectMember(int startRow, int endRow){
		return AdminDAOImpl.getAdminDAO().selMember(startRow, endRow);
	}
	
	//회원목록테이블 전체 행 반환
	public int getTotalCnt(){
		return AdminDAOImpl.getAdminDAO().memberTotalCnt();
	}
	
	//회원목록 가입일 기준 회원 수 반환 
	public int getJoinCnt() {
		return AdminDAOImpl.getAdminDAO().joinTotalCnt();
	}
	
	//블랙회원 수 
	public int getBlackCnt() {
		return AdminDAOImpl.getAdminDAO().blackTotalCnt();
	}

	//검색된 회원 테이블 출력 
	public List<MemberBoardDTO> getMemberSearch(String searchType, String keyword) {
		return AdminDAOImpl.getAdminDAO().memberSearch(searchType, keyword);
		
	}
	
	
}
