package com.kitri.tripbasic.dao;

import com.kitri.dto.TripBasicDto;

public class TripBasicDao {
	private static TripBasicDao tripBasicDao; 
	static {
		tripBasicDao = new TripBasicDao();
	}
	public TripBasicDao getInstance() {
		return tripBasicDao;
	}
	
	public TripBasicDto selectAll() {
		
		return null;
	}
}
