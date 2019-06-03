package com.kitri.schedule.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.api.tour.service.TourResionCodeService;
import com.kitri.dto.TripBasicDTO;
import com.kitri.util.MoveURL;
import com.kitri.util.SiteContance;


@WebServlet("/schedule")
public class ScheduleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ScheduleBackendController backendController;
	private TourResionCodeService codeService;
	
	public ScheduleController() {
		backendController = new ScheduleBackendController();
		codeService = new TourResionCodeService();
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
		} else if ("showDetail".equals(act)) {
			MoveURL.forward(request, response, "/tayoschedule/plandetail.jsp");
		} else if ("searchTour".equals(act)) {
			String result = backendController.getKeywordSearch(request, response);
			request.setAttribute("result", result);
			
			MoveURL.forward(request, response, "/tayoschedule/searchTourResult.jsp");
		} else if ("savePlan".equals(act)) {
			int result = backendController.savePlan(request, response);
			String notice = "";
			
			if (result != 0) {
				notice = "성공하였습니다.";
			} else {
				notice = "실패하였습니다.";
			}
			request.setAttribute("notice", notice);
			
			MoveURL.forward(request, response, "/tayoschedule/savePlanResult.jsp");
		} else if ("searchPlan".equals(act)) {
			String areaCodes = codeService.getResionCode();
			request.setAttribute("areaCodes", areaCodes);
			
			List<TripBasicDTO> list = backendController.searchPlan(request, response);
			request.setAttribute("TripBasicDTO", list);
			
			MoveURL.forward(request, response, "/tayoschedule/searchPlanResult.jsp");
		} else if ("planDetail".equals(act)) {
			String email = request.getParameter("email");
			String title = request.getParameter("title");
			
			// Todo
			TripBasicDTO basicDTO = backendController.findByTitle(email, title);
			request.setAttribute("TripBasicDTO", basicDTO);
			
			MoveURL.forward(request, response, "/tayoschedule/plandetail.jsp");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(SiteContance.ENCODE);
		doGet(request, response);
	}
}
