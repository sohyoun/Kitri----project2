package com.kitri.place.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.util.SiteContance;

public class ApiService {

	public StringBuilder getUrl(String cmd, String numOfRows) {
		StringBuilder urlBuilder = new StringBuilder(); /* URL */

		try {
			urlBuilder.append(SiteContance.TOUR_APIURL + cmd);
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + SiteContance.KEY_TOUR_API);
			urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "="
					+ URLEncoder.encode("ETC", "UTF-8")); /* IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC */
			urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "="
					+ URLEncoder.encode("AppTest", "UTF-8")); /* 서비스명=어플명 */
			if (!"".equals(numOfRows)) {
				urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
						+ URLEncoder.encode(numOfRows, "UTF-8")); /* 페이지당 보여줄 개수 */
			}

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} /* Service Key */

		return urlBuilder;
	}

//	
//	public String getareaCode() {
//		try {
//			StringBuilder urlBuilder = new StringBuilder(
//					"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode"); /* URL */
//			urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + SiteContance.KEY_TOUR_API); /* Service Key */
//			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="+ URLEncoder.encode("17", "UTF-8"));
//			urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /* IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC */
//			urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" 	+ URLEncoder.encode("AppTest", "UTF-8")); /* 서비스명=어플명 */
//			
//			URL url = new URL(urlBuilder.toString());
//			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//			conn.setRequestMethod("GET");
//			conn.setRequestProperty("Content-type", "application/json");
//			BufferedReader rd;
//			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
//				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//			} else {
//				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
//			}
//			StringBuilder sb = new StringBuilder();
//			String line;
//			while ((line = rd.readLine()) != null) {
//				sb.append(line);
//			}
//			rd.close();
//			conn.disconnect();
//			return sb.toString();
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return null;
//	}

	public String getareaCode(String cmd) throws Exception {
		URL url = new URL(this.getUrl(cmd, "20").toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}

		System.out.println(sb.toString());
		rd.close();
		conn.disconnect();

		return sb.toString();
	}

	public String getSigungu(String areaCode) throws IOException {
		// 군구
		StringBuilder urlBuilder = new StringBuilder(
				"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode"); /* URL */
		urlBuilder.append(
				"?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + SiteContance.KEY_TOUR_API); /* Service Key */
//	        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("인증키 (URL - Encode)", "UTF-8")); /*공공데이터포털에서 발급받은 인증키*/
//	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("17", "UTF-8")); /*한 페이지 결과수*/
//	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
		urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "="
				+ URLEncoder.encode("ETC", "UTF-8")); /* IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC */
		urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "="
				+ URLEncoder.encode("AppTest", "UTF-8")); /* 서비스명=어플명 */
		urlBuilder.append("&" + URLEncoder.encode("areaCode", "UTF-8") + "="
				+ URLEncoder.encode(areaCode, "UTF-8")); /* 지역코드, 시군구코드 */ // 서울
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
//	        System.out.println("TourResionCodeService Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		return sb.toString();
	}

	public String getSigungu(String cmd, String areaCode) throws Exception {
		StringBuilder strB = this.getUrl(cmd, "20");
		strB.append("&" + URLEncoder.encode("areaCode", "UTF-8") + "=" + URLEncoder.encode(areaCode, "UTF-8"));

		URL url = new URL(strB.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}

		System.out.println(sb.toString());
		rd.close();
		conn.disconnect();

		return sb.toString();
	}

	public String getcat1(String cmd, String contentTypeId) throws IOException {
		StringBuilder strB = this.getUrl(cmd, "20");
		strB.append("&" + URLEncoder.encode("contentTypeId", "UTF-8") + "=" + URLEncoder.encode(contentTypeId, "UTF-8"));
		URL url = new URL(strB.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}

		System.out.println(sb.toString());
		rd.close();
		conn.disconnect();

		return sb.toString();
	}

	public String getcat2(String contentTypeId, String cat1) throws IOException {
		StringBuilder urlBuilder = new StringBuilder(
				"http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode"); /* URL */
		urlBuilder.append(
				"?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + SiteContance.KEY_TOUR_API); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
				+ URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
		urlBuilder.append(
				"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 현재페이지번호 */
		urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "="
				+ URLEncoder.encode("ETC", "UTF-8")); /* IOS(아이폰), AND(안드로이드), WIN(원도우폰), ETC */
		urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "="
				+ URLEncoder.encode("AppTest", "UTF-8")); /* 서비스명=어플명 */
		urlBuilder.append("&" + URLEncoder.encode("contentTypeId", "UTF-8") + "="
				+ URLEncoder.encode(contentTypeId, "UTF-8")); /* 관광타입(관광지, 숙박 등) ID */
		urlBuilder
				.append("&" + URLEncoder.encode("cat1", "UTF-8") + "=" + URLEncoder.encode(cat1, "UTF-8")); /* 대분류코드 */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());
		return sb.toString();
	}

	public String getcat3(String contentTypeId, String cat1, String cat2) throws IOException {
		StringBuilder urlBuilder = new StringBuilder(
				"http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode"); /* URL */
		urlBuilder.append(
				"?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + SiteContance.KEY_TOUR_API); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
				+ URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
		urlBuilder.append(
				"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 현재페이지번호 */
		urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "="
				+ URLEncoder.encode("ETC", "UTF-8")); /* IOS(아이폰), AND(안드로이드), WIN(원도우폰), ETC */
		urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "="
				+ URLEncoder.encode("AppTest", "UTF-8")); /* 서비스명=어플명 */
		urlBuilder.append("&" + URLEncoder.encode("contentTypeId", "UTF-8") + "="
				+ URLEncoder.encode(contentTypeId, "UTF-8")); /* 관광타입(관광지, 숙박 등) ID */
		urlBuilder
				.append("&" + URLEncoder.encode("cat1", "UTF-8") + "=" + URLEncoder.encode(cat1, "UTF-8")); /* 대분류코드 */
		urlBuilder.append(
				"&" + URLEncoder.encode("cat2", "UTF-8") + "=" + URLEncoder.encode(cat2, "UTF-8")); /* 중분류코드(cat1필수) */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());
		return sb.toString();
	}

	public String getSearch(String cmd, HttpServletRequest request) throws Exception {
		StringBuilder strB = this.getUrl(cmd, "10");
		
		strB.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode(request.getParameter("areaCode"), "UTF-8"));/*지역코드*/
		strB.append("&" + URLEncoder.encode("sigunguCode","UTF-8") + "=" + URLEncoder.encode(request.getParameter("sigunguCode"), "UTF-8")); /*시군구코드(areaCode 필수)*/
		strB.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(request.getParameter("contentTypeId"), "UTF-8")); /*관광타입(관광지, 숙박 등) ID*/
		strB.append("&" + URLEncoder.encode("cat1","UTF-8") + "=" + URLEncoder.encode(request.getParameter("cat1"), "UTF-8")); /*대분류 코드*/
		strB.append("&" + URLEncoder.encode("cat2","UTF-8") + "=" + URLEncoder.encode(request.getParameter("cat2"), "UTF-8")); /*중분류 코드(cat1필수)*/
		strB.append("&" + URLEncoder.encode("cat3","UTF-8") + "=" + URLEncoder.encode(request.getParameter("cat3"), "UTF-8")); /*소분류 코드(cat1,cat2필수)*/
		strB.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(request.getParameter("pageNo"), "UTF-8"));/*현재 페이지 번호*/

		System.out.println(strB.toString());
		URL url = new URL(strB.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}

		System.out.println("뽑은 결과 좀 보자ㅠㅠ:  " + sb.toString());
		rd.close();
		conn.disconnect();

		return sb.toString();
	}
	
	
	
