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
			insertSQL.append("INSERT INTO trip_basic (trip_seq, email, trip_title, trip_theme, trip_season, trip_num, start_date, end_date, viewCount, likeCount, lastupdate, isComplete) ");
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
				insertSQL.append("INSERT INTO Trip_Detail (trip_seq, trip_day, trip_order, place_name, loc_id, posx, posy) ");
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
				TripBasicDTO dto = new TripBasicDTO(trip_seq, email, tripTitle, tripTheme, tripSeason, tripNum,
						startDate, endDate, viewCount, likeCount, lastUpDate, isComplete, null);
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
	
	public List<TripBasicDTO> select(String season, String theme, String city, String day) {
		
		return null;
	}

	public static void main(String[] args) {

		List<TripBasicDTO> basicList = TripBasicDao.getInstance().selectAll();

		for (TripBasicDTO basicDto : basicList) {
			System.out.println("====================");
			System.out.println(basicDto.toString());
			List<TripDetailDTO> detailList = TripDetailDao.getInstance().select(basicDto.getTripSeq());
			for (TripDetailDTO detailDto : detailList) {
				System.out.println(detailDto.toString());
//				Clob clob = detailDto.getDetail_content();
//				try {
//					System.out.println("clob : " + Util.readCLOB(clob));
//				} catch (IOException | SQLException e) {
//					e.printStackTrace();
//				}
			}

			System.out.println("====================");
		}
		
		
		
	}// end main

	public void insertTest() {
		StringTokenizer st;
		List<TripDetailDTO> list = new ArrayList<TripDetailDTO>();
		
		Date start = null;
		Date end = null;
		int person = 1;
		String email = "eamil";
		String saveType = request.getParameter("savetype");
		String title = request.getParameter("title");
		String theme = request.getParameter("theme");
		String season = request.getParameter("season");
		String[] plandata = request.getParameterValues("plandata");
		try {
			start = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("start").replace('.', '-'));
			end = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("end").replace('.', '-'));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		TripBasicDTO basicDTO = new TripBasicDTO();
		basicDTO.setEmail(email);
		basicDTO.setTripTitle(title);
		basicDTO.setTripTheme(theme);
		basicDTO.setTripSeason(season);
		basicDTO.setTripNum(person);
		basicDTO.setStartDate(start);
		basicDTO.setEndDate(end);
		basicDTO.setIsComplete(saveType);
		
		TripDetailDTO detailDTO = null;
		
		for (String plan : plandata) {
			detailDTO = new TripDetailDTO();
			st = new StringTokenizer(plan, ",");
			
			while (st.hasMoreTokens()) {
				detailDTO.setTrip_day(Integer.parseInt(st.nextToken()));
				detailDTO.setTrip_order(Integer.parseInt(st.nextToken()));
				detailDTO.setPlace_name(st.nextToken());
				detailDTO.setLoc_id(Integer.parseInt(st.nextToken()));
				detailDTO.setPosX(Float.parseFloat(st.nextToken()));
				detailDTO.setPosY(Float.parseFloat(st.nextToken()));
			}
			
			list.add(detailDTO);
		}
		
		basicDTO.setDetailList(list);
		
	}

}
