package com.kitri.api.tour.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.api.tour.service.TourCateGoryService;
import com.kitri.util.MoveURL;

@WebServlet("/tourcategory")
public class TourCateGoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TourCateGoryService tourcateService;

	public TourCateGoryServlet() {
		super();
		tourcateService = new TourCateGoryService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("tourcate doGet");

		String result = tourcateService.getTourCate();
		request.setAttribute("result", result);

		String path = "/apitour/categorytresult.jsp";
		MoveURL.forward(request, response, path);

	}

}
