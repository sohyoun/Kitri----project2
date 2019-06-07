package com.kitri.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.kitri.admin.model.service.AdminService;
import com.kitri.dto.AdminDTO;

@WebServlet("/adminlogin")
public class AdminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private AdminService adminService;
	
	public AdminLoginController(	) {
		adminService = new AdminService();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("들어옴?여기 서블릿?");
		//String root = request.getContextPath();
		//System.out.println(root);
		
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");

		AdminDTO login = adminService.login(email, pass);
		HttpSession session = request.getSession();

		session.removeAttribute("email");
		//System.out.println(login.toString());
		
		if(login != null && pass.equals(login.getAdmin_pass())) {
			System.out.println("로그인 성공이여요!!");
			session.setAttribute("loginInfo", email);
			String path = "/tayoadmin/index.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(path);
			rd.forward(request, response);
			
		} else {
			System.out.println("로그인 실패했으니 그대로 있으소 !");
			String path = "/TaYo/index.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(path);
			rd.forward(request, response);
		}
	
	}

}
