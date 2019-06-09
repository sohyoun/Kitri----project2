package com.kitri.place.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.place.service.PlaceService;
import com.kitri.util.MoveURL;
import com.kitri.util.SiteContance;


@WebServlet("/place")
public class PlaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PlaceService service;
	
	public PlaceServlet() {
		service = new PlaceService();
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act");
		String path = "/index.jsp"; 
		
		
		if ("searchTour".equals(act)) {
			String location = request.getParameter("location");
			String place = request.getParameter("place");			

		
			String result = service.getKeywordSearch(location, place);
			request.setAttribute("result", result);
			
			MoveURL.forward(request, response, "/tayoplace/searchPlaceResult.jsp");
		}
	}

}
