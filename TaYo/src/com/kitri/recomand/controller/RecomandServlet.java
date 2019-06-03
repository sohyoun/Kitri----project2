package com.kitri.recomand.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.kitri.dto.PageBean;
import com.kitri.dto.TripBasicDTO;
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
//	System.out.println("RecomandServlet doPost");

		String jsonStr = request.getParameter("jsonData");
		System.out.println(jsonStr);
//	System.out.println(RecomandServlet jsonStr);

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = null;
		try {
			jsonObj = (JSONObject) jsonParser.parse(jsonStr);
//		System.out.println(jsonObj.toJSONString());
			String season = (String) jsonObj.get("season");
			String theme = (String) jsonObj.get("theme");
			String city = (String) jsonObj.get("city");
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
//		System.out.println("RecomandServlet "+ season +" "+ theme+" "+city+" "+day);
			List<TripBasicDTO> list = TripBasicDao.getInstance().select(season, theme, city, start_length, end_length);

			String url = "/tayorecomand/recomand_filter_result.jsp";

			int cntPerPage = 2; // 한페이지당 표현할 아이템 개수
			int totalCnt = list.size();// 총 목록 개수
			int cntPerPageGroup = 4; // 표현할 그룹 개수
			int currentPage = 1;
			String curpage =  (String) jsonObj.get("current_page");
			if (curpage != null) {
				System.out.println("curpage" + curpage);
				currentPage = Integer.parseInt(curpage);
			}
			System.out.println("RecomandServlet currentPage:" + currentPage);
			pagebean = new PageBean<TripBasicDTO>(cntPerPage, totalCnt, cntPerPageGroup, currentPage, url);
			list = TripBasicDao.getInstance().select(season, theme, city, start_length, end_length,
					pagebean.getStartRow(), pagebean.getEndRow());
			pagebean.setList(list);
			request.setAttribute("pagebean", pagebean);
			request.setAttribute("jsonStr", jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// 테스트용 모든 리스트 출력해보기
//	List<TripBasicDTO> list = TripBasicDao.getInstance().selectAll();
//	System.out.println("RecomandServlet listSize: " +list.size());
//	request.setAttribute("filteredList", list);
		// 결과 출력

		MoveURL.forward(request, response, pagebean.getUrl());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
