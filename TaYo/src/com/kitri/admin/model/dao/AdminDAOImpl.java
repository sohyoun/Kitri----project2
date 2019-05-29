package com.kitri.admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import com.kitri.dto.AdminDTO;
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

	}

	@Override
	public List<MemberDetailDTO> getMemberList(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}
}
