package com.kitri.api.tour.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.api.tour.service.TourCateService;
import com.kitri.util.MoveURL;


@WebServlet("/tourcate")
public class TourCateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TourCateService tourcateService; 
    
    public TourCateServlet() {
        super();
        tourcateService= new TourCateService();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("tourcate doGet");
		
	    String result = tourcateService.getTourCate();
	    request.setAttribute("result",result);
	    
	    String path="/apitour/catetestresult.jsp";
		MoveURL.forward(request, response, path );

	}


}
