package com.kitri.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kitri.admin.model.service.MemberListService;
import com.kitri.dto.MemberBoard;

@WebServlet("/searchInfo")
public class SearchMemberListInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberListService memberListService;

	public SearchMemberListInfo() {
		memberListService = new MemberListService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("검색 서블릿 들어오는거 성공!");

		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		// 전체라고 찍어줘 제발
		// System.out.println("searchType == " + searchType);
		// 검색이라고 찍혀줘 제발
		// System.out.println("keyword == " + keyword);

		List<MemberBoard> list = memberListService.getMemberSearch(searchType, keyword);

		HttpSession session = request.getSession();

		session.removeAttribute("searchType");

		if (("true").equals(request.getParameter("search"))) {
				//System.out.println("여기까지 들어옴");
			if (keyword.equals("")) {
				System.out.println("빈값을 입력함");
				System.out.println("전체 리스트 " + list);

				String path = "/tayoadmin/memberlistresult.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(path);
				rd.forward(request, response);
			} else {
				session.setAttribute("searchlist", list);
				searchType.replace("m", "M");
				keyword.replace("f", "F");
				Gson gson = new Gson();
				String ls = gson.toJson(list);
				JsonObject jsonObject = new JsonObject();
				jsonObject.add("ls", gson.toJsonTree(list));

				PrintWriter out = response.getWriter();
				out.write(ls);
				System.out.println("검색한 결과값 list ==" + ls);
				
			}
		}
	}
}
