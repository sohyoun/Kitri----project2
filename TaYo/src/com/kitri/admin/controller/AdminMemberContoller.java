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

	private MemberListService MemberListService;
	
	public AdminMemberContoller() {
		MemberListService = new MemberListService();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("servlet == 들어옴");
		request.setCharacterEncoding("UTF-8");
		
		List<MemberBoard> list = MemberListService.memeberAll();
		request.setAttribute("memberlist", list);
		
		System.out.println("list == " + list);
		String path = "/tayoadmin/memberlistresult.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
		
	}
}