//	public String getSearch(String cmd,String areaCode, String sigunguCode, String contentTypeId, String cat1, String cat2, String cat3) throws Exception {
//		StringBuilder strB = this.getUrl(cmd, "10");
//		
//		strB.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode(areaCode, "UTF-8")); /*지역코드*/
//		strB.append("&" + URLEncoder.encode("sigunguCode","UTF-8") + "=" + URLEncoder.encode(sigunguCode, "UTF-8")); /*시군구코드(areaCode 필수)*/
//		strB.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(contentTypeId, "UTF-8")); /*관광타입(관광지, 숙박 등) ID*/
//		strB.append("&" + URLEncoder.encode("cat1","UTF-8") + "=" + URLEncoder.encode(cat1, "UTF-8")); /*대분류 코드*/
//		strB.append("&" + URLEncoder.encode("cat2","UTF-8") + "=" + URLEncoder.encode(cat2, "UTF-8")); /*중분류 코드(cat1필수)*/
//		strB.append("&" + URLEncoder.encode("cat3","UTF-8") + "=" + URLEncoder.encode(cat3, "UTF-8")); /*소분류 코드(cat1,cat2필수)*/
//
//		System.out.println(strB.toString());
//		URL url = new URL(strB.toString());
//		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//		conn.setRequestMethod("GET");
//		conn.setRequestProperty("Content-type", "application/json");
//		System.out.println("Response code: " + conn.getResponseCode());
//		BufferedReader rd;
//		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
//			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//		} else {
//			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
//		}
//		StringBuilder sb = new StringBuilder();
//		String line;
//		while ((line = rd.readLine()) != null) {
//			sb.append(line);
//		}
//
//		System.out.println(sb.toString());
//		rd.close();
//		conn.disconnect();
//
//		return sb.toString();
//	}
	
	
	
}
