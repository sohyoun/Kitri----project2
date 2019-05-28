package com.kitri.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kitri.admin.model.AdminDto;
import com.kitri.dto.AdminDTO;
import com.kitri.dto.MemberDetailDTO;



public interface AdminDAO {

	public List<MemberDetailDTO> getMemberList(Map<String, String> map);

	public AdminDTO selectByEmail(String email);

	
}
