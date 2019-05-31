package com.kitri.util;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;

public class Util {

	// 출처: https://jang8584.tistory.com/171 [개발자의 길]
	// CLOB데이터 읽기 //테스트 미완료
	public static String readCLOB(java.sql.Clob p_clob) throws IOException, SQLException {
		StringBuffer outBuffer = new StringBuffer();
		Reader l_clobStream = null;
		try {
			l_clobStream = p_clob.getCharacterStream();
			int l_nchars = 0;
			char[] l_buffer = new char[4096];
			while ((l_nchars = l_clobStream.read(l_buffer)) != -1) {
				outBuffer.append(l_buffer, 0, l_nchars);
			}

		} catch (IOException e) {
			throw e;
		} catch (SQLException e) {
			throw e;
		} finally {
			try {
				l_clobStream.close();
			} catch (IOException e) {
				throw e;
			}
		}
		return outBuffer.toString();
	}
}
