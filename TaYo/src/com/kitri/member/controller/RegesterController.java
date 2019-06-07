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

import com.kitri.member.service.MemberService;
import com.kitri.util.DBClose;
import com.kitri.util.DBConnection;

@WebServlet("/register")
public class RegesterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService membService;
	

       
 
    public RegesterController() {
        super();
 
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("RegesterController doPost.");

		String name = request.getParameter("name");
		String email = request.getParameter("id");
		String pass = request.getParameter("pass");
		//TODO
		membService.register(name, email, pass, -1, -1, "");
	}

}
