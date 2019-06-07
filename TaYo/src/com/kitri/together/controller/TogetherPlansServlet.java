package com.kitri.together.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.dto.TripDetailDTO;
import com.kitri.together.service.TogetherService;


@WebServlet("/togetherplans")
public class TogetherPlansServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private TogetherService service;
	
	public TogetherPlansServlet() {
		service = new TogetherService();
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("여기온것이냔?");
		int tripSeq = Integer.parseInt(request.getParameter("tripSeq"));
		String dd = request.getParameter("dd");
		String startDate = request.getParameter("startDate");
		String url = request.getParameter("url");
		System.out.println(url);
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date startD = transFormat.parse(startDate);
			//dd-2만큼 for문
			Calendar cal = Calendar.getInstance();
			int num = Integer.parseInt(dd);
			List<String> daylist = new ArrayList<String>();
//			String tripDay[] = new String[num];
			for(int i =0; i<num; i++) {
				cal.setTime(startD);  
				cal.add(Calendar.DATE, i);      //하루 더하기
//				tripDay[i] = transFormat.format(cal.getTime());
				daylist.add(transFormat.format(cal.getTime()));
				System.out.println(daylist);
//				request.setAttribute("tripDay["+i+"]", tripDay[i]);
				request.setAttribute("daylist", daylist);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<TripDetailDTO> list = service.findTripDetail(tripSeq);
		System.out.println(list);
		request.setAttribute("list", list);
		request.setAttribute("tripSeq", tripSeq);
		request.setAttribute("dd", dd);
		String path="/tayotogether/"+url+".jsp";
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}

	

}
