package com.kitri.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kitri.dto.MemberDetailDTO;

public interface AdminDAO {

	List<MemberDetailDTO> getMemberList(Map<String, String> map);

}
