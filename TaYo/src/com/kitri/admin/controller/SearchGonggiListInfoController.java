package com.kitri.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.service.GonggiService;
import com.kitri.dto.GonggiBoardDTO;

@WebServlet("/searchgongi")
public class SearchGonggiListInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private GonggiService gonggiService;

	public SearchGonggiListInfoController() {
		gonggiService = new GonggiService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("공지 & 신고 검색 서블릿 들어오는거 성공!");

		String search = request.getParameter("search");
		String value = request.getParameter("value");

		System.out.println("안들어옴?");
		System.out.println("gonggiSearch ==" + search);
		System.out.println("value== " + value);

		List<GonggiBoardDTO> gslist = gonggiService.getGonggiSearch(search, value);

		request.setAttribute("gslist", gslist);

		String path = "/tayoadmin/gslistresult.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
}
