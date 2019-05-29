package com.kitri.tripbasic.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitri.db.impl.DbDml;
import com.kitri.dto.TripBasicDTO;
import com.kitri.util.DBConnection;

public class TripBasicDao implements DbDml<TripBasicDTO>{
	static TripBasicDTO tripBasicDTO;
	static{
		tripBasicDTO = new TripBasicDTO();
	}
	
	@Override
	public TripBasicDTO getInstance() {
		return tripBasicDTO;
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
