package com.kitri.together.service;

import java.util.List;

import com.kitri.dto.TTLeaderDTO;
import com.kitri.dto.TripDetailDTO;
import com.kitri.together.dao.TogetherDAO;

public class TogetherService {
	private TogetherDAO dao;
	public TogetherService() {
		dao = new TogetherDAO();
	}
	 
	public List<TTLeaderDTO> findbest() {
		return dao.selectbest4();
	}
	
	public List<TripDetailDTO> findTripDetail(int tripSeq) {
		return dao.selectPlanDetail(tripSeq);
	}
	
	public void updateViewCount(int tripSeq, int viewCount) {
		dao.updateViewCount(tripSeq,viewCount);
	}
	
	public void updateLikeCount(int tripSeq, int likeCount, int heart) {
		dao.updateLikeCount(tripSeq, likeCount, heart);
	}

	
	
}
