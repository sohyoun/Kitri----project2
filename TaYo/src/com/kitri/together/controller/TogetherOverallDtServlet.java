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


@WebServlet("/togetheroveralldt")
public class TogetherOverallDtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private TogetherService service;
    
    public TogetherOverallDtServlet() {
       service = new TogetherService();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tripSeq = Integer.parseInt(request.getParameter("tripSeq"));
		int tripDay = Integer.parseInt(request.getParameter("tripDay"));
		
		List<TripDetailDTO> list = service.findTripDetail(tripSeq,tripDay);
		
		request.setAttribute("list", list);
		String path="/tayotogether/ttOverallDetail.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
		
	}

}
