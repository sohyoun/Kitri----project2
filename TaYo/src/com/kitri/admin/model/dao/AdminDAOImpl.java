package com.kitri.admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.kitri.dto.AdminDTO;
import com.kitri.dto.MemberBoard;
import com.kitri.dto.MemberDetailDTO;
import com.kitri.util.DBClose;
import com.kitri.util.DBConnection;

public class AdminDAOImpl implements AdminDAO {

	// 싱글톤 적용
	private static AdminDAO adminDAO;

	static {
		adminDAO = new AdminDAOImpl();
	}

	private AdminDAOImpl() {
		
	}

	public static AdminDAO getAdminDAO() {
		return adminDAO;
	}

	// 로그인 정보
	public AdminDTO selectByEmail(String email) {
		AdminDTO adminDTO = new AdminDTO();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// DB 연결
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();

			sql.append("SELECT * " + "FROM user_tayo " + "WHERE email = ? ");

			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setString(1, email);
			// System.out.println(email);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				adminDTO.setEmail(rs.getString("email"));
				adminDTO.setName(rs.getString("name"));
				adminDTO.setPass(rs.getString("pass"));
				// System.out.println(rs.getString(1));

			}
		} catch (SQLException e) {
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
		}
		return adminDTO;
	}

	public int registerUser(MemberDetailDTO memberDetailDTO) {

		int cnt = -1;

		Connection conn = null;
		PreparedStatement pstmt = null;

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
			pstmt.setString(++index, memberDetailDTO.getName());
			pstmt.setString(++index, memberDetailDTO.getPass());
			pstmt.setInt(++index, memberDetailDTO.getAge());
			pstmt.setString(++index, memberDetailDTO.getGender());
			pstmt.setString(++index, memberDetailDTO.getAddress());
			pstmt.setString(++index, memberDetailDTO.getAddressDetail());

			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}

	public static void main(String[] args) {
		// SELECT TEST
		// AdminDaoImpl adminDaoImpl = new AdminDaoImpl();
		// String email = "12.12kimiyeon@gmail.com";
		// System.out.println(adminDaoImpl.selectByEmail(email));
		
		// SELECT ALL 
	//	AdminDAOImpl adminDAOImpl = new AdminDAOImpl();
	//	System.out.println(adminDAOImpl.selectAll());

	}
		
	@Override
	public List<MemberDetailDTO> selectAll() {
		
		List<MemberDetailDTO> list = new ArrayList<MemberDetailDTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT * \n");
			sql.append("FROM user_tayo ut, userdetail_tayo udt \n");
			sql.append("WHERE ut.email = udt.email \n");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
				while(rs.next()) {
					
					MemberDetailDTO memberDetailDTO = new MemberDetailDTO();
					memberDetailDTO.setEmail(rs.getString("email"));
					memberDetailDTO.setName(rs.getString("name"));
					memberDetailDTO.setAge(rs.getInt("age"));
					memberDetailDTO.setAddress(rs.getString("address"));
					memberDetailDTO.setAddressDetail(rs.getString("addressDetail"));
					memberDetailDTO.setJoindate(rs.getDate("joindate"));
					memberDetailDTO.setOutdate(rs.getDate("outdate"));
					memberDetailDTO.setGender(rs.getString("gender"));
					memberDetailDTO.setGrade(rs.getInt("grade"));
					
					list.add(memberDetailDTO);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public List<MemberBoard> selectByRows(int startRow, int endRow) {
		List<MemberBoard> list = new ArrayList<MemberBoard>();
		
				 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();

			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT * " + 
					"	FROM(SELECT rownum r, user_tayo.*, userdetail_tayo.* \n" +
					"	START WITH parent_seq = 0 \n" +
					"	CONNECT BY PRIOR board_seq = parent_seq \n" +
					"	ORDER SIBLINGS BY board_seq DESC \n" +
					"WHERE r BETWEEN ? AND ? ");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberBoard memberBoard = new MemberBoard();
				
				memberBoard.setBoard_seq(rs.getInt("board_seq"));
				memberBoard.setParent_seq(rs.getInt("parent_seq"));
				memberBoard.setEmail(rs.getString("email"));
				memberBoard.setName(rs.getString("name"));
				memberBoard.setAge(rs.getInt("age"));
				memberBoard.setAddress(rs.getString("address"));
				memberBoard.setAddressDetail(rs.getString("address_detail"));
				memberBoard.setGender(rs.getString("gender"));
				memberBoard.setGrade(rs.getInt("grade"));
				
				list.add(memberBoard);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	public int selectTotalCnt() {
		int totalCnt = -1;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT COUNT(*) \n" +
					   "FROM memberboard \n");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				totalCnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		return totalCnt;
	}
	
}
