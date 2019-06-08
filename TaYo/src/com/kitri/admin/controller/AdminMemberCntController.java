package com.kitri.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.service.MemberListService;

@WebServlet("/adminmembercnt")
public class AdminMemberCntController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberListService memberListService;

	public AdminMemberCntController() {
		memberListService = new MemberListService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("회원 수 체크 서블릿 들어옴");
		
		// 가입 회원 수
		int joinTotalCnt = memberListService.getJoinCnt();
		System.out.println("가입 회원수 :" + joinTotalCnt);

		// 블랙 회원 수
		int blackTotalCnt = memberListService.getBlackCnt();
		System.out.println("블랙회원 수 :" + blackTotalCnt);
		
//		Map info =  new HashMap<Object, Object>();
//		
//		info.put("joinTotalCnt", joinTotalCnt);
//		info.put("backTotalCnt", blackTotalCnt);
//		
//		request.setAttribute("info", info);
//		
		request.setAttribute("joindateTotalCnt", joinTotalCnt);
		request.setAttribute("blackTotalCnt", blackTotalCnt);

		// 탈퇴 회원 수 
		
		String path = "/tayoadmin/board.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
		
	}

}
