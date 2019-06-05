package com.kitri.recomand.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kitri.TestJson.JsonObject;
import com.kitri.api.tour.service.TourResionCodeService;
import com.kitri.dto.*;
import com.kitri.tripbasic.dao.TripBasicDao;
import com.kitri.util.MoveURL;

/**
 * Servlet implementation class recomand
 */
@WebServlet("/recomand")
public class RecomandServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PageBean<TripBasicDTO> pagebean;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
//	https://dpdpwl.tistory.com/60 json 파싱
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
//		System.out.println("RecomandServlet doPost");

		String jsonStr = request.getParameter("jsonData");
		System.out.println("RecomandServlet:" + jsonStr);

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = null;
		JSONArray jsonArray = new JSONArray();
		try {
			jsonObj = (JSONObject) jsonParser.parse(jsonStr);
						
//			System.out.println(jsonObj.toJSONString());
			String season = (String) jsonObj.get("season");
			String theme = (String) jsonObj.get("theme");
			String city = (String) jsonObj.get("city");
			System.out.println("RecomandServlet city: "+ city);
			String s_length = (String) jsonObj.get("start_day");
			String e_length = (String) jsonObj.get("end_day");

			int start_length = 1;
			int end_length = Integer.MAX_VALUE;
			if (s_length != null) {
				start_length = Integer.parseInt(s_length);
			}
			if (e_length != null) {
				end_length = Integer.parseInt(e_length);
			}
			//지역코드 맵

			Map<String, Object> cityMap = (Map<String, Object>) jsonObj.get("cityMap");
//			System.out.println("RecomandServlet" + cityMap.toString());
			int loc_id=-1;
			for(String key: cityMap.keySet()) {
//				System.out.println("key: " + key);
//				System.out.println( cityMap.get(key));
				if(cityMap.get(key).equals(city)) {
					loc_id=Integer.parseInt(key);
				}
			}
//			cityMap.get(city);
			
//			System.out.println("RecomandServlet "+ season +" "+ theme+" "+city+" "+day);
			List<TripBasicDTO> basicList = TripBasicDao.getInstance().select(season, theme, loc_id, start_length, end_length);
		
			
			
			System.out.println("RecomandServlet basicList.size():" + basicList.size());
			int cntPerPage = 2; // 한페이지당 표현할 아이템 개수
			int totalCnt = basicList.size();// 총 목록 개수
			int cntPerPageGroup = 4; // 표현할 그룹 개수
			int currentPage = 1;
			String curpage = (String) jsonObj.get("current_page");
			if (curpage != null) {
				System.out.println("curpage" + curpage);
				currentPage = Integer.parseInt(curpage);
			}
			System.out.println("RecomandServlet currentPage:" + currentPage);
			
			String url = "/tayorecomand/recomand_filter_result.jsp";
			pagebean = new PageBean<TripBasicDTO>(cntPerPage, totalCnt, cntPerPageGroup, currentPage, url);
			basicList = TripBasicDao.getInstance().select(season, theme,loc_id, start_length, end_length,
					pagebean.getStartRow(), pagebean.getEndRow());
			
			System.out.println("--------------------------------");
			System.out.println(basicList.toString());
			for (int i = 0; i < basicList.size(); i++) {
				Set<Integer> locSet=new TreeSet<Integer>();
				List<TripDetailDTO> detailList = basicList.get(i).getDetailList();
				for (int j = 0; j < detailList.size(); j++) {
					locSet.add(detailList.get(j).getLoc_id());
					System.out.println("발견 지역 코드: " +detailList.get(j).getLoc_id());
					if(detailList.get(j).getLoc_id()==1) {
						System.out.println("!!!!!!! 1 발견");
					}
				}
				basicList.get(i).setLoc_set(locSet);
				System.out.println("locSet:"+locSet.toString());
				Iterator<Integer> itor= locSet.iterator();
				while(itor.hasNext()) {
					System.out.println("next: "+itor.next());
				}
				
			}
			
			
			pagebean.setList(basicList);
//			System.out.println(basicList.size());

			request.setAttribute("cityMap", cityMap);
			request.setAttribute("pagebean", pagebean);
//			request.setAttribute("jsonStr", jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		// 테스트용 모든 리스트 출력해보기
//		List<TripBasicDTO> list = TripBasicDao.getInstance().selectAll();
//		System.out.println("RecomandServlet listSize: " +list.size());
//		request.setAttribute("filteredList", list);
		// 결과 출력

//			System.out.println("url:"+pagebean.getUrl());
		MoveURL.forward(request, response, pagebean.getUrl());
	}

}

