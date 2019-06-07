
package com.kitri.admin.model.dao;
import java.util.List;

import com.kitri.dto.*;

public interface AdminDAO {

	AdminDTO selectByEmail(String email);
	
	List<MemberBoard> selectAll();

	List<MemberBoard> selectByRows(int startRow, int endRow);
	
	List<GonggiBoard> selectGonggi(int startRow, int endRow); 

	int selectTotalCnt();

	int joindateTotalCnt();

	int blackTotalCnt();

	List<MemberBoard> memberSearch(String searchType, String keyword);
	
	GonggiBoard insert(GonggiBoard gonggiBoard);

}
