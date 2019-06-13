package com.kitri.admin.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitri.admin.dao.AdminDAOImpl;
import com.kitri.dto.GonggiBoardDTO;
import com.kitri.util.DBConnection;

public class GonggiService {
	Connection conn = null;

	public GonggiService() {

	}

	// 공지사항 글 목록
	public List<GonggiBoardDTO> selectGonggi(int startRow, int endRow) {
		return AdminDAOImpl.getAdminDAO().selGonggi(startRow, endRow);
	}

	// 공지사항 글 쓰기
	public GonggiBoardDTO writer(GonggiBoardDTO gonggiBoard) {
		try {
			conn = DBConnection.makeConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if (gonggiBoard == null) { // 쓴 데이터가 빈 값이라면
			try {
				conn.setAutoCommit(false);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			try {
				conn.commit();
			} catch (SQLException e) {
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
			}
		}
		return AdminDAOImpl.getAdminDAO().write(gonggiBoard);
	}

	public int getTotalCnt() {
		return AdminDAOImpl.getAdminDAO().gonggiTotalCnt();
	}

	public List<GonggiBoardDTO> getGonggiSearch(String gonggiSearch, String value) {
		return AdminDAOImpl.getAdminDAO().gongiSearch(gonggiSearch, value);
	}

}
