package com.kitri.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.kitri.admin.model.service.MemberListService;
import com.kitri.dto.MemberBoard;

@WebServlet("/searchInfo")
public class SearchMemberListInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberListService memberListService;
       
    public SearchMemberListInfo() {
    	memberListService = new MemberListService();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("검색 서블릿 들어오는거 성공!");
		
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		//전체라고 찍어줘 제발 
		//System.out.println("searchType == " + searchType);
		//검색이라고 찍혀줘 제발
		//System.out.println("keyword == " + keyword);
		
		List<MemberBoard> list = memberListService.getMemberSearch(searchType, keyword);
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("searchType");
		
		if(keyword.equals("")) {
			System.out.println("빈값을 입력함");
			System.out.println("list 검색한 리스트 " + list);
		}else {
			session.setAttribute("searchlist", list);
			searchType.replace("m", "M");
			keyword.replace("f", "F");
		}
		
		String path = "/tayoadmin/memberlistresult.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
		
	}
}
