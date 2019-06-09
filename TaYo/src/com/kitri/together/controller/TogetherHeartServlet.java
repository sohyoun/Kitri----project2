package com.kitri.together.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.together.service.TogetherService;


@WebServlet("/togetherheart")
public class TogetherHeartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private TogetherService service;
    
    public TogetherHeartServlet() {
        service = new TogetherService();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tripSeq = Integer.parseInt(request.getParameter("tripSeq"));
		int likeCount = Integer.parseInt(request.getParameter("likeCount"));
		int heart = Integer.parseInt(request.getParameter("heart"));
		System.out.println(heart);
		service.updateLikeCount(tripSeq,likeCount,heart);
		System.out.println("더하고뺀 후 likeCount : " + likeCount);
	}

	

}
