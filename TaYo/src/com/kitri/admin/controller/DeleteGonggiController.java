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
    	
    	int gb_seq = Integer.parseInt(gboard_seq);
    	
    	System.out.println("체크한 gboard_seq == " + gboard_seq);
    	
    	GonggiBoardDTO gonggiBoard = new GonggiBoardDTO();
    	
    	gonggiBoard.setGboard_seq(gb_seq);
    	
    	boolean deletegb = gonggiService.gonggiDelete(gb_seq);
    	
    	if(deletegb) {
    		System.out.println("지우기 성공");
    		request.setAttribute("deletegb", deletegb);
    	}else {
    		System.out.println("지우기 실패");
    		return;
    	}
    	String path = "/tayoadmin/glistreulst.jsp";
    	RequestDispatcher rd = request.getRequestDispatcher(path);
    	rd.forward(request, response);
    	
	}


}
