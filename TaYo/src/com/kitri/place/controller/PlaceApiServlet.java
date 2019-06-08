package com.kitri.place.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitri.api.tour.service.TourResionCodeService;
import com.kitri.dto.TripBasicDTO;
import com.kitri.util.MoveURL;
import com.kitri.util.SiteContance;


@WebServlet("/api")
public class PlaceApiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PlaceApiBackendController backendController;
	private TourResionCodeService codeService;
	
	public PlaceApiServlet() {
		backendController = new PlaceApiBackendController();
		codeService = new TourResionCodeService();
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act");
		String path = "/index.jsp";
		
		if ("searchTour".equals(act)) {
			String result = backendController.getKeywordSearch(request, response);
			request.setAttribute("result", result);
			
			MoveURL.forward(request, response, "/tayoplace/searchTourResult.jsp");
		}
	}
}
