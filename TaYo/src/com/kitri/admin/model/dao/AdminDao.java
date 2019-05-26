package com.kitri.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kitri.admin.model.AdminDto;
import com.kitri.tayo.model.MemberDetailDto;

public interface AdminDao {

	AdminDto selectByEmail(String email);
	
}
