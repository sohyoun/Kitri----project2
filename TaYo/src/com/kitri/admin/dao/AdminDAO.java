
package com.kitri.admin.dao;
import java.util.List;

import com.kitri.dto.*;

public interface AdminDAO {

	AdminDTO selectByEmail(String email);
	
	List<MemberBoardDTO> selMember(int startRow, int endRow);
	
	List<GonggiBoardDTO> selGonggi(int startRow, int endRow); 
	
	int joinTotalCnt();

	int blackTotalCnt();

	List<MemberBoardDTO> memberSearch(String searchType, String keyword);
	
	GonggiBoardDTO insert(GonggiBoardDTO gonggiBoard);

	int gonggiTotalCnt();
	
	int memberTotalCnt();

}
