package com.kitri.admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kitri.admin.model.AdminDto;
import com.kitri.member.model.MemberDetailDto;
import com.kitri.util.DBConnection;

public class AdminDaoImpl implements AdminDao{

	// 싱글톤 적용 
	private static AdminDao adminDao;
	
	static {
		adminDao = new AdminDaoImpl();
	}
	
	private AdminDaoImpl () {}

	public static AdminDao getAdminDao() {
		return adminDao;
	}
	
	
	// 로그인 정보 
	@Override
	public  AdminDto selectByEmail(String email) {
	
		AdminDto adminDto = new AdminDto();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// DB 연결 
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT * " + 
							"FROM user_tayo \n" +
							"WHERE email = ? \n");
			
			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setString(1, email);
				
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				adminDto.setAdminEmail(rs.getString("email"));
				adminDto.setAdminName(rs.getString("name"));
				adminDto.setAdminPass(rs.getString("pass"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			if(pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			if(conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
		}
		
		return adminDto;
	}

	public static void main(String[] args) {
		AdminDaoImpl adminDaoImpl = new AdminDaoImpl();
		String email = "12.12kimiyeon@gmail.com";

		System.out.println(adminDaoImpl.selectByEmail(email));
		
		
	}
	
	
}
