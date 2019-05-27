package com.kitri.together.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kitri.dto.TTLeaderDTO;
import com.kitri.util.DBClose;

public class TogetherDAO {
	//함께타요 일정 리스트 불러오기 (마감임박순)
	public List<TTLeaderDTO> selectPlan() {
		List<TTLeaderDTO> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "project2", "project2");
			
			String selectPlanSQL = "select tt.trip_seq, tt.trip_num, tt.now_num, "
					+ "tb.email, tb.trip_title, tb.start_date, tb.end_date, tb.viewCount, tb.likeCount, l.loc_name \r\n" + 
					"from tt_leader tt, trip_basic tb, trip_detail td, place p, location l " + 
					"where tt.trip_seq = tb.trip_seq " + 
					"and tb.trip_seq = td.trip_seq " + 
					"and p.place_id = td.place_id " + 
					"and p.loc_id = l.loc_id " + 
					"and tb.trip_theme = '함께타요' " +
					"order by tt.now_num/tt.trip_num";
			
			pstmt = con.prepareStatement(selectPlanSQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TTLeaderDTO ttLeaderDTO = new TTLeaderDTO();
				ttLeaderDTO.setTripSeq(rs.getInt("trip_seq"));
				ttLeaderDTO.setTripNum(rs.getInt("trip_num"));
				ttLeaderDTO.setNowNum(rs.getInt("now_num"));

				ttLeaderDTO.tripBasicDTO.setEmail(rs.getString("email"));
				ttLeaderDTO.tripBasicDTO.setTripTitle(rs.getString("trip_title"));
				ttLeaderDTO.tripBasicDTO.setStartDate(rs.getDate("start_date"));
				ttLeaderDTO.tripBasicDTO.setEndDate(rs.getDate("end_date"));
				ttLeaderDTO.tripBasicDTO.setViewCount(rs.getInt("viewCount"));
				ttLeaderDTO.tripBasicDTO.setLikeCount(rs.getInt("likeCount"));
				
				ttLeaderDTO.tripBasicDTO.tripDetailDTO.placeDTO.locationDTO.setLocName(rs.getString("loc_name"));
				
				list.add(ttLeaderDTO);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
	
		return list;
	}

	//마감임박best4
	public List<TTLeaderDTO> selectbest4() {
		List<TTLeaderDTO> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "project2", "project2");
			
			String selectbestSQL = "select rownum, t.* " + 
					"from(select tt.trip_seq, tt.trip_num, tt.now_num, tb.email, tb.trip_title, tb.start_date, tb.end_date, tb.viewCount, tb.likeCount, l.loc_name " + 
					"from tt_leader tt, trip_basic tb, trip_detail td, place p, location l " + 
					"where tt.trip_seq = tb.trip_seq " + 
					"and tb.trip_seq = td.trip_seq " + 
					"and p.place_id = td.place_id " + 
					"and p.loc_id = l.loc_id " + 
					"and tb.trip_theme = '함께타요' " + 
					"order by tt.now_num/tt.trip_num desc) t " + 
					"where rownum <= 4";
			
			pstmt = con.prepareStatement(selectbestSQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TTLeaderDTO ttLeaderDTO = new TTLeaderDTO();
				
				ttLeaderDTO.setTripSeq(rs.getInt("trip_seq"));
				ttLeaderDTO.setTripNum(rs.getInt("trip_num"));
				ttLeaderDTO.setNowNum(rs.getInt("now_num"));

				ttLeaderDTO.tripBasicDTO.setEmail(rs.getString("email"));
				ttLeaderDTO.tripBasicDTO.setTripTitle(rs.getString("trip_title"));
				ttLeaderDTO.tripBasicDTO.setStartDate(rs.getDate("start_date"));
				ttLeaderDTO.tripBasicDTO.setEndDate(rs.getDate("end_date"));
				ttLeaderDTO.tripBasicDTO.setViewCount(rs.getInt("viewCount"));
				ttLeaderDTO.tripBasicDTO.setLikeCount(rs.getInt("likeCount"));
				
				ttLeaderDTO.tripBasicDTO.tripDetailDTO.placeDTO.locationDTO.setLocName(rs.getString("loc_name"));
				
				list.add(ttLeaderDTO);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
	
		return list;
	}
	
}
