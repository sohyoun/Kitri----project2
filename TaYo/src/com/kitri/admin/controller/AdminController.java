package com.kitri.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.model.AdminDto;
import com.kitri.admin.model.service.AdminService;
import com.kitri.dto.AdminDTO;

@WebServlet("/login")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private AdminService adminService;
	
	public AdminController(	) {
		adminService = new AdminService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//String root = request.getContextPath();
		//System.out.println(root);
		
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");

		AdminDTO login = adminService.login(email, pass);
		
		if(email != null)
		
		//System.out.println(login.getAdminEmail());
		request.setAttribute("loginInfo", login);
		
		String path = "/tayoadmin/index.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
		
	
	}

}
