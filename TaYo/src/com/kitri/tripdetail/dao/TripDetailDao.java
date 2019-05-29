package com.kitri.tripdetail.dao;

import java.sql.Clob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kitri.dto.TripDetailDTO;
import com.kitri.util.DBClose;
import com.kitri.util.DBConnection;

public class TripDetailDao {
	static TripDetailDao tripDetailDao;
	
	static{
		tripDetailDao = new TripDetailDao();
	}
	private TripDetailDao () {}
	public static TripDetailDao getInstance() {
		return tripDetailDao;
	}

	public List<TripDetailDTO> select(int sequance) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<TripDetailDTO> detailList = new ArrayList<TripDetailDTO>();
		try {
			conn = DBConnection.makeConnection();
			String sql = "select trip_seq, place_name, loc_id, trip_order, trip_day, image, detail_title, detail_content, posx, posy\n" + 
					"from trip_detail "
					+ "where trip_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sequance);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int trip_seq = rs.getInt("trip_seq");
				String place_name= rs.getString("place_name");
				int loc_id= rs.getInt("loc_id");
				int trip_order= rs.getInt("trip_order");
				int trip_day= rs.getInt("trip_day");
				String image= rs.getString("image");
				String detail_title= rs.getString("detail_title");
				Clob detail_content= rs.getClob("detail_content");
				float posX = rs.getFloat("posX");
				float posY= rs.getFloat("posY");
				
				TripDetailDTO dto = new TripDetailDTO(trip_order, trip_day, trip_seq, place_name, loc_id, image, detail_title, detail_content, posX, posY);
				detailList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return detailList;	
	}


	public String select(Integer sequance) {
		return null;
	}


	public int insert(TripDetailDTO obj) {

		return 0;
	}
	
	public static void main(String[] args) {
		System.out.println("1");
		TripDetailDao dao = new TripDetailDao();
		List<TripDetailDTO> list = dao.select(22);
		for(TripDetailDTO dto: list) {
			System.out.println(dto.toString());
		}
	}

}
