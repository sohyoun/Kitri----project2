package com.kitri.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.model.service.GonggiService;
import com.kitri.dto.GonggiBoardDTO;


@WebServlet("/gonggi")
public class GonggiContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	private GonggiService gonggiService;
	
    public GonggiContoller() {
    	gonggiService = new GonggiService();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String subject = request.getParameter("subject");
		String object = request.getParameter("group");
		String writer = request.getParameter("writer");
		String contents = request.getParameter("contents");
		
		GonggiBoardDTO gonggiBoard = new GonggiBoardDTO();
		
		gonggiBoard.setGboard_subject(subject);
		gonggiBoard.setGboard_group(object);
		gonggiBoard.setGboard_writer(writer);
		gonggiBoard.setGboard_contents(contents);
		
		GonggiBoardDTO goBoard = gonggiService.writer(gonggiBoard);

		System.out.println("공지사항 글쓰기 목록 == " + goBoard);
		
		request.setAttribute("goboard", goBoard);
		
		String path = "/tayoadmin/gonggilistresult.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	
	}

}