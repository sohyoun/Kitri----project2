package com.kitri.api.tour.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.api.tour.service.TourPositionService;
import com.kitri.util.MoveURL;

/**
 * Servlet implementation class TourAPI
 */
@WebServlet("/tourposition")
public class TourPositionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	TourPositionService tourService;
	@Override
	public void init() throws ServletException {
		tourService = new TourPositionService();

	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("tourAPI get");
		String x= request.getParameter("x");
		String y= request.getParameter("y");
		String radius= request.getParameter("radius");
		String result =tourService.getPosition(x, y, radius);
		System.out.println("TourAPI"+result);
		request.setAttribute("result", result);
		String path = "/doc/apitest/positionresult.jsp";
		MoveURL.forward(request, response, path);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
