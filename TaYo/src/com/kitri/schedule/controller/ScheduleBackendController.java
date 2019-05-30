package com.kitri.schedule.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.dto.TripBasicDTO;
import com.kitri.dto.TripDetailDTO;


public class ScheduleBackendController {
	
	public void temporarySavePlan(HttpServletRequest request, HttpServletResponse response) {
		StringTokenizer st;
		List<TripDetailDTO> list = new ArrayList<TripDetailDTO>();
		
		Date start = null;
		Date end = null;
		int person = Integer.parseInt(request.getParameter("person"));
		String email = "test@kitri.re.kr";
		String saveType = request.getParameter("savetype");
		String title = request.getParameter("title");
		String theme = request.getParameter("theme");
		String season = request.getParameter("season");
		String[] plandata = request.getParameterValues("plandata");
		try {
			start = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("start").replace('.', '-'));
			end = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("end").replace('.', '-'));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		TripBasicDTO basicDTO = new TripBasicDTO();
		basicDTO.setEmail(email);
		basicDTO.setTripTitle(title);
		basicDTO.setTripTheme(theme);
		basicDTO.setTripSeason(season);
		basicDTO.setTripNum(person);
		basicDTO.setStartDate(start);
		basicDTO.setEndDate(end);
		basicDTO.setIsComplete(saveType);
		
		TripDetailDTO detailDTO = null;
		
		for (String plan : plandata) {
			detailDTO = new TripDetailDTO();
			st = new StringTokenizer(plan, ",");
			
			while (st.hasMoreTokens()) {
				detailDTO.setTrip_day(Integer.parseInt(st.nextToken()));
				detailDTO.setTrip_order(Integer.parseInt(st.nextToken()));
				detailDTO.setPlace_name(st.nextToken());
				detailDTO.setLoc_id(Integer.parseInt(st.nextToken()));
				detailDTO.setPosX(Float.parseFloat(st.nextToken()));
				detailDTO.setPosY(Float.parseFloat(st.nextToken()));
			}
			
			list.add(detailDTO);
		}
		
		basicDTO.setDetailList(list);
		
		// to be called service
	}
}
