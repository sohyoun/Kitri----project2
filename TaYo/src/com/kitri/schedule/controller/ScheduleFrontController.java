package com.kitri.schedule.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.util.MoveURL;
import com.kitri.util.SiteContance;


@WebServlet("/schedule")
public class ScheduleFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act");
		String path = "/index.jsp";
		
		if ("schedule".equals(act)) {
			MoveURL.redirect(request, response, "/tayoschedule/schedule.jsp");
		} else if ("newschedule".equals(act)) {
			MoveURL.redirect(request, response, "/tayoschedule/scheduleDetail.jsp");
		} else if ("overall".equals(act)) {
			MoveURL.redirect(request, response, "/tayoschedule/planOverall.jsp");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(SiteContance.ENCODE);
		doGet(request, response);
	}
}
