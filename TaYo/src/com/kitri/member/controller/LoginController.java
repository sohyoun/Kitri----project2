package com.kitri.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.kitri.admin.controller.AdminLoginController;
import com.kitri.admin.model.service.AdminService;
import com.kitri.dto.AdminDTO;
import com.kitri.member.service.MemberService;
import com.kitri.util.MoveURL;


@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService;
	private AdminService adminService;
    @Override
    public void init() throws ServletException {
    	memberService = new MemberService();
		adminService = new AdminService();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email= request.getParameter("email");
		String pass = request.getParameter("pass");
		System.out.println("LoginServlet email" + email + "pass" + pass);
		String result = memberService.login(email, pass);
		
		HttpSession session= request.getSession();
		session.removeAttribute("loginInfo");

		
	
		
		AdminDTO adminDto = adminService.login(email, pass);
		if(pass.equals(adminDto.getAdmin_pass())) {
			System.out.println("관리자로 로그인!!");
			//TODO loginInfo -> memberInfo
			session.setAttribute("loginInfo", email);  
			result="2"; //관리자 로그인
		}
		else if("1".equals(result)) {
			session.setAttribute("loginInfo", email);
		}else if("-1".equals(result)) {
			session.removeAttribute("loginInfo");
			//로그인 실패
		}
		
		request.setAttribute("result", result);
		System.out.println(result);
		String path = "/temp/loginresult.jsp";
		MoveURL.forward(request,response, path);
	}

}
