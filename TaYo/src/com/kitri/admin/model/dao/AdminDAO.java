//<<<<<<< HEAD

package com.kitri.admin.model.dao;
import java.util.List;

import com.kitri.dto.AdminDTO;
import com.kitri.dto.MemberBoard;
import com.kitri.dto.MemberDetailDTO;

public interface AdminDAO {

	AdminDTO selectByEmail(String email);
	
	List<MemberDetailDTO> selectAll();

	List<MemberBoard> selectByRows(int startRow, int endRow);

	int selectTotalCnt();
	
}

//=======

//package com.kitri.admin.model.dao;
//import java.util.List;
//
//import com.kitri.dto.AdminDTO;
//import com.kitri.dto.MemberDetailDTO;
//
//public interface AdminDAO {
//
//	AdminDTO selectByEmail(String email);
//	
//	List<MemberDetailDTO> selectAll();
//
//}

//>>>>>>> refs/heads/test
