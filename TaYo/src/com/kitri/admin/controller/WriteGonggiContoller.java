package com.kitri.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.service.GonggiService;
import com.kitri.dto.GonggiBoardDTO;


@WebServlet("/writegongi")
public class WriteGonggiContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	private GonggiService gonggiService;
	
    public WriteGonggiContoller() {
    	gonggiService = new GonggiService();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("공지 글쓰기 서블릿 ");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html; charset=utf-8");
		
		String gboard_object = request.getParameter("gboard_group");
		String gboard_subject = request.getParameter("gboard_subject");
		String gboard_writer = request.getParameter("gboard_writer");
		String gboard_contents = request.getParameter("gboard_contents");
		
		GonggiBoardDTO gonggiBoard = new GonggiBoardDTO();
		
		gonggiBoard.setGboard_subject(gboard_subject);
		gonggiBoard.setGboard_group(gboard_object);
		gonggiBoard.setGboard_writer(gboard_writer);
		gonggiBoard.setGboard_contents(gboard_contents);
		
		GonggiBoardDTO writegb = gonggiService.writer(gonggiBoard);

		//System.out.println("공지사항 글쓰기 목록 == " + goBoard);
		
		request.setAttribute("writegb", writegb);
		
		String path = "/tayoadmin/writergonggiresult.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	
	}

}
