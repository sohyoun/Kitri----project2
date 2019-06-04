package com.kitri.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.model.service.AdminService;
import com.kitri.admin.model.service.MemberListService;
import com.kitri.dto.*;

@WebServlet("/memberlist")
public class AdminMemberContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberListService memberListService;
	
	public AdminMemberContoller() {
		memberListService = new MemberListService();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("servlet == 들어옴");
		request.setCharacterEncoding("UTF-8");
		
		//가입된 총 회원 수 
		int joindateTotalCnt = memberListService.getJoindateCnt();
		//System.out.println(joindateTotalCnt);
		
		request.setAttribute("joindateTotalCnt", joindateTotalCnt);
		
		//블랙리스트 회원 수 
		int backTotalCnt = memberListService.getBlackCnt();
		//System.out.println("블랙회원 수 : " + backTotalCnt);
		
		request.setAttribute("backTotalCnt", backTotalCnt);
		
		//회원목록테이블 
		List<MemberBoard> list = memberListService.memeberAll();
		request.setAttribute("memberlist", list);
		//==================================================

		String cp = request.getParameter("currentPage");
		
		int currentPage = 1;
//		System.out.println("cp == " + cp );
//		
		 if(cp != null) { 
			 currentPage = Integer.parseInt(cp); 
			} else {
//				System.out.println("에러");
			}
		
			//System.out.println("cp == " + cp);
			int cntPage = 10;
			int totalCnt = memberListService.getTotalCnt();
			int cntPerPageGroup = 5;
			
			String url = "memberlistresult.jsp";
			MemberListDTO memberListDTO = new MemberListDTO(cntPage, totalCnt, cntPerPageGroup, url, currentPage);
			//System.out.println("startPage " + memberListDTO.getStartPage());
			
			List<MemberBoard> boardlist = memberListService.findByRows(memberListDTO.getStartRow(), memberListDTO.getEndRow());
			
			//System.out.println("페이징처리할 리스트: " + boardlist);
			
			request.setAttribute("boardlist", boardlist);
			request.setAttribute("pagination", memberListDTO);
		
			//System.out.println("list == " + list);
			String path = "/tayoadmin/memberlistresult.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(path);
			rd.forward(request, response);
		
	}
}
