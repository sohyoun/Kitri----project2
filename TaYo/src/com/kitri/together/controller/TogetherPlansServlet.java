package com.kitri.together.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.dto.TripDetailDTO;
import com.kitri.together.service.TogetherService;


@WebServlet("/togetherplans")
public class TogetherPlansServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private TogetherService service;
	
	public TogetherPlansServlet() {
		service = new TogetherService();
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("여기온것이냔?");
		int tripSeq = Integer.parseInt(request.getParameter("tripSeq"));
		String dd = request.getParameter("dd");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String url = request.getParameter("url");
		System.out.println(url);
		
		List<TripDetailDTO> list = service.findTripDetail(tripSeq);
		
		request.setAttribute("list", list);
		
		request.setAttribute("tripSeq", tripSeq);
		request.setAttribute("dd", dd);
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		String path="/tayotogether/"+url+".jsp";
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}

	

}
