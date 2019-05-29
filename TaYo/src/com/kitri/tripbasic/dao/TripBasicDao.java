package com.kitri.tripbasic.dao;


import java.util.List;

import com.kitri.db.impl.BasicDao;
import com.kitri.dto.TripBasicDTO;


public class TripBasicDao implements BasicDao<TripBasicDTO>{
	static TripBasicDao tripBasicDao;
	static{
		tripBasicDao = new TripBasicDao();
	}	

	public TripBasicDao getInstance() {
		return tripBasicDao;
	}
	
	@Override
	public int insert(TripBasicDTO dto) {
		return -1;
	}

	@Override
	public String select(TripBasicDTO id) {
		return null;
	}



	@Override
	public List<Object> selectAll() {
		return null;
	}

	public static void main(String[] args) {
		TripBasicDao dao = new TripBasicDao();
		dao.selectAll();
	}
}
