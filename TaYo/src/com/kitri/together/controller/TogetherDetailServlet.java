package com.kitri.together.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.dto.TripDetailDTO;
import com.kitri.together.service.TogetherService;


@WebServlet("/togetherdetail")
public class TogetherDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TogetherService service;
	public TogetherDetailServlet() {
		service = new TogetherService();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//tripSeq, tripTitle, startDate, endDate, nowNum, tripNum, email
		int tripSeq = Integer.parseInt(request.getParameter("tripSeq"));	//11
		String tripTitle = request.getParameter("tripTitle");				//부산여행
		String startDate = request.getParameter("startDate");				//2019-06-06
		String endDate = request.getParameter("endDate");
		String nowNum = request.getParameter("nowNum");						//2
		String tripNum = request.getParameter("tripNum");					//10
		String email = request.getParameter("email");						//gogo@naver.com
		
		List<TripDetailDTO> list = service.findTripDetail(tripSeq);
		request.setAttribute("list", list);
		request.setAttribute("tripTitle", tripTitle);
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		request.setAttribute("nowNum", nowNum);
		request.setAttribute("tripNum", tripNum);
		request.setAttribute("email", email);
		String path = "/tayotogether/.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}

}
