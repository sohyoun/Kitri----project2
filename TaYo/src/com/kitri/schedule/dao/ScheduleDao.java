package com.kitri.schedule.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kitri.dto.TripBasicDTO;
import com.kitri.dto.TripDetailDTO;
import com.kitri.util.DBClose;
import com.kitri.util.DBConnection;


public class ScheduleDao {

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

	public List<TripBasicDTO> search(String email, String type) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<TripBasicDTO> basicList = new ArrayList<TripBasicDTO>();
		List<TripDetailDTO> detailList = null;
		
		try {
			conn = DBConnection.makeConnection();

			// Search Trip_Basic
			StringBuffer searchSQL = new StringBuffer();
			searchSQL.append("SELECT trip_seq, email, trip_title, trip_theme, trip_season, trip_num, start_date, end_date, viewCount, likeCount ");
			searchSQL.append("FROM trip_basic ");
			searchSQL.append("WHERE email = ? and isComplete = ?");
			
			pstmt = conn.prepareStatement(searchSQL.toString());
			
			int idx = 1;
			pstmt.setString(idx++, email);
			pstmt.setString(idx, type);
			rs = pstmt.executeQuery();
			
			TripBasicDTO basicDTO = null;
			while (rs.next()) {
				basicDTO = new TripBasicDTO();
				basicDTO.setTripSeq(rs.getInt("trip_seq"));
				basicDTO.setEmail(rs.getString("email"));
				basicDTO.setTripTitle(rs.getString("trip_title"));
				basicDTO.setTripTheme(rs.getString("trip_theme"));
				basicDTO.setTripSeason(rs.getString("trip_season"));
				basicDTO.setTripNum(rs.getInt("trip_num"));
				basicDTO.setStartDate(rs.getDate("start_date"));
				basicDTO.setEndDate(rs.getDate("end_date"));
				basicDTO.setViewCount(rs.getInt("viewCount"));
				basicDTO.setLikeCount(rs.getInt("likeCount"));
				
				basicList.add(basicDTO);
			}

			rs.close();
			pstmt.close();
			
			// Search Trip_Detail
			for (TripBasicDTO basic : basicList) {
				searchSQL.setLength(0);
				searchSQL.append("SELECT trip_seq, trip_day, trip_order, place_name, loc_id, posx, posy ");
				searchSQL.append("FROM trip_detail ");
				searchSQL.append("WHERE trip_seq = ?");
				
				pstmt = conn.prepareStatement(searchSQL.toString());
				
				pstmt.setInt(1, basic.getTripSeq());
				rs = pstmt.executeQuery();
				
				detailList = new ArrayList<TripDetailDTO>();
				TripDetailDTO detailDTO = null;
				while (rs.next()) {
					detailDTO = new TripDetailDTO();
					detailDTO.setTrip_seq(rs.getInt("trip_seq"));
					detailDTO.setTrip_day(rs.getInt("trip_day"));
					detailDTO.setTrip_order(rs.getInt("trip_order"));
					detailDTO.setPlace_name(rs.getString("place_name"));
					detailDTO.setLoc_id(rs.getInt("loc_id"));
					detailDTO.setPosX(rs.getFloat("posx"));
					detailDTO.setPosY(rs.getFloat("posy"));
					
					detailList.add(detailDTO);
				}
				
				basic.setDetailList(detailList);
				
				rs.close();
				pstmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return basicList;
	}
}
