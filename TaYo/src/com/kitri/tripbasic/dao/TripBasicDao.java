package com.kitri.tripbasic.dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.kitri.dto.*;
import com.kitri.tripdetail.dao.TripDetailDao;
import com.kitri.util.DBClose;
import com.kitri.util.DBConnection;


public class TripBasicDao {
	static TripBasicDao tripBasicDao;
	static{
		tripBasicDao = new TripBasicDao();
	}	

	private TripBasicDao() {}
	public static TripBasicDao getInstance() {
		return tripBasicDao;
	}
	


	public List<TripBasicDTO> selectAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<TripBasicDTO> basiclist = new ArrayList<TripBasicDTO>();
		try {
			conn = DBConnection.makeConnection();
			String sql = "select trip_seq, email, trip_title, trip_theme, trip_season, start_date, end_date, viewcount, likeCount, lastupdate, isComplete\n" + 
					"from trip_basic";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int trip_seq = rs.getInt("trip_seq");
				String email = rs.getString("email");
				String tripTitle = rs.getString("trip_title");
				String tripTheme = rs.getString("trip_theme");
				String tripSeason = rs.getString("trip_season");
				Date startDate = rs.getDate("start_date");
				Date endDate = rs.getDate("end_date");
				int viewCount = rs.getInt("viewcount");
				int likeCount = rs.getInt("likecount");
				Date lastUpDate = rs.getDate("lastUpDate");
				String isComplete = rs.getString("isComplete");
				TripBasicDTO dto = new TripBasicDTO(trip_seq, email, tripTitle, tripTheme, tripSeason, startDate, endDate, viewCount, likeCount, lastUpDate, isComplete, null);
				basiclist.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return basiclist;
	}

	public int insert(TripBasicDTO dto) {
		return -1;
	}

	
	public String select(int id) {
		return null;
	}



	public static void main(String[] args) {
		
		List<TripBasicDTO> basicList = TripBasicDao.getInstance().selectAll();
		for(TripBasicDTO basicDto : basicList) {
			System.out.println("====================");
			System.out.println(basicDto.toString());
			
			List<TripDetailDTO> detailList = TripDetailDao.getInstance().select(basicDto.getTripSeq());
			for(TripDetailDTO detailDto : detailList) {	
			System.out.println(detailDto.toString());
			}
			System.out.println("====================");
		}
	}//end main
}
