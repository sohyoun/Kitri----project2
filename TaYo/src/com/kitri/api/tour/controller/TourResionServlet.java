package com.kitri.api.tour.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.api.tour.service.TourPositionService;
import com.kitri.api.tour.service.TourResionService;
import com.kitri.util.MoveURL;

/**
 * Servlet implementation class TourResionServlet
 */
@WebServlet("/tourresion")
public class TourResionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	TourResionService tourService;
	@Override
	public void init() throws ServletException {
		tourService = new TourResionService();

	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("tourAPI get");
		String x= request.getParameter("x");
		String y= request.getParameter("y");
		String radius= request.getParameter("radius");
		String result =tourService.getResion();
		System.out.println("TourAPI"+result);
		request.setAttribute("result", result);
		String path = "/apitour/resionresult.jsp";
		MoveURL.forward(request, response, path);
	}

	

}
