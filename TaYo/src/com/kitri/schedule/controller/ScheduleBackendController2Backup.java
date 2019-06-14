//<<<<<<< HEAD
//package com.kitri.schedule.controller;
//
//import java.io.IOException;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//import java.util.StringTokenizer;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.kitri.dto.TripBasicDTO;
//import com.kitri.dto.TripDetailDTO;
//import com.kitri.schedule.service.ScheduleService;
//
//
//public class ScheduleBackendController {
//	
//	private ScheduleService service;
//	
//	public ScheduleBackendController() {
//		service = new ScheduleService();
//	}
//	
//	
//	public String getKeywordSearch(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		String location = request.getParameter("location");
//		String place = request.getParameter("place");
//		
//		return service.getKeywordSearch(location, place);
//	}
//	
//	public int savePlan(HttpServletRequest request, HttpServletResponse response) {
//		StringTokenizer st;
//		List<TripDetailDTO> list = new ArrayList<TripDetailDTO>();
//		
//		Date start = null;
//		Date end = null;
//		int person = Integer.parseInt(request.getParameter("person"));
//		String email = request.getParameter("email");
//		String saveType = request.getParameter("savetype");
//		String title = request.getParameter("title");
//		String theme = request.getParameter("theme");
//		String season = request.getParameter("season");
//		
//		String[] plandata = request.getParameterValues("plandata");
//		try {
//			start = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("start"));
//			end = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("end"));
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		
//		TripBasicDTO basicDTO = new TripBasicDTO();
//		basicDTO.setEmail(email);
//		basicDTO.setTripTitle(title);
//		basicDTO.setTripTheme(theme);
//		basicDTO.setTripSeason(season);
//		basicDTO.setTripNum(person);
//		basicDTO.setStartDate(start);
//		basicDTO.setEndDate(end);
//		basicDTO.setIsComplete(saveType);
//		
//		
//		TripDetailDTO detailDTO = null;
//		
//		for (String plan : plandata) {
//			detailDTO = new TripDetailDTO();
//			st = new StringTokenizer(plan, ",");
//			
//			while (st.hasMoreTokens()) {
//				detailDTO.setTrip_day(Integer.parseInt(st.nextToken()));
//				detailDTO.setTrip_order(Integer.parseInt(st.nextToken()));
//				detailDTO.setPlace_name(st.nextToken().replace("|", ","));
//				detailDTO.setLoc_id(Integer.parseInt(st.nextToken()));
//				detailDTO.setPosX(Float.parseFloat(st.nextToken()));
//				detailDTO.setPosY(Float.parseFloat(st.nextToken()));
//				detailDTO.setContent_id(Integer.parseInt(st.nextToken()));
//			}
//			
//			list.add(detailDTO);
//		}
//		
//		basicDTO.setDetailList(list);
//		
//		return service.insert(basicDTO);
//	}
//
//	public List<TripBasicDTO> searchPlan(HttpServletRequest request, HttpServletResponse response) {
//		String email = request.getParameter("email");
//		String type = request.getParameter("type");
//		
//		return service.searchPlan(email, type);
//	}
//
//	public int deletePlan(HttpServletRequest request, HttpServletResponse response) {
//		String email = request.getParameter("email");
//		String title = request.getParameter("title");
//		
//		return service.delete(email, title);
//	}
//
//	public TripBasicDTO findByTitle(HttpServletRequest request, HttpServletResponse response) {
//		String email = request.getParameter("email");
//		String title = request.getParameter("title");
//		
//		return service.findByTitle(email, title);
//	}
//
//	public int modifyPlan(HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session = request.getSession();
//		TripBasicDTO sessionBasicDTO = (TripBasicDTO) session.getAttribute("TripBasicDTO");
//		String oldTitle = sessionBasicDTO.getTripTitle();
//		
//		StringTokenizer st;
//		List<TripDetailDTO> list = new ArrayList<TripDetailDTO>();
//		
//		Date start = null;
//		Date end = null;
//		int person = Integer.parseInt(request.getParameter("person"));
//		String email = request.getParameter("email");
//		String saveType = request.getParameter("savetype");
//		String title = request.getParameter("title");
//		String theme = request.getParameter("theme");
//		String season = request.getParameter("season");
//		String[] plandata = request.getParameterValues("plandata");
//		
//		if (oldTitle.trim().equals(title.trim())) {
//			return 0;
//		}
//		
//		try {
//			start = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("start"));
//			end = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("end"));
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		
//		TripBasicDTO basicDTO = new TripBasicDTO();
//		basicDTO.setEmail(email);
//		basicDTO.setTripTitle(title);
//		basicDTO.setTripTheme(theme);
//		basicDTO.setTripSeason(season);
//		basicDTO.setTripNum(person);
//		basicDTO.setStartDate(start);
//		basicDTO.setEndDate(end);
//		basicDTO.setIsComplete(saveType);
//		
//		TripDetailDTO detailDTO = null;
//		
//		for (String plan : plandata) {
//			detailDTO = new TripDetailDTO();
//			st = new StringTokenizer(plan, ",");
//			
//			while (st.hasMoreTokens()) {
//				detailDTO.setTrip_day(Integer.parseInt(st.nextToken()));
//				detailDTO.setTrip_order(Integer.parseInt(st.nextToken()));
//				detailDTO.setPlace_name(st.nextToken().replace("|", ","));
//				detailDTO.setLoc_id(Integer.parseInt(st.nextToken()));
//				detailDTO.setPosX(Float.parseFloat(st.nextToken()));
//				detailDTO.setPosY(Float.parseFloat(st.nextToken()));
//				detailDTO.setContent_id(Integer.parseInt(st.nextToken()));
//			}
//			
//			list.add(detailDTO);
//		}
//		
//		basicDTO.setDetailList(list);
//		
//		return service.modifyBasic(basicDTO, oldTitle);
//	}
//
//	public int modifyDetail(HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session = request.getSession();
//		TripBasicDTO sessionBasicDTO = (TripBasicDTO) session.getAttribute("TripBasicDTO");
//		String title = sessionBasicDTO.getTripTitle();
//		String email = (String) session.getAttribute("loginInfo");
//		int day = Integer.parseInt(request.getParameter("day"));
//		int order = Integer.parseInt(request.getParameter("order"));
//		String detailTitle = request.getParameter("detailtitle");
//		String detailContent = request.getParameter("detailsub");
//		
//		int result =  service.modifyDetail(email, title, day, order, detailTitle, detailContent);
//		
//		if (session != null) {  
//			TripBasicDTO basicDTO = service.findByTitle(email, title);
//			session.removeAttribute("TripBasicDTO");
//			session.setAttribute("TripBasicDTO", basicDTO);
//		}
//		
//		return result;
//	}
//
//
//}
//=======
//
//
//package com.kitri.schedule.controller;
//
//import java.io.IOException;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//import java.util.StringTokenizer;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.kitri.dto.TripBasicDTO;
//import com.kitri.dto.TripDetailDTO;
//import com.kitri.schedule.service.ScheduleService;
//
//
//public class ScheduleBackendController {
//	
//	private ScheduleService service;
//	
//	public ScheduleBackendController() {
//		service = new ScheduleService();
//	}
//	
//	
//	public String getKeywordSearch(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		String location = request.getParameter("location");
//		String place = request.getParameter("place");
//		
//		return service.getKeywordSearch(location, place);
//	}
//	
//	public int savePlan(HttpServletRequest request, HttpServletResponse response) {
//		StringTokenizer st;
//		List<TripDetailDTO> list = new ArrayList<TripDetailDTO>();
//		
//		Date start = null;
//		Date end = null;
//		int person = Integer.parseInt(request.getParameter("person"));
//		String email = request.getParameter("email");
//		String saveType = request.getParameter("savetype");
//		String title = request.getParameter("title");
//		String theme = request.getParameter("theme");
//		String season = request.getParameter("season");
//		
//		String[] plandata = request.getParameterValues("plandata");
//		try {
//			start = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("start"));
//			end = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("end"));
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		
//		TripBasicDTO basicDTO = new TripBasicDTO();
//		basicDTO.setEmail(email);
//		basicDTO.setTripTitle(title);
//		basicDTO.setTripTheme(theme);
//		basicDTO.setTripSeason(season);
//		basicDTO.setTripNum(person);
//		basicDTO.setStartDate(start);
//		basicDTO.setEndDate(end);
//		basicDTO.setIsComplete(saveType);
//		
//		
//		TripDetailDTO detailDTO = null;
//		
//		for (String plan : plandata) {
//			detailDTO = new TripDetailDTO();
//			st = new StringTokenizer(plan, ",");
//			
//			while (st.hasMoreTokens()) {
//				detailDTO.setTrip_day(Integer.parseInt(st.nextToken()));
//				detailDTO.setTrip_order(Integer.parseInt(st.nextToken()));
//				detailDTO.setPlace_name(st.nextToken().replace("|", ","));
//				detailDTO.setLoc_id(Integer.parseInt(st.nextToken()));
//				detailDTO.setPosX(Float.parseFloat(st.nextToken()));
//				detailDTO.setPosY(Float.parseFloat(st.nextToken()));
//				detailDTO.setContent_id(Integer.parseInt(st.nextToken()));
//			}
//			
//			list.add(detailDTO);
//		}
//		
//		basicDTO.setDetailList(list);
//		
//		return service.insert(basicDTO);
//	}
//
//	public List<TripBasicDTO> searchPlan(HttpServletRequest request, HttpServletResponse response) {
//		String email = request.getParameter("email");
//		String type = request.getParameter("type");
//		
//		return service.searchPlan(email, type);
//	}
//
//	public int deletePlan(HttpServletRequest request, HttpServletResponse response) {
//		String email = request.getParameter("email");
//		String title = request.getParameter("title");
//		
//		return service.delete(email, title);
//	}
//
//	public TripBasicDTO findByTitle(HttpServletRequest request, HttpServletResponse response) {
//		String email = request.getParameter("email");
//		String title = request.getParameter("title");
//		
//		return service.findByTitle(email, title);
//	}
//
//	public int modifyPlan(HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session = request.getSession();
//		TripBasicDTO sessionBasicDTO = (TripBasicDTO) session.getAttribute("TripBasicDTO");
//		String oldTitle = sessionBasicDTO.getTripTitle();
//		
//		StringTokenizer st;
//		List<TripDetailDTO> list = new ArrayList<TripDetailDTO>();
//		
//		Date start = null;
//		Date end = null;
//		int person = Integer.parseInt(request.getParameter("person"));
//		String email = request.getParameter("email");
//		String saveType = request.getParameter("savetype");
//		String title = request.getParameter("title");
//		String theme = request.getParameter("theme");
//		String season = request.getParameter("season");
//		String[] plandata = request.getParameterValues("plandata");
//		
//		if (oldTitle.trim().equals(title.trim())) {
//			return 0;
//		}
//		
//		try {
//			start = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("start"));
//			end = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("end"));
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		
//		TripBasicDTO basicDTO = new TripBasicDTO();
//		basicDTO.setEmail(email);
//		basicDTO.setTripTitle(title);
//		basicDTO.setTripTheme(theme);
//		basicDTO.setTripSeason(season);
//		basicDTO.setTripNum(person);
//		basicDTO.setStartDate(start);
//		basicDTO.setEndDate(end);
//		basicDTO.setIsComplete(saveType);
//		
//		TripDetailDTO detailDTO = null;
//		
//		for (String plan : plandata) {
//			detailDTO = new TripDetailDTO();
//			st = new StringTokenizer(plan, ",");
//			
//			while (st.hasMoreTokens()) {
//				detailDTO.setTrip_day(Integer.parseInt(st.nextToken()));
//				detailDTO.setTrip_order(Integer.parseInt(st.nextToken()));
//				detailDTO.setPlace_name(st.nextToken().replace("|", ","));
//				detailDTO.setLoc_id(Integer.parseInt(st.nextToken()));
//				detailDTO.setPosX(Float.parseFloat(st.nextToken()));
//				detailDTO.setPosY(Float.parseFloat(st.nextToken()));
//				detailDTO.setContent_id(Integer.parseInt(st.nextToken()));
//			}
//			
//			list.add(detailDTO);
//		}
//		
//		basicDTO.setDetailList(list);
//		
//		return service.modifyBasic(basicDTO, oldTitle);
//	}
//
//	public int modifyDetail(HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session = request.getSession();
//		TripBasicDTO sessionBasicDTO = (TripBasicDTO) session.getAttribute("TripBasicDTO");
//		String title = sessionBasicDTO.getTripTitle();
//		String email = (String) session.getAttribute("loginInfo");
//		int day = Integer.parseInt(request.getParameter("day"));
//		int order = Integer.parseInt(request.getParameter("order"));
//		String detailTitle = request.getParameter("detailtitle");
//		String detailContent = request.getParameter("detailsub");
//		
//		int result =  service.modifyDetail(email, title, day, order, detailTitle, detailContent);
//		
//		if (session != null) {  
//			TripBasicDTO basicDTO = service.findByTitle(email, title);
//			session.removeAttribute("TripBasicDTO");
//			session.setAttribute("TripBasicDTO", basicDTO);
//		}
//		
//		return result;
//	}
//	
//	public void joinTT(HttpServletRequest request, HttpServletResponse response) {
//		String email = request.getParameter("email");
//		int tripSeq = Integer.parseInt(request.getParameter("tripSeq"));
//		
//		service.join(email, tripSeq);
//	}
//	
//	public void outTT(HttpServletRequest request, HttpServletResponse response) {
//		String email = request.getParameter("email");
//		int tripSeq = Integer.parseInt(request.getParameter("tripSeq"));
//		
//		service.out(email, tripSeq);
//	}
//}
//>>>>>>> branch 'master' of https://github.com/sohyoun/Kitri----project2.git
