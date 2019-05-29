package com.kitri.tripbasic.dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.kitri.db.impl.BasicDao;
import com.kitri.dto.*;
import com.kitri.util.DBClose;
import com.kitri.util.DBConnection;


public class TripBasicDao implements BasicDao<TripBasicDTO>{
	static TripBasicDao tripBasicDao;
	static{
		tripBasicDao = new TripBasicDao();
	}	

	public TripBasicDao getInstance() {
		return tripBasicDao;
	}
	

	@Override
	public List<TripBasicDTO> selectAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<TripBasicDTO> list = new ArrayList<TripBasicDTO>();
		try {
			conn = DBConnection.makeConnection();
			String sql = " select trip_seq, email, trip_title, trip_theme, trip_season, start_date, end_date, viewcount, likecount \n" + 
					" from trip_Basic;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String tripSeq = rs.getString("trip_seq");
				String email = rs.getString("email");
				String tripTitle = rs.getString("trip_title");
				String tripTheme = rs.getString("trip_theme");
				String tripSeason = rs.getString("trip_season");
				
				Date startDate = rs.getDate("start_date");
				Date endDate = rs.getDate("end_date");
				int viewCount= rs.getInt("viewcount");
				int likeCount = rs.getInt("likecount");
				
				List<TripDetailDTO> detaillist= new ArrayList<TripDetailDTO>();
//				TripBasicDTO dto = new TripBasicDTO(tripSeq, email, tripTitle, tripTheme, tripSeason, startDate, endDate, viewCount, likeCount, lastUpDate, tripDetailDTO)
//				list.add(dto);
				
//				System.out.println("MemberDao select all" +list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public int insert(TripBasicDTO dto) {
		return -1;
	}

	@Override
	public String select(TripBasicDTO id) {
		return null;
	}



	public static void main(String[] args) {
		TripBasicDao dao = new TripBasicDao();
		dao.selectAll();
	}
}
