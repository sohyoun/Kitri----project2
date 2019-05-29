
package com.kitri.admin.model.dao;
import java.util.List;

import com.kitri.dto.AdminDTO;
import com.kitri.dto.MemberDetailDTO;

public interface AdminDAO {

	AdminDTO selectByEmail(String email);
	
	List<MemberDetailDTO> selectAll();

}

