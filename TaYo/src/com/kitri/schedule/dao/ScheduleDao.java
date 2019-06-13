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
				insertSQL.append("INSERT INTO trip_detail (trip_seq, trip_day, trip_order, place_name, loc_id, posx, posy, content_id) ");
				insertSQL.append("values (sq_tripbasic_tripseq.currVal, ?, ?, ?, ?, ?, ?, ?)");
				
				pstmt = conn.prepareStatement(insertSQL.toString());
				
				idx = 1;
				pstmt.setInt(idx++, tripDetailDTO.getTrip_day());
				pstmt.setInt(idx++, tripDetailDTO.getTrip_order());
				pstmt.setString(idx++, tripDetailDTO.getPlace_name());
				pstmt.setInt(idx++, tripDetailDTO.getLoc_id());
				pstmt.setFloat(idx++, tripDetailDTO.getPosX());
				pstmt.setFloat(idx++, tripDetailDTO.getPosY());
				pstmt.setInt(idx, tripDetailDTO.getContent_id());
				result += pstmt.executeUpdate();
				pstmt.close();
			}

			if (result != (list.size() + 1)) {
				result = 0;
				conn.rollback();
				return result;
			}
			
			// Insert TT_Leader
			insertSQL.setLength(0);
			insertSQL.append("INSERT INTO tt_leader (trip_seq, now_num, trip_num) ");
			insertSQL.append("values (sq_tripbasic_tripseq.currVal, 0,"+basicDTO.getTripNum()+")");
			
			pstmt = conn.prepareStatement(insertSQL.toString());
			result += pstmt.executeUpdate();
			
			pstmt.close();
			
			if (result != (list.size() + 2)) {
				result = 0;
				conn.rollback();
				return result;
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
			DBClose.close(conn, pstmt);
		}
		
		return result;
	}
	
	public int modifyBasic(TripBasicDTO basicDTO, String oldTitle) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = 0;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			
			// Search Trip Sequence from Trip_Basic
			StringBuffer searchSQL = new StringBuffer();
			searchSQL.append("SELECT trip_seq ");
			searchSQL.append("FROM trip_basic ");
			searchSQL.append("WHERE email = ? and trip_title = ?");
			
			pstmt = conn.prepareStatement(searchSQL.toString());
			
			int idx = 1;
			pstmt.setString(idx++, basicDTO.getEmail());
			pstmt.setString(idx, oldTitle);
			rs = pstmt.executeQuery();
			
			int seq = -1;
			if (rs.next()) {
				seq = rs.getInt(1);
			} else {
				result = 0;
				conn.rollback();
				return result;
			}

			rs.close();
			pstmt.close();
			
			// Modify Trip_Basic
			StringBuffer modifySQL = new StringBuffer();
			modifySQL.append("UPDATE trip_basic ");
			modifySQL.append("SET trip_title = ?, trip_theme = ?, trip_season = ?, trip_num = ?, start_date = ?, end_date = ?, lastupdate = sysdate, isComplete = ? ");
			modifySQL.append("WHERE trip_seq = ?");
			
			pstmt = conn.prepareStatement(modifySQL.toString());
			
			idx = 1;
			pstmt.setString(idx++, basicDTO.getTripTitle());
			pstmt.setString(idx++, basicDTO.getTripTheme());
			pstmt.setString(idx++, basicDTO.getTripSeason());
			pstmt.setInt(idx++, basicDTO.getTripNum());
			pstmt.setDate(idx++, new java.sql.Date(basicDTO.getStartDate().getTime()));
			pstmt.setDate(idx++, new java.sql.Date(basicDTO.getEndDate().getTime()));
			pstmt.setString(idx++, basicDTO.getIsComplete());
			pstmt.setInt(idx, seq);
			result += pstmt.executeUpdate();
			
			pstmt.close();
			
			if (result != 1) {
				result = 0;
				conn.rollback();
				return result;
			}
			
			// Count Trip_Detail (already exists)
			searchSQL.setLength(0);
			searchSQL.append("SELECT count(*) ");
			searchSQL.append("FROM trip_detail ");
			searchSQL.append("WHERE trip_seq = ?");
			
			pstmt = conn.prepareStatement(searchSQL.toString());
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			
			int count = -1;
			if (rs.next()) {
				count = rs.getInt(1);
			} else {
				result = 0;
				conn.rollback();
				return result;
			}
			
			rs.close();
			pstmt.close();
			searchSQL = null;
			
			// Delete Trip_Detail (already exists)
			int deleteCount = -1;
			StringBuffer deleteSQL = new StringBuffer();
			deleteSQL.append("DELETE FROM trip_detail ");
			deleteSQL.append("WHERE trip_seq = ?");
			
			pstmt = conn.prepareStatement(deleteSQL.toString());
			pstmt.setInt(1, seq);
			deleteCount = pstmt.executeUpdate();
			
			if (deleteCount != count) {
				result = 0;
				conn.rollback();
				return result;
			}
			
			pstmt.close();
			
			// insert Trip_Detail (modified plan)
			List<TripDetailDTO> list = basicDTO.getDetailList();
			
			for (TripDetailDTO tripDetailDTO : list) {
				modifySQL.setLength(0);
				modifySQL.append("INSERT INTO trip_detail (trip_seq, trip_day, trip_order, place_name, loc_id, posx, posy) ");
				modifySQL.append("values (?, ?, ?, ?, ?, ?, ?)");
				
				pstmt = conn.prepareStatement(modifySQL.toString());
				
				idx = 1;
				pstmt.setInt(idx++, seq);
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
				searchSQL.append("WHERE trip_seq = ? ");
				searchSQL.append("ORDER BY trip_day ASC, trip_order ASC");
				
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

	public TripBasicDTO find(String email, String title) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		TripBasicDTO basicDTO = null;
		List<TripDetailDTO> detailList = null;

		try {
			conn = DBConnection.makeConnection();
			
			// Search Trip_Basic
			StringBuffer findSQL = new StringBuffer();
			findSQL.append("SELECT trip_seq, email, trip_title, trip_theme, trip_season, trip_num, start_date, end_date ");
			findSQL.append("FROM trip_basic ");
			findSQL.append("WHERE email = ? and trip_title = ?");
			
			pstmt = conn.prepareStatement(findSQL.toString());
			
			int idx = 1;
			pstmt.setString(idx++, email);
			pstmt.setString(idx, title);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				basicDTO = new TripBasicDTO();
				basicDTO.setTripSeq(rs.getInt("trip_seq"));
				basicDTO.setEmail(rs.getString("email"));
				basicDTO.setTripTitle(rs.getString("trip_title"));
				basicDTO.setTripTheme(rs.getString("trip_theme"));
				basicDTO.setTripSeason(rs.getString("trip_season"));
				basicDTO.setTripNum(rs.getInt("trip_num"));
				basicDTO.setStartDate(rs.getDate("start_date"));
				basicDTO.setEndDate(rs.getDate("end_date"));
			}
			
			rs.close();
			pstmt.close();
			
			// Search Trip_Detail
			findSQL.setLength(0);
			findSQL.append("SELECT trip_seq, trip_day, trip_order, place_name, loc_id, posx, posy, detail_title, detail_content ");
			findSQL.append("FROM trip_detail ");
			findSQL.append("WHERE trip_seq = ? ");
			findSQL.append("ORDER BY trip_day ASC, trip_order ASC");
			
			pstmt = conn.prepareStatement(findSQL.toString());
			
			pstmt.setInt(1, basicDTO.getTripSeq());
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
				detailDTO.setDetail_title(rs.getString("detail_title"));
				detailDTO.setDetail_content(rs.getString("detail_content"));
				
				detailList.add(detailDTO);
			}
			
			basicDTO.setDetailList(detailList);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return basicDTO;
	}

	public int delete(String email, String title) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = 0;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			
			// Search Trip Sequence from Trip_Basic
			StringBuffer searchSQL = new StringBuffer();
			searchSQL.append("SELECT trip_seq ");
			searchSQL.append("FROM trip_basic ");
			searchSQL.append("WHERE email = ? and trip_title = ?");
			
			pstmt = conn.prepareStatement(searchSQL.toString());
			
			int idx = 1;
			pstmt.setString(idx++, email);
			pstmt.setString(idx, title);
			rs = pstmt.executeQuery();
			
			int seq = -1;
			if (rs.next()) {
				seq = rs.getInt(1);
			} else {
				result = 0;
				conn.rollback();
				return result;
			}

			rs.close();
			pstmt.close();
			
			// Count Trip_Detail that matches Trip Sequence
			searchSQL.setLength(0);
			searchSQL.append("SELECT count(*) ");
			searchSQL.append("FROM trip_detail ");
			searchSQL.append("WHERE trip_seq = ?");
			
			pstmt = conn.prepareStatement(searchSQL.toString());
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			
			int count = -1;
			if (rs.next()) {
				count = rs.getInt(1);
			} else {
				result = 0;
				conn.rollback();
				return result;
			}
			
			rs.close();
			pstmt.close();
			
			// Delete Trip_Detail that matches Trip Sequence
			StringBuffer deleteSQL = new StringBuffer();
			deleteSQL.append("DELETE FROM trip_detail ");
			deleteSQL.append("WHERE trip_seq = ?");
			
			pstmt = conn.prepareStatement(deleteSQL.toString());
			pstmt.setInt(1, seq);
			result += pstmt.executeUpdate();
			
			if (result != count) {
				result = 0;
				conn.rollback();
				return result;
			}
			
			pstmt.close();
			
			// Find TT_Ask that matches Trip Sequence
			searchSQL.setLength(0);
			searchSQL.append("SELECT count(*) ");
			searchSQL.append("FROM tt_ask ");
			searchSQL.append("WHERE trip_seq = ?");
			
			pstmt = conn.prepareStatement(searchSQL.toString());
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
			
			// Delete TT_Ask that matches Trip Sequence
			if (cnt != 0) {
				deleteSQL.setLength(0);
				deleteSQL.append("DELETE FROM tt_ask ");
				deleteSQL.append("WHERE trip_seq = ?");
				
				pstmt = conn.prepareStatement(searchSQL.toString());
				pstmt.setInt(1, seq);
				
				int delcnt = 0;
				delcnt = pstmt.executeUpdate();
				
				if (delcnt != cnt) {
					result = 0;
					conn.rollback();
					return result;
				}
				
				pstmt.close();
			}
			
			// Find TT_Party that matches Trip Sequence
			searchSQL.setLength(0);
			searchSQL.append("SELECT count(*) ");
			searchSQL.append("FROM tt_party ");
			searchSQL.append("WHERE trip_seq = ?");
			
			pstmt = conn.prepareStatement(searchSQL.toString());
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			
			cnt = 0;
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
			
			// Delete TT_Party that matches Trip Sequence
			if (cnt != 0) {
				deleteSQL.setLength(0);
				deleteSQL.append("DELETE FROM tt_party ");
				deleteSQL.append("WHERE trip_seq = ?");
				
				pstmt = conn.prepareStatement(searchSQL.toString());
				pstmt.setInt(1, seq);
				
				int delcnt = 0;
				delcnt = pstmt.executeUpdate();
				
				if (delcnt != cnt) {
					result = 0;
					conn.rollback();
					return result;
				}
				
				pstmt.close();
			}
			
			// Find TT_Leader that matches Trip Sequence
			searchSQL.setLength(0);
			searchSQL.append("SELECT count(*) ");
			searchSQL.append("FROM tt_leader ");
			searchSQL.append("WHERE trip_seq = ?");
			
			pstmt = conn.prepareStatement(searchSQL.toString());
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			
			cnt = 0;
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
			
			// Delete TT_Leader that matches Trip Sequence
			if (cnt != 0) {
				deleteSQL.setLength(0);
				deleteSQL.append("DELETE FROM tt_leader ");
				deleteSQL.append("WHERE trip_seq = ?");
				
				pstmt = conn.prepareStatement(searchSQL.toString());
				pstmt.setInt(1, seq);
				
				int delcnt = 0;
				delcnt = pstmt.executeUpdate();
				
				if (delcnt != cnt) {
					result = 0;
					conn.rollback();
					return result;
				}
				
				pstmt.close();
			}
			
			// Delete Trip_Basic that matches Trip Sequence
			deleteSQL.setLength(0);
			deleteSQL.append("DELETE FROM trip_basic ");
			deleteSQL.append("WHERE trip_seq = ?");
			
			pstmt = conn.prepareStatement(deleteSQL.toString());
			pstmt.setInt(1, seq);
			result += pstmt.executeUpdate();

			if (result != (count + 1)) {
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

	public int modifyDetail(String email, String title, int day, int order, String detailTitle, String detailContent) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int result = 0;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			
			// Search Trip Sequence from Trip_Basic
			StringBuffer searchSQL = new StringBuffer();
			searchSQL.append("SELECT trip_seq ");
			searchSQL.append("FROM trip_basic ");
			searchSQL.append("WHERE email = ? and trip_title = ?");
			
			pstmt = conn.prepareStatement(searchSQL.toString());
			
			int idx = 1;
			pstmt.setString(idx++, email);
			pstmt.setString(idx, title);
			rs = pstmt.executeQuery();
			
			int seq = -1;
			if (rs.next()) {
				seq = rs.getInt(1);
			} else {
				result = 0;
				conn.rollback();
				return result;
			}

			rs.close();
			pstmt.close();
			searchSQL = null;
			
			// Modify Trip_Basic
			StringBuffer modifySQL = new StringBuffer();
			modifySQL.append("UPDATE trip_detail ");
			modifySQL.append("SET detail_title = ?, detail_content = ? ");
			modifySQL.append("WHERE trip_seq = ? and trip_day = ? and trip_order = ?");

			pstmt = conn.prepareStatement(modifySQL.toString());
			
			idx = 1;
			pstmt.setString(idx++, detailTitle);
			pstmt.setString(idx++, detailContent);
			pstmt.setInt(idx++, seq);
			pstmt.setInt(idx++, day);
			pstmt.setInt(idx, order);
			result += pstmt.executeUpdate();
			
			if (result != 1) {
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
}
