package com.kitri.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.service.GonggiService;
import com.kitri.dto.GonggiBoardDTO;
import com.kitri.dto.JavaBean;

@WebServlet("/gonggilist")
public class GonggiListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private GonggiService gonggiService;

	public GonggiListController() {
		gonggiService = new GonggiService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println("공지리스트 서블릿 들어옴 ");
		String cp = request.getParameter("currentPage");

		int currentPage = 1;

		if (cp != null) {
			currentPage = Integer.parseInt(cp);
		}
		
		int cntPage = 10;
		int totalCnt = gonggiService.getTotalCnt();
		int cntPageGroup = 5;
		
		String url = "gonggilist";
		JavaBean javaBean = new JavaBean(cntPage, totalCnt, cntPageGroup, url, currentPage);
		
		List<GonggiBoardDTO> glist = gonggiService.selectGonggi(javaBean.getStartRow(), javaBean.getEndRow());
		
		javaBean.setGlist(glist);
		
		request.setAttribute("glist", javaBean.getGlist());
		//System.out.println("공지리스트 ==" + javaBean);
		
		String path = "/tayoadmin/glistresult.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
