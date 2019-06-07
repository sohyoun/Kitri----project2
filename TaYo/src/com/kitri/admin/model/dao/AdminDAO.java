
package com.kitri.admin.model.dao;
import java.util.List;

import com.kitri.dto.*;

public interface AdminDAO {

	AdminDTO selectByEmail(String email);
	
	List<MemberBoardDTO> selectByRows(int startRow, int endRow);
	
	List<GonggiBoardDTO> selectGonggi(int startRow, int endRow); 

	int selectTotalCnt();

	int joindateTotalCnt();

	int blackTotalCnt();

	List<MemberBoardDTO> memberSearch(String searchType, String keyword);
	
	GonggiBoardDTO insert(GonggiBoardDTO gonggiBoard);

}
