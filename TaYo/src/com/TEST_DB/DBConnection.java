package com.TEST_DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnection {


	static {
		try {
			Class.forName(com.TEST_DB.SiteContance.DB_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection makeConnection() throws SQLException {
		return DriverManager.getConnection(com.TEST_DB.SiteContance.DB_URL, com.TEST_DB.SiteContance.DB_USERNAME, com.TEST_DB.SiteContance.DB_PASSWORD);
	}
}
