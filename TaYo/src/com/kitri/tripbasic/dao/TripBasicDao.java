package com.kitri.tripbasic.dao;

import com.kitri.dto.TripBasicDTO;

public class TripBasicDao {
	private static TripBasicDao tripBasicDao; 
	static {
		tripBasicDao = new TripBasicDao();
	}
	public TripBasicDao getInstance() {
		return tripBasicDao;
	}
	
	public TripBasicDTO selectAll() {
		
		return null;
	}
}
