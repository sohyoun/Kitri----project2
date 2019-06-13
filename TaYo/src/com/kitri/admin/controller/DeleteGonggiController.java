package com.kitri.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.service.GonggiService;

@WebServlet("/deletegonggi")
public class DeleteGonggiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private GonggiService gonggiService;
	
    public DeleteGonggiController() {
    	gonggiService = new GonggiService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("공지게시글 지우는 서블릿");
    	
    	String gboard_seq = request.getParameter("gboard_seq");
    	
    	//System.out.println("체크한 gboard_seq == " + gboard_seq);
    	
    	
	}


}
