package com.kitri.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitri.member.service.MemberService;
import com.kitri.util.DBClose;
import com.kitri.util.DBConnection;
import com.kitri.util.MoveURL;

@WebServlet("/register")
public class RegesterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService memberService;
 
	@Override
	public void init() throws ServletException {
		memberService = new MemberService();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		System.out.println("RegesterController doPost.");

		String name = request.getParameter("usrname");
		String email = request.getParameter("usremail");
		String pass = request.getParameter("usrpwd");
		String gender= request.getParameter("optradio");
		System.out.println("RegesterController "+ name+" "+email+" "+pass+" "+gender);
		
		String result = memberService.register(name, email, pass, gender);
		HttpSession session = request.getSession();
		if(result == "1") { //회원가입 성공
			session.setAttribute("loginInfo", email);
			System.out.println("RegesterController 회원가입성공");
		}else {//회원가입 실패 -1
			session.removeAttribute("loginInfo");
		}
		request.setAttribute("result", result);
		String path = "/temp/registerresult.jsp";
		MoveURL.forward(request,response, path);
		
	}

}
