package com.kitri.api.tour.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.api.tour.service.TourCateGoryService;
import com.kitri.api.tour.service.TourExplorerService;
import com.kitri.util.MoveURL;


@WebServlet("/tourexplorer")
public class TourExplorerServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	
	TourExplorerService toExplorerService;
    
    public TourExplorerServlet() {
        super();
        toExplorerService= new TourExplorerService();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("toExplorerService doGet");
		String contentid= request.getParameter("contentid");
		System.out.println(contentid);
	    String result = toExplorerService.getExplorer(contentid);
	    request.setAttribute("result",result);
	    
	    String path="/apitour/explorerresult.jsp";
		MoveURL.forward(request, response, path );

	}


}
