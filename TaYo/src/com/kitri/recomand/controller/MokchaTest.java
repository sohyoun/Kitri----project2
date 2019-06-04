package com.kitri.recomand.controller;

import java.util.List;

import com.kitri.api.tour.service.TourResionCodeService;
import com.kitri.dto.PageBean;
import com.kitri.dto.TripBasicDTO;
import com.kitri.tripbasic.dao.TripBasicDao;

public class MokchaTest {
//	public static void main(String[] args) {
//		TourResionCodeService service = new TourResionCodeService();
//		String str = service.getResionCode();
//		System.out.println(str);
//		//1 ,Integer.Maxvalue 이상
//		List<TripBasicDTO> list = TripBasicDao.getInstance().select("여름", "theme", "city", 1, Integer.MAX_VALUE);
//		int cntPerPage = 2; // 한페이지당 표현할 아이템 개수
//		int totalCnt = list.size();// 총 목록 개수
//		int cntPerPageGroup = 4; // 표현할 그룹 개수
//		int currentPage = 3;
//		
////		System.out.println("RecomandServlet currentPage:" + currentPage);
//		PageBean<TripBasicDTO> pagebean = new PageBean<TripBasicDTO>(cntPerPage, totalCnt, cntPerPageGroup, currentPage, "a");
//		list = TripBasicDao.getInstance().select("여름", "", "", 1, Integer.MAX_VALUE,
//				pagebean.getStartRow(), pagebean.getEndRow());
//		pagebean.setList(list);
////		System.out.println("아이템개수" + list.size());
////		System.out.println(pagebean);
//		
//	}
}
