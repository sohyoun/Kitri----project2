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
import com.kitri.dto.MemberBoard;
import com.kitri.dto.MemberDetailDTO;

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
		
		//System.out.println("list == " + list);
		String path = "/tayoadmin/memberlistresult.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
		
	}
}
