package com.kitri.tripbasic.dao;

import java.io.IOException;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

import com.kitri.dto.*;
import com.kitri.tripdetail.dao.TripDetailDao;
import com.kitri.util.*;

public class TripBasicDao {
	static TripBasicDao tripBasicDao;
	static {
		tripBasicDao = new TripBasicDao();
	}

	private TripBasicDao() {
	}

	public static TripBasicDao getInstance() {
		return tripBasicDao;
	}

	public int insert(TripBasicDTO basicDTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int result = 0;

		try {
			List<TripDetailDTO> list = basicDTO.getDetailList();

			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);

			// Insert Trip_Basic
			StringBuffer insertSQL = new StringBuffer();
			insertSQL.append(
					"INSERT INTO trip_basic (trip_seq, email, trip_title, trip_theme, trip_season, trip_num, start_date, end_date, viewCount, likeCount, lastupdate, isComplete) ");
			insertSQL.append("values (sq_tripbasic_tripseq.nextVal, ?, ?, ?, ?, ?, ?, ?, 0, 0, sysdate, ?)");

			pstmt = conn.prepareStatement(insertSQL.toString());

			int idx = 1;
			pstmt.setString(idx++, basicDTO.getEmail());
			pstmt.setString(idx++, basicDTO.getTripTitle());
			pstmt.setString(idx++, basicDTO.getTripTheme());
			pstmt.setString(idx++, basicDTO.getTripSeason());
			pstmt.setInt(idx++, basicDTO.getTripNum());
			pstmt.setDate(idx++, new java.sql.Date(basicDTO.getStartDate().getTime()));
			pstmt.setDate(idx++, new java.sql.Date(basicDTO.getEndDate().getTime()));
			pstmt.setString(idx, basicDTO.getIsComplete());
			result += pstmt.executeUpdate();

			pstmt.close();

			if (result != 1) {
				result = 0;
				conn.rollback();
				return result;
			}

			// Insert Trip_Detail
			for (TripDetailDTO tripDetailDTO : list) {
				insertSQL.setLength(0);
				insertSQL.append(
						"INSERT INTO Trip_Detail (trip_seq, trip_day, trip_order, place_name, loc_id, posx, posy) ");
				insertSQL.append("values (sq_tripbasic_tripseq.currVal, ?, ?, ?, ?, ?, ?)");

				pstmt = conn.prepareStatement(insertSQL.toString());

				idx = 1;
				pstmt.setInt(idx++, tripDetailDTO.getTrip_day());
				pstmt.setInt(idx++, tripDetailDTO.getTrip_order());
				pstmt.setString(idx++, tripDetailDTO.getPlace_name());
				pstmt.setInt(idx++, tripDetailDTO.getLoc_id());
				pstmt.setFloat(idx++, tripDetailDTO.getPosX());
				pstmt.setFloat(idx, tripDetailDTO.getPosY());
				result += pstmt.executeUpdate();
				pstmt.close();
			}

			if (result != (list.size() + 1)) {
				result = 0;
				conn.rollback();
			} else {
				conn.commit();
			}
		} catch (SQLException e) {
			result = 0;

			e.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		return result;
	}

	public List<TripBasicDTO> selectAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<TripBasicDTO> basiclist = new ArrayList<TripBasicDTO>();
		try {
			conn = DBConnection.makeConnection();
			String sql = "select trip_seq, email, trip_title, trip_theme, trip_season, trip_num, start_date, end_date, viewcount, likeCount, lastupdate, isComplete\n"
					+ "from trip_basic";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int trip_seq = rs.getInt("trip_seq");
				String email = rs.getString("email");
				String tripTitle = rs.getString("trip_title");
				String tripTheme = rs.getString("trip_theme");
				String tripSeason = rs.getString("trip_season");
				int tripNum = rs.getInt("trip_num");
				Date startDate = rs.getDate("start_date");
				Date endDate = rs.getDate("end_date");
				int viewCount = rs.getInt("viewcount");
				int likeCount = rs.getInt("likecount");
				Date lastUpDate = rs.getDate("lastUpDate");
				String isComplete = rs.getString("isComplete");

				List<TripDetailDTO> detailList = TripDetailDao.getInstance().select(trip_seq);
				TripBasicDTO dto = new TripBasicDTO(trip_seq, email, tripTitle, tripTheme, tripSeason, tripNum,
						startDate, endDate, viewCount, likeCount, lastUpDate, isComplete, detailList);
				basiclist.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return basiclist;
	}

	public String select(int id) {
		return null;
	}

