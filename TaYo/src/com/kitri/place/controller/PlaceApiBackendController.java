package com.kitri.place.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitri.dto.TripBasicDTO;
import com.kitri.dto.TripDetailDTO;
import com.kitri.place.service.PlaceService;
import com.kitri.schedule.service.ScheduleService;


public class PlaceApiBackendController {
	
	private PlaceService service;
	
	public PlaceApiBackendController() {
		service = new PlaceService();
	}
	
	
	public String getKeywordSearch(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String location = request.getParameter("location");
		String place = request.getParameter("place");
		
		return service.getKeywordSearch(location, place);
	}
	
}
