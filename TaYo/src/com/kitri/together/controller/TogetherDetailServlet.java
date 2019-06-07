package com.kitri.together.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.dto.TripDetailDTO;
import com.kitri.together.service.TogetherService;


@WebServlet("/togetherdetail")
public class TogetherDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TogetherService service;
	public TogetherDetailServlet() {
		service = new TogetherService();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//tripSeq, tripTitle, startDate, endDate, nowNum, tripNum, email
		String tripSeq = request.getParameter("tripSeq");					//11
		String tripTitle = request.getParameter("tripTitle");				//부산여행
		String startDate = request.getParameter("startDate");				//2019-06-06
		String endDate = request.getParameter("endDate"); 
		String nowNum = request.getParameter("nowNum");						//2
		String tripNum = request.getParameter("tripNum");					//10
		String email = request.getParameter("email");						//gogo@naver.com
		
		System.out.println("tripSeq : " + tripSeq);
		//여행 기간 구하기-----------------------------------
//		String strTime = "2017-11-13 21:40:15"; 
//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
//		Date d2 = transFormat.parse(strTime);
		int dd =0;
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date startD = transFormat.parse(startDate);
			Date endD = transFormat.parse(endDate);
			long day = endD.getTime()-startD.getTime();
			System.out.println("startD : "+startD);
			System.out.println("endD : "+endD);
			System.out.println("여행기간 : " + (day/1000/60/60/24+1));
			dd = (int)day/1000/60/60/24+1;
			
			Calendar cal = Calendar.getInstance();
	        cal.setTime(startD);
	        cal.add(Calendar.DATE, 1);      //하루 더하기
	        System.out.println(transFormat.format(cal.getTime()));


//			Calendar cal = new GregorianCalendar();
//			cal.setTime(startD);
//			Calendar nextcal = new GregorianCalendar();
//			nextcal.add(cal.DATE, 1);
//			System.out.println("nextcal : " + nextcal.getTime().toString());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//--------------------------------------------------
		
		request.setAttribute("tripSeq", tripSeq);
		request.setAttribute("tripTitle", tripTitle);
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		request.setAttribute("nowNum", nowNum);
		request.setAttribute("tripNum", tripNum);
		request.setAttribute("email", email);
		request.setAttribute("dd", dd);
		
		String path = "/tayotogether/ttPlan.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}

}