	//TODO 개수 관리 필요
	public List<TripBasicDTO> select(String season, String theme, String city,int start_length, int end_length) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<TripBasicDTO> basiclist = new ArrayList<TripBasicDTO>();
		try {
			conn = DBConnection.makeConnection();
			String sql = "select trip_seq, email, trip_title, trip_theme, trip_season, trip_num, start_date, end_date, viewCount, likeCount, lastupdate, isComplete,\n" + 
					"										trip_seq, place_name, loc_id, trip_seq, trip_order, trip_day, image, detail_title, detail_content, posx, posy\n" + 
					"										from trip_basic join trip_detail using(trip_seq)\n" + 
					"										where trip_season = ? or trip_theme = ? or place_name = ? and\n" + 
					"										((end_date-start_date)>= ? and (end_date-start_date)<=?)"; 
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, season);
			pstmt.setString(2, theme);
			pstmt.setString(3, city);
			pstmt.setInt(4, start_length);
			pstmt.setInt(5, end_length);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int trip_seq = rs.getInt("trip_seq");
				String email = rs.getString("email");
				String tripTitle = rs.getString("trip_title");
				String tripTheme = rs.getString("trip_theme");
				String tripSeason = rs.getString("trip_season");
				int tripNum = rs.getInt("trip_num");
				Date startDate = rs.getDate("start_date");
				Date endDate = rs.getDate("end_date");
				int viewCount = rs.getInt("viewcount");
				int likeCount = rs.getInt("likecount");
				Date lastUpDate = rs.getDate("lastUpDate");
				String isComplete = rs.getString("isComplete");

				
				List<TripDetailDTO> detailList = TripDetailDao.getInstance().select(trip_seq);
				TripBasicDTO dto = new TripBasicDTO(trip_seq, email, tripTitle, tripTheme, tripSeason, tripNum,
						startDate, endDate, viewCount, likeCount, lastUpDate, isComplete, detailList);
				basiclist.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return basiclist;
	}
	public List<TripBasicDTO> select(String season, String theme, String city,int start_length, int end_length, int startRow, int endRow) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<TripBasicDTO> basiclist = new ArrayList<TripBasicDTO>();
		try {
			conn = DBConnection.makeConnection();
			String sql = "select  *\n" + 
					"from (select rownum r ,trip_seq, email, trip_title, trip_theme, trip_season, trip_num, start_date, end_date, viewCount, likeCount, lastupdate, isComplete,\n" + 
					"										 place_name, loc_id,  trip_order, trip_day, image, detail_title, detail_content, posx, posy\n" + 
					"										from trip_basic join trip_detail using(trip_seq)\n" + 
					"										where trip_season = ? or trip_theme = ? or place_name = ? and\n" + 
					"										((end_date-start_date)>= ? and (end_date-start_date)<=?))  \n" + 
					"where r between ? and ?"; 
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, season);
			pstmt.setString(2, theme);
			pstmt.setString(3, city);
			pstmt.setInt(4, start_length);
			pstmt.setInt(5, end_length);
			pstmt.setInt(6, startRow);
			pstmt.setInt(7, endRow);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int trip_seq = rs.getInt("trip_seq");
				String email = rs.getString("email");
				String tripTitle = rs.getString("trip_title");
				String tripTheme = rs.getString("trip_theme");
				String tripSeason = rs.getString("trip_season");
				int tripNum = rs.getInt("trip_num");
				Date startDate = rs.getDate("start_date");
				Date endDate = rs.getDate("end_date");
				int viewCount = rs.getInt("viewcount");
				int likeCount = rs.getInt("likecount");
				Date lastUpDate = rs.getDate("lastUpDate");
				String isComplete = rs.getString("isComplete");

				
				List<TripDetailDTO> detailList = TripDetailDao.getInstance().select(trip_seq);
				TripBasicDTO dto = new TripBasicDTO(trip_seq, email, tripTitle, tripTheme, tripSeason, tripNum,
						startDate, endDate, viewCount, likeCount, lastUpDate, isComplete, detailList);
				basiclist.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return basiclist;
	
	}
	public static void main(String[] args) {

//		List<TripBasicDTO> basicList = TripBasicDao.getInstance().selectAll();
		List<TripBasicDTO> basicList = TripBasicDao.getInstance().select("여름", null, null, 0, 0,1,5);

		for (TripBasicDTO basicDto : basicList) {
			System.out.println("====================");
			System.out.println(basicDto.toString());
			List<TripDetailDTO> detailList = TripDetailDao.getInstance().select(basicDto.getTripSeq());
			for (TripDetailDTO detailDto : detailList) {
				System.out.println(detailDto.toString());
			}
			System.out.println("====================");
		}
	}// end main

	

	public int selectTotalCnt() {
		return 0;
	}

}
