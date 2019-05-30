package com.kitri.schedule.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.schedule.service.ScheduleService;
import com.kitri.util.MoveURL;
import com.kitri.util.SiteContance;


@WebServlet("/schedule")
public class ScheduleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ScheduleBackendController backendController;
	private ScheduleService service;
	
	public ScheduleController() {
		backendController = new ScheduleBackendController();
		service = new ScheduleService();
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act");
		String path = "/index.jsp";
		
		if ("schedule".equals(act)) {
			MoveURL.redirect(request, response, "/tayoschedule/schedule.jsp");
		} else if ("newschedule".equals(act)) {
			MoveURL.redirect(request, response, "/tayoschedule/scheduleDetail.jsp");
		} else if ("overall".equals(act)) {
			MoveURL.redirect(request, response, "/tayoschedule/planOverall.jsp");
		} else if ("planTable".equals(act)) {
			MoveURL.redirect(request, response, "/tayoschedule/planTable.jsp");
		} else if ("planMap".equals(act)) {
			MoveURL.redirect(request, response, "/tayoschedule/planMap.jsp");
		} else if ("myschedule".equals(act)) {
			MoveURL.redirect(request, response, "/tayoschedule/planTemplate.jsp");
		} else if ("searchTour".equals(act)) {
			String location = request.getParameter("location");
			String place = request.getParameter("place");
			
			String result = service.getKeywordSearch(location, place);
			request.setAttribute("result", result);
			
			MoveURL.forward(request, response, "/tayoschedule/searchTourResult.jsp");
		} else if ("savePlan".equals(act)) {
			backendController.temporarySavePlan(request, response);
			
			MoveURL.redirect(request, response, "/tayoschedule/planTemplate.jsp");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(SiteContance.ENCODE);
		doGet(request, response);
	}
}
