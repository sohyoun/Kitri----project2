
package com.kitri.admin.dao;
import java.util.List;

import com.kitri.dto.*;

public interface AdminDAO {

	//관리자 로그인 
	AdminDTO selectByEmail(String email);
	
	//회원 목록 테이블 (페이징 처리를 위해)
	List<MemberBoardDTO> selMember(int startRow, int endRow);
	
	//공지 목록 테이블 (페이징 처리를 위해)
	List<GonggiBoardDTO> selGonggi(int startRow, int endRow); 
	
	// 회원 가입 수 
	int joinTotalCnt();

	// 블랙 회원 가입 수 
	int blackTotalCnt();

	// 회원 검색 목록
	List<MemberBoardDTO> memberSearch(String searchType, String keyword);
	
	// 공지 글쓰기
	GonggiBoardDTO write(GonggiBoardDTO gonggiBoard);

	// 공지 글 수 
	int gonggiTotalCnt();
	
	//전체 회원테이블 수 
	int memberTotalCnt();

	// 공지 글 회원 
	List<GonggiBoardDTO> gonggiSearch(String search , String value);
	
	boolean gonggiDelete(int gboard_seq);

}
