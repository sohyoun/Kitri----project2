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
import com.kitri.dto.MemberDetailDTO;

@WebServlet("/memberlist")
public class AdminMemberContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AdminService adminService;
	
	public AdminMemberContoller() {
		adminService = new AdminService();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("servlet == 들어옴");
		List<MemberDetailDTO> list = adminService.memeberAll();
		request.setAttribute("memberlist", list);
		
		//System.out.println("list == " + list);
		String path = "/tayoadmin/memberresult.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
}
