package com.kitri.tripbasic.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.kitiri.impl.DbDml;
import com.kitri.dto.TripBasicDTO;
import com.kitri.util.DBClose;
import com.kitri.util.DBConnection;

public class TripBasicDAO implements DbDml{
	private static TripBasicDAO tripBasicDao; 
	static {
		tripBasicDao = new TripBasicDAO();
	}
	@Override
	public TripBasicDAO getInstance() {
		return tripBasicDao;
	}
	@Override
	public List<Object> selectAll() {
		List<Object> list = new ArrayList<Object>();
		TripBasicDTO tripBasicDto =new TripBasicDTO();
		list.add(tripBasicDto);
		
		return list;
	}
	@Override
	public int insert() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		try {
			conn = DBConnection.makeConnection();
//			String sql = ;
//			pstmt = conn.prepareStatement(sql);
//
//			pstmt.setString(1, name);
//			pstmt.setString(2, email);
//			pstmt.setString(3, pass);
//			pstmt.setInt(4, age);
//			pstmt.setInt(5, grade);
//			pstmt.setString(6, gender);
//
//			pstmt.setString(7, email);
//			pstmt.setString(8, address);
//			pstmt.setString(9, address_detail);
//			pstmt.setDate(10, new java.sql.Date(joindate.getTime()));
//			pstmt.setDate(11, new java.sql.Date(outdate.getTime()));

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		return result;
	}


	@Override
	public String select(Object id) {
		return null;
	}
	
	
	public static void main(String[] args) {
		tripBasicDao.getInstance().insert();
	}

}
