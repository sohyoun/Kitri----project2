package com.kitri.admin.controller;

import java.io.*;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kitri.admin.service.MemberListService;
import com.kitri.dto.MemberBoardDTO;

@WebServlet("/searchInfo")
public class SearchMemberListInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberListService memberListService;

	public SearchMemberListInfoController() {
		memberListService = new MemberListService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("회원 검색 서블릿 들어오는거 성공!");
		// request.setCharacterEncoding("UTF-8");

		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		// 전체라고 찍어줘 제발
		// System.out.println("searchType == " + searchType);
		// 검색이라고 찍혀줘 제발
		// System.out.println("keyword == " + keyword);

		List<MemberBoardDTO> slist = memberListService.getMemberSearch(searchType, keyword);

		request.setAttribute("slist", slist);

		//System.out.println("전체 리스트 " + slist);

		String path = "/tayoadmin/slistresult.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
//				session.setAttribute("searchlist", list);
//				Gson gson = new Gson();
//				String ls = gson.toJson(list);
//				JsonObject jsonObject = new JsonObject();
//				jsonObject.add("ls", gson.toJsonTree(list));
//
//				PrintWriter out = response.getWriter();
//				out.write(ls);
//				System.out.println("검색한 결과값 list ==" + ls);

	}
}
