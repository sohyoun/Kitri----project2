package com.kitri.together.service;

import java.util.List;

import com.kitri.dto.TTLeaderDTO;
import com.kitri.together.dao.TogetherDAO;

public class TogetherService {
	private TogetherDAO dao;
	public TogetherService() {
		dao = new TogetherDAO();
	}
	 
	public List<TTLeaderDTO> findbest() {
		return dao.selectbest4();
	}
	
	
}
