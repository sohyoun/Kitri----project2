package com.kitri.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.kitri.member.service.MemberService;
import com.kitri.util.MoveURL;


@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService service;

    public LoginController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email= request.getParameter("email");
		String pass = request.getParameter("pass");
		System.out.println("LoginServlet email" + email + "pass" + pass);
		String result = service.login(email, pass);
		
		HttpSession session= request.getSession();
		
		session.removeAttribute("loginInfo");
	
		if("1".equals(result)) {
			session.setAttribute("loginInfo", email);
		}		
		
		request.setAttribute("result", result);
		System.out.println(result);
		String path = "/loginresult.jsp";
		MoveURL.forward(request,response, path);
	}

}
