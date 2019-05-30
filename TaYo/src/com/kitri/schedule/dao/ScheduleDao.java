package com.kitri.schedule.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.kitri.dto.TripBasicDTO;
import com.kitri.dto.TripDetailDTO;
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
			
			StringBuffer insertSQL = new StringBuffer();
			insertSQL.append("INSERT INTO trip_basic (email, trip_title, trip_theme, trip_season, trip_num, start_date, end_date, lastupdate, isComplete) ");
			insertSQL.append("values (?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?)");
			
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
			
			// add trip detail and together (if nesessary)
		} catch (SQLException e) {
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
		
		return result;
	}
}
