package com.kitri.admin.model.dao;

import com.kitri.admin.model.AdminDto;
import com.kitri.dto.MemberDetailDTO;

public interface AdminDAO {

	AdminDto selectByEmail(String email);
	
}