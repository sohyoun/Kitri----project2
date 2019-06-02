package com.kitri.together.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.together.service.TogetherService;


@WebServlet("/togetherdetail")
public class TogetherDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TogetherService service;
	public TogetherDetailServlet() {
		service = new TogetherService();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기옴?");
		String tripseq = request.getParameter("tripseq");
		System.out.println(request.getAttribute("tt.tripseq"));
		
	}
	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("여기옴?");
//		String tripseq = request.getParameter("tripseq");
//		System.out.println(Integer.parseInt(tripseq));
//		
//	}

}
