package com.kitri.recomand.service;

import java.util.List;
import com.kitri.dto.TripBasicDTO;
import com.kitri.tripbasic.dao.TripBasicDao;

public class RecomandService {
	private TripBasicDao dao;
	public RecomandService() {
		dao= TripBasicDao.getInstance();
	}
	

	public int getTotalCnt() {
		return dao.selectTotalCnt();
	}

	public TripBasicDTO findBySeq(int board_seq) {
		return null;
	}
	
}
