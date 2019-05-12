package com.kitri.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// static   constructor
//   A a   =    new A();

public class DBConnection {

	// 객체를 여러개 선언해도 단 한 번만 호출하도록 함. (생성자와는 다름)
	static {
		try {
			Class.forName(SiteContance.DB_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection makeConnection() throws SQLException {
		return DriverManager.getConnection(SiteContance.DB_URL, SiteContance.DB_USERNAME, SiteContance.DB_PASSWORD);
	}
}
