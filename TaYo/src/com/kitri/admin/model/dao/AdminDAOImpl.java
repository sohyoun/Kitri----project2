package com.kitri.admin.model.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.TEST_DB.DBConnection;
import com.kitri.dto.*;
import com.kitri.util.DBClose;

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
	@Override
	public AdminDTO selectByEmail(String admin_email) {
		AdminDTO adminDTO = new AdminDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

	// DB 연결
		try {
			
			conn = DBConnection.makeConnection();
			
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

	public static void main(String[] args) {
		// 관리자 계정 로그인 SELECT TEST
		//AdminDAOImpl adminDaoImpl = new AdminDAOImpl();
		//String admin_email = "email";
		//System.out.println(adminDaoImpl.selectByEmail(admin_email));
		
		//회원목록테이블 SELECT ALL 
		//AdminDAOImpl adminDAOImpl = new AdminDAOImpl();
		//System.out.println("memberboard == " +adminDAOImpl.selectAll());

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
	
	//회원목록 테이블 페이징처리 
	@Override
	public List<MemberBoardDTO> selectByRows(int startRow, int endRow) {
		List<MemberBoardDTO> list = new ArrayList<MemberBoardDTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();

			StringBuffer sql = new StringBuffer();
			
			/*
			 * sql.append("SELECT * " + "FROM(SELECT rownum r, m.* \n" +
			 * "		 FROM (SELECT * FROM memberboard \n" +
			 * "				  ORDER BY board_seq DESC) m \n" +
			 * "		 WHERE rownum <= ?) \n" + "WHERE r >= ? \n");
			 */
			
			sql.append("SELECT *\n" + 
							"FROM(SELECT rownum r, m.*\n" + 
									 "FROM(SELECT * FROM memberboard ORDER BY mboard_seq DESC) m\n" + 
									 "WHERE rownum <= ?)\n" + 
							"WHERE r >= ? ");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			//System.out.println("startRow == " + startRow);
			//System.out.println("endRow == " +endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				MemberBoardDTO memberBoard = new MemberBoardDTO();
				
				memberBoard.setMboard_seq(rs.getInt("mboard_seq"));
				memberBoard.setMember_email(rs.getString("member_email"));
				memberBoard.setMember_name(rs.getString("member_name"));
				memberBoard.setMember_age(rs.getInt("member_age"));
				memberBoard.setMember_address(rs.getString("member_address"));
				memberBoard.setMember_addressDetail(rs.getString("member_address_detail"));
				memberBoard.setMember_joindate(rs.getDate("member_joindate"));
				memberBoard.setMember_outdate(rs.getDate("member_outdate"));
				memberBoard.setMember_gender(rs.getString("member_gender"));
				memberBoard.setMember_grade(rs.getInt("member_grade"));
				
				list.add(memberBoard);
			}
			//System.out.println("size == " + list.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	//회원테이블 총
	@Override
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
	
	//회원가입한 회원 수 
	@Override
	public int joindateTotalCnt() {
		int totalCnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT COUNT(member_joindate) " +
					   "FROM memberboard ");

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
	@Override
	public int blackTotalCnt() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int blackTotalCnt = 0;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT COUNT(*) " +
					   "FROM memberboard " +
					   "WHERE member_grade = 0 ");
			
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
	public List<MemberBoardDTO> memberSearch(String searchType, String keyword) {
		
		List<MemberBoardDTO> list = new ArrayList<MemberBoardDTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			
			
			
			sql.append("SELECT * " +  
					   	   "FROM memberboard ");  
			
				if(searchType.equals("member_email")) {
					System.out.println("이메일 == " + searchType);
					sql.append("WHERE " + searchType + " like '%'||?||'%' ");
				}else if(searchType.equals("member_name")) {
					System.out.println("이름 == " + searchType);
					sql.append("WHERE " + searchType + " like '%'||?||'%' ");
				}else if(searchType.equals("member_gender")) {
					System.out.println("성별 == " + searchType);
					sql.append("WHERE " + searchType + " like '%'||?||'%' ");
				}
				
			pstmt = conn.prepareStatement(sql.toString());
			
			if(searchType.equals("member_email")) {
				pstmt.setString(1, keyword);
			}else if(searchType.equals("member_name")) {
				pstmt.setString(1, keyword);
			}else if(searchType.equals("member_gender")) {
				pstmt.setString(1, keyword);
			}
			//System.out.println("keyword == " + keyword);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				MemberBoardDTO memberBoard = new MemberBoardDTO();
				
				memberBoard.setMboard_seq(rs.getInt("mboard_seq"));
				memberBoard.setMember_email(rs.getString("member_email"));
				memberBoard.setMember_name(rs.getString("member_name"));
				memberBoard.setMember_age(rs.getInt("member_age"));
				memberBoard.setMember_address(rs.getString("member_address"));
				memberBoard.setMember_addressDetail(rs.getString("member_address_detail"));
				memberBoard.setMember_joindate(rs.getDate("member_joindate"));
				memberBoard.setMember_outdate(rs.getDate("member_outdate"));
				memberBoard.setMember_gender(rs.getString("member_gender"));
				memberBoard.setMember_grade(rs.getInt("member_grade"));
				
				list.add(memberBoard);			
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}

	return list;
	
	}
	
	@Override
	public GonggiBoardDTO insert(GonggiBoardDTO gonggiBoard){

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();

			String sql = "INSERT INTO gonggiboard("
					+ "	GBOARD_SEQ, GBOARD_GROUP, GBOARD_SUBJECT, GBOARD_WRITER, GBOARD_CONTENTS, GBOARD_DATE, GBOARD_VIEWCOUNT) \n"
					+ "	VALUES(gboard_seq.nextval, ?, ?, ?, ? , systimestamp, 0) \n";

					pstmt = conn.prepareStatement(sql.toString());
			
					pstmt.setString(1, gonggiBoard.getGboard_group());
					pstmt.setString(2, gonggiBoard.getGboard_subject());
					pstmt.setString(3, gonggiBoard.getGboard_writer());
					pstmt.setString(4, gonggiBoard.getGboard_subject());
					
					pstmt.executeUpdate();
					
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt);
		}
		return gonggiBoard;
	}
	
	@Override
	public List<GonggiBoardDTO> selectGonggi(int startRow, int endRow) {
		
		List<GonggiBoardDTO> list = new ArrayList<GonggiBoardDTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();

			StringBuffer sql = new StringBuffer();
			
			/*
			 * sql.append("SELECT * " + "FROM(SELECT rownum r, m.* \n" +
			 * "		 FROM (SELECT * FROM memberboard \n" +
			 * "				  ORDER BY board_seq DESC) m \n" +
			 * "		 WHERE rownum <= ?) \n" + "WHERE r >= ? \n");
			 */
			
			sql.append("SELECT *\n" + 
							"FROM(SELECT rownum r, m.*\n" + 
									 "FROM(SELECT * FROM gonggi ORDER BY gboard_seq DESC) m\n" + 
									 "WHERE rownum <= ?)\n" + 
							"WHERE r >= ? ");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			//System.out.println("startRow == " + startRow);
			//System.out.println("endRow == " +endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				GonggiBoardDTO gonggiBoard = new GonggiBoardDTO();
				
				gonggiBoard.setGboard_seq(rs.getInt("gboard_seq"));
				gonggiBoard.setGboard_group(rs.getString("gboard_group"));
				gonggiBoard.setGboard_subject(rs.getString("gboard_subject"));
				gonggiBoard.setGboard_writer(rs.getString("writer"));
				gonggiBoard.setGboard_contents(rs.getString("gboard_contents"));
				gonggiBoard.setGboard_date(rs.getTimestamp("gboard_date"));
				gonggiBoard.setGboard_viewcount(rs.getInt("gboard_viewcount"));
			
				list.add(gonggiBoard);
			}
			//System.out.println("size == " + list.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
}
