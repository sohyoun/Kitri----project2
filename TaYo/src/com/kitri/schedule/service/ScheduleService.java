package com.kitri.schedule.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import com.kitri.dto.TripBasicDTO;
import com.kitri.schedule.dao.ScheduleDao;
import com.kitri.util.SiteContance;


public class ScheduleService {

	private ScheduleDao dao;
	
	public ScheduleService() {
		dao = new ScheduleDao();
	}
	
	
	public String getKeywordSearch(String location, String place) throws IOException {
		StringBuilder urlString = new StringBuilder();
		StringBuilder result = new StringBuilder();
		
		urlString.append(SiteContance.TOUR_REQUEST_SITE + "searchKeyword?");		// 키워드로 검색
		urlString.append("ServiceKey="+SiteContance.SERVICE_KEY+"&");				// 서비스 키
		urlString.append("numOfRows="+"50"+"&");									// 페이지 내의 결과 수
		urlString.append("pageNo="+"1"+"&");										// 현재 페이지
		urlString.append("MobileOS=ETC&");											// IOS(아이폰), AND(안드로이드), WIN(원도우폰), ETC
		urlString.append("MobileApp=AppTest&");										// 모바일 앱 = 앱 이름
		urlString.append("listYN="+"Y"+"&");										// 목록 구분 = (Y=목록, N=개수)
		urlString.append("arrange="+"A"+"&");										// 정렬 = (A=제목순, B=조회순, C=수정일순, D=생성일순)
		urlString.append("contentTypeId="+"12"+"&");								// 관광타입(관광지, 숙박 등) ID = 12 (관광지)
		urlString.append("areaCode="+Integer.parseInt(location)+"&");				// 지역코드
		urlString.append("keyword="+URLEncoder.encode((place).trim(), "UTF-8"));	// 검색할 키워드 (한글인 경우 UTF-8 인코딩 필수)
		
		URL url = new URL(urlString.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		
		BufferedReader reader;
		if ((conn.getResponseCode() >= 200) && (conn.getResponseCode() <= 300)) {
            reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        } else {
            reader = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
        }
		
		String line;
		while ((line = reader.readLine()) != null) {
            result.append(line);
        }
		
		reader.close();
        conn.disconnect();
		
		return result.toString();
	}

	public int insert(TripBasicDTO basicDTO) {
		return dao.insert(basicDTO);
	}

	public List<TripBasicDTO> searchPlan(String email, String type) {
		return dao.search(email, type);
	}
	
	public int delete(String email, String title) {
		return dao.delete(email, title);
	}

	public TripBasicDTO findByTitle(String email, String title) {
		return dao.find(email, title);
	}
}
