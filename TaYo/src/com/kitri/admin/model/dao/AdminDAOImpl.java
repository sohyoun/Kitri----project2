package com.kitri.admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.TEST_DB.DBConnection;
import com.kitri.dto.AdminDTO;
import com.kitri.dto.MemberBoard;
import com.kitri.dto.MemberDetailDTO;
import com.kitri.util.DBClose;
import com.sun.org.apache.bcel.internal.generic.BALOAD;

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
	public AdminDTO selectByEmail(String admin_email) {
		AdminDTO adminDTO = new AdminDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

	// DB 연결
		try {
			
			conn = com.kitri.util.DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();

			sql.append("SELECT admin_email, admin_pass, admin_name \n" + 
					   "FROM admin \n" + 
					   "WHERE admin_email =? \n");

			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setString(1, admin_email);
			//System.out.println("관리자 이메일 ==" + admin_email);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			
				//System.out.println("email == " + rs.getString(1));

				adminDTO.setAdmin_email(admin_email);
				adminDTO.setAdmin_name(rs.getString("admin_name"));
				adminDTO.setAdmin_pass(rs.getString("admin_pass"));

			}
		} catch (SQLException e) {
			
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return adminDTO;
	}

	public int registerUser(MemberDetailDTO memberDetailDTO) {

		int cnt = -1;

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = com.TEST_DB.DBConnection.makeConnection();

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
		// 관리자 계정 로그인 SELECT TEST
		//AdminDAOImpl adminDaoImpl = new AdminDAOImpl();
		//String admin_email = "email";
		//System.out.println(adminDaoImpl.selectByEmail(admin_email));
		
		//회원목록테이블 SELECT ALL 
		AdminDAOImpl adminDAOImpl = new AdminDAOImpl();
		System.out.println("memberlist == " +adminDAOImpl.selectAll());

		//회원목록테이블 가입 수 반환하기
		//AdminDAOImpl adminDAOImpl = new AdminDAOImpl();
		//int result = adminDAOImpl.joindateTotalCnt();
		//System.out.println(result);
		
		//회원목록 테이블 페이지 개수 반환하기
		//AdminDAOImpl adminDAOImpl = new AdminDAOImpl();
		//int count = adminDAOImpl.selectTotalCnt();
		//System.out.println(count);
		
		//회원목록테이블 페이징 개수 구하기 
//		AdminDAOImpl adminDAOImpl = new AdminDAOImpl();
//		int startRow = 1;
//		int endRow = 10;
//		System.out.println(adminDAOImpl.selectByRows(startRow, endRow));
		
	}
	
	// 회원관리 게시판 
	@Override
	public List<MemberBoard> selectAll() {
		
		List<MemberBoard> list = new ArrayList<MemberBoard>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = com.kitri.util.DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT * \n");
			sql.append("FROM memberlist \n");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
				while(rs.next()) {
					
				MemberBoard memberBoard = new MemberBoard();
				
				memberBoard.setBoard_seq(rs.getInt("board_seq"));
				memberBoard.setEmail(rs.getString("email"));
				memberBoard.setName(rs.getString("name"));
				memberBoard.setAge(rs.getInt("age"));
				memberBoard.setAddress(rs.getString("address"));
				memberBoard.setAddressDetail(rs.getString("address_detail"));
				memberBoard.setJoindate(rs.getDate("joindate"));
				memberBoard.setOutdate(rs.getDate("outdate"));
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

	
	//회원목록 테이블 페이징처리 
	@Override
	public List<MemberBoard> selectByRows(int startRow, int endRow) {
		List<MemberBoard> list = new ArrayList<MemberBoard>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = com.kitri.util.DBConnection.makeConnection();

			StringBuffer sql = new StringBuffer();
			
			/*
			 * sql.append("SELECT * " + "FROM(SELECT rownum r, m.* \n" +
			 * "		 FROM (SELECT * FROM memberlist \n" +
			 * "				  ORDER BY board_seq DESC) m \n" +
			 * "		 WHERE rownum <= ?) \n" + "WHERE r >= ? \n");
			 */
			
			sql.append("SELECT *\n" + 
							"FROM(SELECT rownum r, m.*\n" + 
									 "FROM(SELECT * FROM memberlist ORDER BY board_seq DESC) m\n" + 
									 "WHERE rownum <= ?)\n" + 
							"WHERE r >= ? ");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			System.out.println("startRow == " + startRow);
			System.out.println("endRow == " +endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				MemberBoard memberBoard = new MemberBoard();
				
				memberBoard.setBoard_seq(rs.getInt("board_seq"));
				memberBoard.setEmail(rs.getString("email"));
				memberBoard.setName(rs.getString("name"));
				memberBoard.setAge(rs.getInt("age"));
				memberBoard.setAddress(rs.getString("address"));
				memberBoard.setAddressDetail(rs.getString("address_detail"));
				memberBoard.setGender(rs.getString("gender"));
				memberBoard.setGrade(rs.getInt("grade"));
				
				list.add(memberBoard);
			}
			System.out.println(" size " + list.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	//회원테이블 총
	public int selectTotalCnt() {
		int totalCnt = -1;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = com.kitri.util.DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT COUNT(*) \n" +
					   "FROM memberlist \n");
			
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
	
	//회원가입한 회원 수 
	public int joindateTotalCnt() {
		int totalCnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = com.kitri.util.DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT COUNT(joindate) " +
					   "FROM memberlist ");

			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				totalCnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		return totalCnt;
	}
	
	//블랙회원 수 
	public int blackTotalCnt() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int blackTotalCnt = 0;
		
		try {
			conn = com.kitri.util.DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT COUNT(*) " +
					   "FROM memberlist " +
					   "WHERE grade = 0 ");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				blackTotalCnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		return blackTotalCnt;
	}

	@Override
	public List<MemberBoard> memberSearch(String searchType, String keyword) {
		
		List<MemberBoard> list = new ArrayList<MemberBoard>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = com.kitri.util.DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT * " +  
					   "FROM memberlist ");  
			
				if(searchType =="이메일") {
					sql.append("WHERE " + searchType + "like '%" + keyword + "%' ");
				}else if(searchType == "이름") {
					sql.append("WHERE " + searchType + "like '%" + keyword + "%' ");
				}else if(searchType == "성별") {
					sql.append("WHERE " + searchType + "like '%" + keyword + "%' ");
				}
				
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				MemberBoard memberBoard = new MemberBoard();
				
				memberBoard.setBoard_seq(rs.getInt("board_seq"));
				memberBoard.setEmail(rs.getString("email"));
				memberBoard.setName(rs.getString("name"));
				memberBoard.setAge(rs.getInt("age"));
				memberBoard.setAddress(rs.getString("address"));
				memberBoard.setAddressDetail(rs.getString("address_detail"));
				memberBoard.setJoindate(rs.getDate("joindate"));
				memberBoard.setOutdate(rs.getDate("outdate"));
				memberBoard.setGender(rs.getString("gender"));
				memberBoard.setGrade(rs.getInt("grade"));
				
				list.add(memberBoard);			
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}

	return list;
	
	}
}
