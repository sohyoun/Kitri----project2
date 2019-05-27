package com.kitri.admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kitri.admin.model.AdminDto;
import com.kitri.dto.MemberDTO;
import com.kitri.dto.MemberDetailDTO;
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
							"FROM user_tayo " +
							"WHERE email = ? ");
			
			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setString(1, email);
				System.out.println(email);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				
				adminDto.setAdminEmail(rs.getString("email"));
				adminDto.setAdminName(rs.getString("name"));
				adminDto.setAdminPass(rs.getString("pass"));
				//System.out.println(rs.getString(1));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

	public int registerUser(MemberDetailDTO memberDetailDTO) {
		int cnt = -1;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		MemberDTO memberDTO = new MemberDTO();			
		
		try {
			conn = DBConnection.makeConnection();
			
			StringBuffer sb = new StringBuffer();
			sb.append("INSERT ALL \n");
			sb.append("INTO user_tayo (email, name, pass, age, grade, gender) ");
			sb.append("VALUES (?, ?, ?, ?, 1, ?) ");
			sb.append("INTO userdetail_tayo (email, address, address_detail, joindate, outdate) ");
			sb.append("VALUES(?, ?, ?, sysdate, null) ");
			sb.append("SELECT * FROM DUAL ");
			
			pstmt = conn.prepareStatement(sb.toString());
			
			int index = 0;
			
			pstmt.setString(++index, memberDetailDTO.getEmail());
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
		
		
		return 0;
	}
	
	
	public static void main(String[] args) {
		//SELECT TEST
		//AdminDaoImpl adminDaoImpl = new AdminDaoImpl();
		//String email = "12.12kimiyeon@gmail.com";
		//System.out.println(adminDaoImpl.selectByEmail(email));
		
	}
	
	
}
