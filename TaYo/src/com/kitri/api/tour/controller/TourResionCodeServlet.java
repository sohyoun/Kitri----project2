package com.kitri.api.tour.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.api.tour.service.TourResionCodeService;
import com.kitri.util.MoveURL;

@WebServlet("/tourresioncode")
public class TourResionCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TourResionCodeService service;

    public TourResionCodeServlet() {
    	service= new TourResionCodeService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("TourResionCodeServlet get");

		String result =service.getResionCode();
//		System.out.println("TourResionCodeServlet"+result);
		request.setAttribute("result", result);
		String path = "/apitour/resioncoderesult.jsp";
		MoveURL.forward(request, response, path);
	}
}
